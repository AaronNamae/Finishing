package com.wingstudioly.guard.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import com.wingstudioly.guard.Utils.RadomUtil;
import com.wingstudioly.guard.Utils.photoUtil;
import com.wingstudioly.guard.bean.Car;
import com.wingstudioly.guard.bean.User;
import com.wingstudioly.guard.service.carService;
import com.wingstudioly.guard.service.userService;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;


@RestController
public class IdentityController {
    /*private final RestTemplate template;*/
    private static HttpClient httpClient = HttpClients.createDefault();
    private final carService carService;
    private final userService userService;
    private final static String tmpCarPath = "D:\\毕业论文\\程序设计\\Three\\Entrance_Guard\\guard\\src\\main\\webapp\\static\\img\\tmp_car";

    public IdentityController(carService carService, userService userService) {
        this.carService = carService;
        this.userService = userService;
    }

    private String Array2String(JSONArray tar){
        StringBuffer str5 =new StringBuffer();
        for(Object s:tar){
            str5.append(String.valueOf(s));
        }
        return str5.toString();
    }

    private Map getJson2Map(String url){
        HttpPost post = new HttpPost(url);
        HttpGet get = new HttpGet(url);
        Map map = new HashMap();
        try {
            HttpResponse httpResponse = httpClient.execute(get);

            int status = httpResponse.getStatusLine().getStatusCode();
            if(status == 200){
                HttpEntity entity = httpResponse.getEntity();
                String result = EntityUtils.toString(entity,"UTF-8");

                map = (Map) JSON.parse(result);
                String car_id = Array2String((JSONArray) map.get("car_id")) ;
                map.put("car_id",car_id);
                System.out.println(car_id);
            }else{
                System.out.println("error");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }


    @RequestMapping(value = "/api/test" )
    public Object python_user(){
        String url = "http://localhost:3000/getUser";
        return getJson2Map(url);
    }


    @RequestMapping(value = "/api/recognition_tmpCar")
    public Object recognitionPlate(HttpServletRequest request) {
        String state = request.getParameter("state");
        Map res;

        String radomCarName = RadomUtil.getRandom();
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile mfile = multipartHttpServletRequest.getFile("tmp_car");

        String address = photoUtil.imgSaveOrUpdate(tmpCarPath, mfile, radomCarName);
        String url = "http://localhost:3000/getPlate?imgSrc=";

        try {
            //java中将字符串转换为URL能解析的编码
            address = URLEncoder.encode(address, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
       // while (true) {
            res = getJson2Map(url + address);

            res.put("stateCode", state);
            res.put("img_src", address);


            String car_id = (String) res.get("car_id");
            System.out.println(car_id);
            int status;
            Car car;
            User user;
            //进场
            if (state.equals("1")) {
                if (car_id.length() == 7 ) {
                    if (carService.getCar(car_id) == null) {
                        if (carService.getCar_user(car_id) == null) {
                            //临时车
                            res.put("car_isIN", "0");
                            car = new Car(car_id, new Date(), null, 0);
                            carService.addCar(car);
                        } else {
                            user = carService.getCar_user(car_id);
                            car = new Car(car_id, new Date(), null, user.getStatus());
                            if (car.getStatus() != 1) {
                                res.put("car_isIN", "2");
                                carService.addCar(car);
                            } else {
                                res.put("car_isIN", "1");
                                carService.addCar(car);
                                carService.courtGdIn();
                            }
                        }
                        carService.courtIN();
                    } else {
                        res.put("car_isIN", "-4");
                    }
                } else {
                    res.put("car_isIN", "-3");
                }
            }
            //出场
            if (state.equals("0")) {
                if (car_id.length() == 7 ) {
                    if (carService.getCar(car_id) != null) {
                        car = carService.getCar(car_id);

                        if (car.getStatus() == 1) {
                            carService.deleteCar(car_id);
                            // carService.updateOutCar(car_id);
                            carService.courtGdOut();
                        } else if (car.getStatus() == 2) {
                            carService.deleteCar(car_id);
                        } else {
                            res.put("car_money", String.valueOf(carService.getCarMoney(car)));
                            carService.deleteCar(car_id);
                        }
                        res.put("car_isIN", String.valueOf(car.getStatus()));
                        carService.courtOut();
                    } else {
                        //查无此车
                        res.put("car_isIN", "-1");
                    }
                }else {
                    res.put("car_isIN", "-2");
                }
            }
            return res;

     //   }
    }
}
