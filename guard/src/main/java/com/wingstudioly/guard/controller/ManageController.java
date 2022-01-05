/**
 * ClassName: ManageController <br/>
 * Description: <br/>
 * date: 2021/4/28 15:34<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.controller;

import com.wingstudioly.guard.bean.Admin;
import com.wingstudioly.guard.bean.Admin_Door;
import com.wingstudioly.guard.bean.User;
import com.wingstudioly.guard.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * ClassName:ManageController<br/>
 * Description:<br/>
 * date:2021/4/28 15:34<br/>
 *
 * @author li yi<br/>
 */
@Controller
public class ManageController {
    private final carService carService;
    private final userService userService;

    public ManageController(carService carService, userService userService) {
        this.carService = carService;
        this.userService = userService;
    }

    @RequestMapping("manage_car.html")
    public ModelAndView toManage_car(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("manage_car");
        request.getSession().setAttribute("cars", carService.getAllCars());
        mav.addObject("in", carService.getCourt().getInc());
        mav.addObject("out", carService.getCourt().getOutC());
        mav.addObject("emptyC", carService.getEmptySet());
        return mav;
    }

    @RequestMapping("manage_tmpCar.html")
    public ModelAndView toManage_tmpCar(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("manage_tempCar");
        request.getSession().setAttribute("cars", carService.getTmpCars());
        mav.addObject("in", carService.getCourt().getInc());
        mav.addObject("out", carService.getCourt().getOutC());
        mav.addObject("emptyC", carService.getEmptySet());
        return mav;
    }

    @RequestMapping("manage_user.html")
    public ModelAndView toManage_user(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("manage_user");
        ArrayList<User> users = userService.getAllUsers();
        int EX = 0;
        int IN = 0;
        for (User user :
                users) {
            if (user.getStatus() == 1)
                IN++;
            if (user.getStatus() == 2)
                EX++;
        }
        request.getSession().setAttribute("users", users);
        mav.addObject("EX", EX);
        mav.addObject("IN", IN);
        return mav;
    }

    @RequestMapping("manage_save.html")
    public ModelAndView toManage_save(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("manage_save");
        ArrayList<Admin_Door> admin_doors = userService.getAllAdmin_Door();

        request.getSession().setAttribute("admin_doors", admin_doors);
        return mav;
    }

    @RequestMapping("manage_Car_set.html")
    public ModelAndView toManage_Car_set(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("manage_Car_set");
        request.getSession().setAttribute("cars", carService.getCars_set());
        mav.addObject("in", carService.getCourt().getInc());
        mav.addObject("out", carService.getCourt().getOutC());
        mav.addObject("emptyC", carService.getEmptySet());
        return mav;
    }



    @RequestMapping("/identity_car.html")
    public ModelAndView toIdCar(HttpServletRequest request) {
        String state = request.getParameter("state");
        ModelAndView mav = new ModelAndView("identity_car");
        mav.addObject("state", state);
        return mav;
    }

    @RequestMapping("/identity_car_Door.html")
    public ModelAndView toIdCar_Door(HttpServletRequest request) {
        String state = request.getParameter("state1");
        ModelAndView mav = new ModelAndView("identity_car_Door");
        mav.addObject("state1", state);

        return mav;
    }

    @RequestMapping("/identity_person.html")
    public ModelAndView toIdPerson(HttpServletRequest request){
        String state = request.getParameter("state2");
        ModelAndView mav = new ModelAndView("identity_person");
        mav.addObject("state2", state);
        return mav;
    }

    @RequestMapping("/identity_person_Door.html")
    public ModelAndView toIdPerson_Door(HttpServletRequest request){
        String state = request.getParameter("state3");
        ModelAndView mav = new ModelAndView("identity_person_Door");
        mav.addObject("state3", state);
        return mav;
    }



    @RequestMapping(value = "/getTmpCarPhoto",method = RequestMethod.GET)
    public String toTmpCatPhoto(){
        return "../static/";
    }

}
