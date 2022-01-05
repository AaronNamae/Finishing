/**
 * ClassName: courtDao <br/>
 * Description: <br/>
 * date: 2021/4/28 12:30<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.bean.Court;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Date;


@Repository
public class courtDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.courtDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public void incrementIn() {
         sqlSessionTemplate.update(NAMESPACE + "incrementIn");
    }

    public void incrementOut() {
         sqlSessionTemplate.update(NAMESPACE + "incrementOut");
    }

    public void incrementAll() {
        sqlSessionTemplate.update(NAMESPACE + "incrementAll");
    }

    public void incrementAllOut() {
        sqlSessionTemplate.update(NAMESPACE + "incrementAllOut");
    }

    public void incrementGdIn(){
        sqlSessionTemplate.update(NAMESPACE + "incrementGdIn");
    }

    public void incrementGdOut(){
        sqlSessionTemplate.update(NAMESPACE + "incrementGdOut");
    }

    public Court getCourt() {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getCourt");
    }

    public void updateCourt() {
        sqlSessionTemplate.update(NAMESPACE + "updateCourt", new Date());
    }
}
