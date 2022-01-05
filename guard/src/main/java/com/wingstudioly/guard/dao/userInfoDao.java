/**
 * ClassName: userInfoDao <br/>
 * Description: <br/>
 * date: 2021/5/9 20:57<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.dao;

import com.wingstudioly.guard.dto.FaceUserInfo;
import com.wingstudioly.guard.bean.UserFaceInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 *ClassName:userInfoDao<br/>
 *Description:<br/>
 *date:2021/5/9 20:57<br/>
 *@author li yi<br/>
 *@version
 */
@Repository
public class userInfoDao {
    private final static String NAMESPACE = "com.wingstudioly.guard.dao.userInfoDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public void insertUserFaceInfo(UserFaceInfo userFaceInfo){
        sqlSessionTemplate.insert(NAMESPACE+"insertUserFaceInfo",userFaceInfo);
    }

    public List<FaceUserInfo> getUserFaceInfo(){
        return sqlSessionTemplate.selectList(NAMESPACE+"getUserFaceInfo");
    }

    public void deleteUserInfo(final String name){
        sqlSessionTemplate.delete(NAMESPACE+"deleteUserInfo",name);
    }
}
