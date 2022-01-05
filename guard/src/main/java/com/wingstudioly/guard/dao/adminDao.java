
package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.bean.Admin;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;



@Repository
public class adminDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.adminDao.";
    @Resource
    public SqlSessionTemplate sqlSessionTemplate;

    public int getMatchCount(final String name, final String password) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("name", name);
        paramMap.put("password", password);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount", paramMap);
    }

    public int getMatchCount_R(final String name) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("name", name);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount_R", paramMap);
    }


    public int registerAdmin(final Admin admin) {
        return sqlSessionTemplate.insert(NAMESPACE + "registerAdmin", admin);
    }

}
