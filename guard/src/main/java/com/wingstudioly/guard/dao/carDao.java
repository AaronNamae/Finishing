/**
 * ClassName: carDao <br/>
 * Description: <br/>
 * date: 2021/4/26 15:24<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.bean.Car;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Repository
public class carDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.carDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int registerCar(final Car car) {
        return sqlSessionTemplate.insert(NAMESPACE + "registerCar", car);
    }

    public ArrayList<Car> getAllCars() {
        List<Car> res = sqlSessionTemplate.selectList(NAMESPACE + "getAllCars");
        return (ArrayList<Car>) res;
    }

    public Car getCar(final String car_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getCar", car_id);
    }

    public int deleteCar(final String car_id) {
        return sqlSessionTemplate.delete("deleteCar", car_id);
    }

    public int updateCar(final String old, final String now) {
        HashMap<String, String> tmp = new HashMap<>();
        tmp.put("old", old);
        tmp.put("now", now);
        return sqlSessionTemplate.update(NAMESPACE + "updateCar", tmp);
    }
    public int updateInCar(final String car_id){
        return sqlSessionTemplate.update(NAMESPACE+"updateInCar",car_id);
    }
    public int updateOutCar(final String car_id){
        return sqlSessionTemplate.update(NAMESPACE+"updateOutCar",car_id);
    }
    public ArrayList<Car> getTmpCars(){
        List<Car> res = sqlSessionTemplate.selectList(NAMESPACE+"getTmpCars");
        return (ArrayList<Car>)res;
    }

}
