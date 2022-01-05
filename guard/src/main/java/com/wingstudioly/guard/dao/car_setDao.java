package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.bean.Car;
import com.wingstudioly.guard.bean.Car_set;
import com.wingstudioly.guard.bean.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class car_setDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.car_setDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int registerCar_set(final Car_set car_set) {
        return sqlSessionTemplate.insert(NAMESPACE + "registerCar_set", car_set);
    }
    public ArrayList<Car_set> getCars_set(){
        List<Car_set> res = sqlSessionTemplate.selectList(NAMESPACE+"getCars_set");
        return (ArrayList<Car_set>)res;
    }
//    public int editCar_set(final int tax_year,final String car_id) {
//       // HashMap<String, String> tmp = new HashMap<>();
//       // tmp.put("tax_year", tax_year);
//       // tmp.put("car_id", car_id);
//        return sqlSessionTemplate.update(NAMESPACE + "editCar_set",tax_year,car_id);
//    }
    public int updateCar_set(final String old, final String now) {
        HashMap<String, String> tmp = new HashMap<>();
        tmp.put("old", old);
        tmp.put("now", now);
        return sqlSessionTemplate.update(NAMESPACE + "updateCar_set", tmp);
    }

    public int deleteCar_set(final String car_id) {
        return sqlSessionTemplate.delete("deleteCar_set", car_id);
    }

    public Car_set getCar_set(final String car_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getCar_set", car_id);
    }

}
