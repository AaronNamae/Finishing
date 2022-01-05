package com.wingstudioly.guard.bean;

import java.util.Date;


public class UserFaceInfo {

    private Integer id;

    private String faceId;

    private String name;

    private String sex;

    private Date createTime;

    private Date updateTime;

    private byte[] faceFeature;

    public UserFaceInfo(Integer id,  String faceId, String name, String sex, Date createTime, Date updateTime, byte[] faceFeature) {
        this.id = id;
        this.faceId = faceId;
        this.name = name;
        this.sex = sex;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.faceFeature = faceFeature;
    }
    public UserFaceInfo(){

    }

    public Integer getId() {
        return id;
    }


    public String getFaceId() {
        return faceId;
    }

    public String getName() {
        return name;
    }

    public String getSex(){ return sex;}

    public Date getCreateTime() {
        return createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public byte[] getFaceFeature() {
        return faceFeature;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFaceId(String faceId) {
        this.faceId = faceId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSex(String sex){this.sex = sex;}

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setFaceFeature(byte[] faceFeature) {
        this.faceFeature = faceFeature;
    }
}

