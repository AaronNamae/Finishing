
package com.wingstudioly.guard.controller;

import com.wingstudioly.guard.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


@Controller
public class loginController {
    private final userService userService;
    private final carService carService;

    public loginController(userService userService, carService carService) {
        this.userService = userService;
        this.carService = carService;
    }


    @RequestMapping(value = "/login.html")
    public ModelAndView toLogin(HttpServletRequest request) {
        //先销毁之前的浏览器的session
        request.getSession().invalidate();

        ModelAndView mav = new ModelAndView("login");
        //每天会更新数据库中数据，以免数据过大
        carService.updateCourt();
        mav.addObject("emptySet", carService.getEmptySet());
        return mav;
    }


    @RequestMapping(value = "/api/loginCheck", method = RequestMethod.POST)
    @ResponseBody
    public Object loginCheck(HttpServletRequest request) {
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        HashMap<String, String> res = new HashMap<>();
        if (userService.isAdmin(name, password)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }


    @RequestMapping(value = "/api/loginCheck_Door", method = RequestMethod.POST)
    @ResponseBody
    public Object loginCheck_Door(HttpServletRequest request) {
        String Dname = request.getParameter("Dname");
        String Dpassword = request.getParameter("Dpassword");
        System.out.println(Dname);
        HashMap<String, String> res = new HashMap<>();
        if (userService.isAdmin_Door(Dname, Dpassword)) {
            res.put("stateCode", "1");
            System.out.println("1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }



    @RequestMapping("index.html")
    public String toIndex() {
        return "index";
    }

    @RequestMapping("index_Door.html")
    public ModelAndView toIndex_Door() {
        ModelAndView mav = new ModelAndView("index_Door");
        mav.addObject("emptyC1", carService.getEmptySet());
        return mav;
    }


}
