/**
 * ClassName: FaceController <br/>
 * Description: <br/>
 * date: 2021/5/9 20:16<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.RandomUtil;
import com.arcsoft.face.FaceInfo;
import com.arcsoft.face.toolkit.ImageFactory;
import com.arcsoft.face.toolkit.ImageInfo;
import com.wingstudioly.guard.Utils.RadomUtil;
import com.wingstudioly.guard.Utils.photoUtil;
import com.wingstudioly.guard.bean.*;
import com.wingstudioly.guard.dto.FaceSearchResDto;
import com.wingstudioly.guard.dto.FaceUserInfo;
import com.wingstudioly.guard.dto.ProcessInfo;
import com.wingstudioly.guard.enums.ErrorCodeEnum;
import com.wingstudioly.guard.service.carService;
import com.wingstudioly.guard.service.faceEngineService;

import com.wingstudioly.guard.service.userService;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wingstudioly.guard.bean.User;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import java.util.*;


@Controller
public class FaceController {
    private final faceEngineService faceEngineService;
    private final userService userService;
    private final carService carService;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    private final static String tmpCarPath = "D:\\毕业论文\\程序设计\\Three\\Entrance_Guard\\guard\\src\\main\\webapp\\static\\img\\photo";


    public FaceController(faceEngineService faceEngineService, com.wingstudioly.guard.service.userService userService, com.wingstudioly.guard.service.carService carService) {
        this.faceEngineService = faceEngineService;
        this.userService = userService;
        this.carService = carService;
    }


    private String base64Process(String base64Str) {
        if (!StringUtils.isEmpty(base64Str)) {
            String photoBase64 = base64Str.substring(0, 30).toLowerCase();
            int indexOf = photoBase64.indexOf("base64,");
            if (indexOf > 0) {
                base64Str = base64Str.substring(indexOf + 7);
            }

            return base64Str;
        } else {
            return "";
        }
    }


    @RequestMapping(value = "/api/photo_ADD")
    public Object AddPhoto(HttpServletRequest request) {
        //String state = request.getParameter("state");
        Map res;

        String radomCarName = RadomUtil.getRandom();
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile mfile = multipartHttpServletRequest.getFile("photo");

        String address = photoUtil.imgSaveOrUpdate(tmpCarPath, mfile, radomCarName);
        //res.put("address",address);
        //return res;
        //return "redirect:/user_register.html";
        return null;
    }


    @RequestMapping(value = "/user_faceAdd.html", method = RequestMethod.POST)
    public String faceAdd(HttpServletRequest request, User user) {

        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile mfile = multipartHttpServletRequest.getFile("photo");
       // Car_set car_set;

        byte[] decode ;
        try {
            decode = mfile.getBytes();
            ImageInfo imageInfo = ImageFactory.getRGBData(decode);


            //人脸特征获取
            byte[] bytes = faceEngineService.extractFaceFeature(imageInfo);

            UserFaceInfo userFaceInfo = new UserFaceInfo();
            userFaceInfo.setName(user.getName());
            userFaceInfo.setFaceFeature(bytes);
            userFaceInfo.setFaceId(RandomUtil.randomString(10));



            //人脸特征插入到数据库
            userService.insertSelective(userFaceInfo);

            userService.addUser(user);


            if(user.getTax_year() != 0){
                Date dt = new Date();
                Calendar rightNow = Calendar.getInstance();
                rightNow.setTime(dt);
                rightNow.add(Calendar.MONTH,user.getTax_year()*3);
                Date dt1 = rightNow.getTime();

                carService.addCar_set(new Car_set(user.getCar_id(),user.getTax_year(),user.getStatus(),dt1));
                if(user.getStatus()== 1){carService.courtAll();}
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return "redirect:/manage_user.html";
    }

    /*
    人脸对比
     */
    @RequestMapping(value = "/faceSearch", method = RequestMethod.POST)
    @ResponseBody
    public Result<FaceSearchResDto> faceSearch(String file) throws Exception {

        byte[] decode = Base64.decode(base64Process(file));
        BufferedImage bufImage = ImageIO.read(new ByteArrayInputStream(decode));
        ImageInfo imageInfo = ImageFactory.bufferedImage2ImageInfo(bufImage);

        //人脸特征获取
        byte[] bytes = faceEngineService.extractFaceFeature(imageInfo);
        if (bytes == null) {
            return Results.newFailedResult(ErrorCodeEnum.NO_FACE_DETECTED);
        }
        //人脸比对，获取比对结果
        List<FaceUserInfo> userFaceInfoList = faceEngineService.compareFaceFeature(bytes);

        if (CollectionUtil.isNotEmpty(userFaceInfoList)) {
            //获取最高相似度的人脸信息
            FaceUserInfo faceUserInfo = userFaceInfoList.get(0);

            FaceSearchResDto faceSearchResDto = new FaceSearchResDto();
            BeanUtil.copyProperties(faceUserInfo, faceSearchResDto);

            List<ProcessInfo> processInfoList = faceEngineService.process(imageInfo);

            if (CollectionUtil.isNotEmpty(processInfoList)) {
                //人脸检测
                List<FaceInfo> faceInfoList = faceEngineService.detectFaces(imageInfo);
                int left = faceInfoList.get(0).getRect().getLeft();
                int top = faceInfoList.get(0).getRect().getTop();
                int width = faceInfoList.get(0).getRect().getRight() - left;
                int height = faceInfoList.get(0).getRect().getBottom() - top;

                Graphics2D graphics2D = bufImage.createGraphics();
                graphics2D.setColor(Color.RED);//红色
                BasicStroke stroke = new BasicStroke(5f);
                graphics2D.setStroke(stroke);
                graphics2D.drawRect(left, top, width, height);
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                ImageIO.write(bufImage, "jpg", outputStream);

                byte[] bytes1 = outputStream.toByteArray();
                faceSearchResDto.setImage("data:image/jpeg;base64," + Base64Utils.encodeToString(bytes1));
                faceSearchResDto.setAge(processInfoList.get(0).getAge());
                faceSearchResDto.setGender(processInfoList.get(0).getGender().equals(1) ? "女" : "男");

            }
            //返回匹配到人脸的数据
            return Results.newSuccessResult(faceSearchResDto);
        }
        //返回没有匹配到人脸
        return Results.newFailedResult(ErrorCodeEnum.FACE_DOES_NOT_MATCH);
    }
}
