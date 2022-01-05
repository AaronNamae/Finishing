
package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.bean.Admin_Door;
import com.wingstudioly.guard.bean.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class admin_DoorDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.admin_DoorDao.";
    @Resource
    public SqlSessionTemplate sqlSessionTemplate;

    public int getMatchCount_Door(final String Dname, final String Dpassword) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("Dname", Dname);
        paramMap.put("Dpassword", Dpassword);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount_Door", paramMap);
    }

    public int getMatchCount_Door_RD(final String Dname) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("Dname", Dname);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount_Door_RD", paramMap);
    }

    public int registerAdmin_Door(final Admin_Door admin_Door) {
        return sqlSessionTemplate.insert(NAMESPACE + "registerAdmin_Door", admin_Door);
    }

    public int deleteAdmin_Door(final String DUID) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteAdmin_Door", DUID);
    }

    public Admin_Door getAdmin_Door(final String DUID) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getAdmin_Door", DUID);
    }
    public ArrayList<Admin_Door> getAllAdmin_Door() {
        List<Admin_Door> res = sqlSessionTemplate.selectList(NAMESPACE + "getAllAdmin_Door");
        return (ArrayList<Admin_Door>) res;
    }
}
