package com.wingstudioly.guard.service;

import com.wingstudioly.guard.bean.User;
import com.wingstudioly.guard.bean.Car;
import com.wingstudioly.guard.bean.Car_set;
import com.wingstudioly.guard.bean.Court;
import com.wingstudioly.guard.dao.userDao;
import com.wingstudioly.guard.dao.carDao;
import com.wingstudioly.guard.dao.car_setDao;
import com.wingstudioly.guard.dao.courtDao;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Service
public class carService {
    private final static int CarSet = 1000;
    private  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    private  SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private final static int per_MONEY = 2;
    private final carDao carDao;
    private final car_setDao car_setDao;
    private final courtDao courtDao;
    private final userDao userDao;

    public carService(carDao carDao, car_setDao car_setDao,courtDao courtDao,userDao userDao) {
        this.carDao = carDao;
        this.courtDao = courtDao;
        this.car_setDao = car_setDao;
        this.userDao = userDao;
    }

    public void updateCourt() {
        Court court = courtDao.getCourt();
        String tmp = sdf.format(court.getDate());

        if (!sdf.format(new Date()).equals(tmp))
            courtDao.updateCourt();
    }
    public void courtIN(){courtDao.incrementIn();}
    public void courtOut(){courtDao.incrementOut();}
    public void courtAll(){courtDao.incrementAll();}
    public void courtAllOut(){courtDao.incrementAllOut();}
    public void courtGdIn(){courtDao.incrementGdIn();}
    public void courtGdOut(){courtDao.incrementGdOut();}

    public int getEmptySet() {
        Court court = courtDao.getCourt();
        return CarSet - (court.getInc() - court.getOutC()) - court.getAllC() + (court.getGdIn()-court.getGdOut());
    }

    public Court getCourt() {
        return courtDao.getCourt();
    }

    public ArrayList<Car> getAllCars() {
        return carDao.getAllCars();
    }
    public ArrayList<Car> getTmpCars(){
        return carDao.getTmpCars();
    }
    public ArrayList<Car_set> getCars_set(){
        return car_setDao.getCars_set();
    }


    public boolean updateCar(String old, String now) {
        return carDao.updateCar(old, now) > 0;
    }

    public boolean updateCar_set(String old, String now) {
        return car_setDao.updateCar_set(old, now) > 0;
    }

//    public boolean editCar_set(int tax_year,String car_id) {
//        return car_setDao.editCar_set(tax_year,car_id) > 0;
//    }

    public Car getCar(String car_id){
        return carDao.getCar(car_id);
    }

    public Car_set getCar_set(String car_id){
        return car_setDao.getCar_set(car_id);
    }

    public User getCar_user(String car_id){
        return userDao.getCar_user(car_id);
    }

    public int getCarMoney(Car car){
        long now = new Date().getTime();
        long gap = now - car.getIn_time().getTime();
        int i = Math.toIntExact((gap) / (60 * 60 * 1000));
        System.out.println(gap);
        System.out.println(i);
        return i*per_MONEY;
    }
    public void deleteCar(String car_id){
        carDao.deleteCar(car_id);
    }

    public void deleteCar_set(String car_id){
        car_setDao.deleteCar_set(car_id);
    }


    public void updateInCar(String car_id){
        carDao.updateInCar(car_id);
    }
    public void updateOutCar(String car_id){
        carDao.updateOutCar(car_id);
    }
    public void addCar(Car car){
        carDao.registerCar(car);
    }
    public void addCar_set(Car_set car_set){
        car_setDao.registerCar_set(car_set);
    }

}
