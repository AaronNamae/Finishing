/**
 * ClassName: userDao <br/>
 * Description: <br/>
 * date: 2021/4/27 9:24<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.bean.Car;
import com.wingstudioly.guard.bean.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;



@Repository
public class userDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.userDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int registerUser(final User user) {
        return sqlSessionTemplate.insert(NAMESPACE + "registerUser", user);
    }

    public int editUser(final User user) {
        return sqlSessionTemplate.update(NAMESPACE + "editUser", user);
    }

    public ArrayList<User> getAllUsers() {
        List<User> res = sqlSessionTemplate.selectList(NAMESPACE + "getAllUsers");
        return (ArrayList<User>) res;
    }

    public User getCar_user(final String car_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getCar_user", car_id);
    }

    public User getUser(final long per_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getUser", per_id);
    }

    public int deleteUser(final long per_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteUser", per_id);
    }
    public String getCarIdByPerId(final long per_id){
        return sqlSessionTemplate.selectOne(NAMESPACE+"getCarIdByPerId",per_id);
    }
    public int getCarStatus(final String car_id){
        return sqlSessionTemplate.selectOne(NAMESPACE+"getCarStatus",car_id);
    }

}
