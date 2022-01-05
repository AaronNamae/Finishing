/**
 * ClassName: userService <br/>
 * Description: <br/>
 * date: 2021/4/27 15:49<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.service;


import com.wingstudioly.guard.bean.Admin;
import com.wingstudioly.guard.bean.Admin_Door;
import com.wingstudioly.guard.bean.User;
import com.wingstudioly.guard.bean.UserFaceInfo;
import com.wingstudioly.guard.dao.adminDao;
import com.wingstudioly.guard.dao.admin_DoorDao;
import com.wingstudioly.guard.dao.userDao;
import com.wingstudioly.guard.dao.userInfoDao;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * ClassName:userService<br/>
 * Description:<br/>
 * date:2021/4/27 15:49<br/>
 *
 * @author li yi<br/>
 */
@Service
public class userService {
    private final userDao userDao;
    private final userInfoDao userInfoDao;
    private final adminDao adminDao;
    private final admin_DoorDao admin_DoorDao;

    public userService(userDao userDao, adminDao adminDao,userInfoDao userInfoDao,admin_DoorDao admin_DoorDao) {
        this.userDao = userDao;
        this.adminDao = adminDao;
        this.admin_DoorDao = admin_DoorDao;
        this.userInfoDao = userInfoDao;
    }


    public boolean isAdmin(String name, String password) {
        return adminDao.getMatchCount(name, password) == 1;
    }
    public boolean isAdmin_Door(String Dname, String Dpassword) {
        return admin_DoorDao.getMatchCount_Door(Dname, Dpassword) == 1;
    }

    public boolean isAdmin_R(String name) {
        return adminDao.getMatchCount_R(name) == 1;
    }
    public boolean isAdmin_Door_RD(String Dname) {
        return admin_DoorDao.getMatchCount_Door_RD(Dname) == 1;
    }

    public boolean addAdmin(Admin admin) { return adminDao.registerAdmin(admin) > 0; }
    public boolean addAdmin_Door(Admin_Door admin_Door) {
        return admin_DoorDao.registerAdmin_Door(admin_Door) > 0;
    }

    public User getUser(long per_id) {
        return userDao.getUser(per_id);
    }
    public Admin_Door getAdmin_Door(String DUID) {
        return admin_DoorDao.getAdmin_Door(DUID);
    }
    public String getCarIdByPerId(long per_id){
        return userDao.getCarIdByPerId(per_id);
    }
    public int getCarStatus(String car_id){
        return userDao.getCarStatus(car_id);
    }

    public boolean addUser(User user) {
        return userDao.registerUser(user) > 0;
    }

    public ArrayList<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public ArrayList<Admin_Door> getAllAdmin_Door() {
        return admin_DoorDao.getAllAdmin_Door();
    }

    public boolean deleteUser(long per_id) {
        return userDao.deleteUser(per_id) > 0;
    }

    public boolean deleteAdmin_Door(String DUID) {
        return admin_DoorDao.deleteAdmin_Door(DUID) > 0;
    }

    public boolean editUser(User user) {
        return userDao.editUser(user) > 0;
    }

    public void insertSelective(UserFaceInfo userFaceInfo){
        userInfoDao.insertUserFaceInfo(userFaceInfo);
    }

    public void deleteUserInfo(String name){userInfoDao.deleteUserInfo(name);}

}
