package com.wingstudioly.guard.controller;

import com.wingstudioly.guard.bean.User;
import com.wingstudioly.guard.bean.Admin;
import com.wingstudioly.guard.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.RandomUtil;
import com.arcsoft.face.FaceInfo;
import com.arcsoft.face.toolkit.ImageFactory;
import com.arcsoft.face.toolkit.ImageInfo;
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
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;


@Controller
public class RegisterController {
    private final userService userService;
    private final carService carService;

    public RegisterController(userService userService, carService carService) {
        this.userService = userService;
        this.carService = carService;
    }

    @RequestMapping(value = "/admin_register.html")
    public ModelAndView toLogin(HttpServletRequest request) {
        //先销毁之前的浏览器的session
        request.getSession().invalidate();

        ModelAndView mav = new ModelAndView("admin_register");

        return mav;
    }


    @RequestMapping(value = "/api/AdminRegisterCheck", method = RequestMethod.POST)
    @ResponseBody
    public Object AdminRegisterCheck(HttpServletRequest request) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String UID = request.getParameter("UID");
        System.out.println(name);
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPassword(password);
        admin.setUID(UID);

        HashMap<String, String> res = new HashMap<>();
        if (userService.isAdmin_R(name)) {
            res.put("stateCode", "2");
        } else {
            if (userService.addAdmin(admin)) {
                res.put("stateCode", "1");
            } else {
                res.put("stateCode", "0");
            }
            return res;

        }
        return res;
    }

    @RequestMapping(value = "/api/AdminRegisterCheck_Door", method = RequestMethod.POST)
    @ResponseBody
    public Object AdminRegisterCheck_D00r(HttpServletRequest request) {
        String Dname = request.getParameter("Dname");
        String Dpassword = request.getParameter("Dpassword");
        String DUID = request.getParameter("DUID");
        System.out.println(Dname);
        Admin_Door admin_Door = new Admin_Door();
        admin_Door.setDname(Dname);
        admin_Door.setDpassword(Dpassword);
        admin_Door.setDUID(DUID);
        System.out.println(admin_Door.getDname());


        HashMap<String, String> res = new HashMap<>();
        if (userService.isAdmin_Door_RD(Dname)) {
            res.put("stateCode", "2");
        } else {
            if (userService.addAdmin_Door(admin_Door)) {
                res.put("stateCode", "1");
                System.out.println("1");
            } else {
                res.put("stateCode", "0");
                System.out.println("0");
            }
            return res;

        }
        return res;
    }

}
