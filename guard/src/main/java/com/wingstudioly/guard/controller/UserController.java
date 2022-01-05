package com.wingstudioly.guard.controller;

import com.wingstudioly.guard.bean.Car_set;
import com.wingstudioly.guard.bean.User;
import com.wingstudioly.guard.bean.Admin;
import com.wingstudioly.guard.bean.Admin_Door;
import com.wingstudioly.guard.service.carService;
import com.wingstudioly.guard.service.userService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.*;



@Controller
public class UserController {
    private final userService userService;
    private final carService carService;

    public UserController(userService userService, carService carService) {
        this.userService = userService;
        this.carService = carService;
    }

    @RequestMapping("addUser.html")
    public String toAddUser() {
        return "user_register";
    }




    @RequestMapping("user_update.html")
    public ModelAndView toUpdateUser(HttpServletRequest request) {
        long per_id = Long.parseLong(request.getParameter("per_id"));

        User user = userService.getUser(per_id);

        ModelAndView mav = new ModelAndView("user_update");
        mav.addObject("user", user);
        return mav;
    }

    @RequestMapping("user_update_do.html")
    //会自动包装城User类型
    public String UpdateUser(HttpServletRequest request, User user) {
        userService.editUser(user);
        Car_set car_set=carService.getCar_set(user.getCar_id());
        Date dt = car_set.getTax_Date();
        Calendar rightNow = Calendar.getInstance();
        rightNow.setTime(dt);
        rightNow.add(Calendar.MONTH,user.getTax_year()*3);
        Date dt1 = rightNow.getTime();
        User user1 = userService.getUser(user.getPer_id());
        carService.deleteCar_set(user.getCar_id());
        carService.addCar_set(new Car_set(user1.getCar_id(),user1.getTax_year(),user1.getStatus(),dt1));
       // carService.editCar_set(user.getTax_year(),user.getCar_id());
        if(user.getStatus() == 0){
            carService.deleteCar(user.getCar_id());
        }else{
            String old_car = request.getParameter("old_car");
            carService.updateCar_set(old_car, user.getCar_id());
        }
        return "redirect:/manage_user.html";
    }

    @RequestMapping("deleteUser.html")
    public String deleteUser(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String per_id = request.getParameter("per_id");
        long perId=Long.parseLong(per_id);
        User user = userService.getUser(perId);

        if (userService.deleteUser(perId)) {
            //删去业主的同时删去车
            carService.deleteCar_set(user.getCar_id());
            carService.courtAllOut();
            userService.deleteUserInfo(user.getName());
            redirectAttributes.addFlashAttribute("succ", "人员删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "人员删除失败！");
        }
        return "redirect:/manage_user.html";
    }

    @RequestMapping("deleteAdmin_Door.html")
    public String deleteAdmin_Door(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String DUID = request.getParameter("DUID");
        //int DUId=Integer.parseInt(DUID);
        Admin_Door admin_door = userService.getAdmin_Door(DUID);
        //User user = userService.getUser(DUID);

        if (userService.deleteAdmin_Door(DUID)) {
            userService.deleteAdmin_Door(admin_door.getDUID());
            redirectAttributes.addFlashAttribute("succ", "人员删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "人员删除失败！");
        }
        return "redirect:/manage_save.html";
    }

}
