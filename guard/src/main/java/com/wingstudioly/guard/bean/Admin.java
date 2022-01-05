package com.wingstudioly.guard.bean;

import java.util.Date;

public class Admin {
    private int ID;
    private String name;
    private String password;
    private String UID;

    public Admin( int ID, String name,String password,String UID) {
        this.ID = ID;
        this.name = name;
        this.password = password;
        this.UID = UID;
    }
    public Admin() {

    }

    public int getID() {
        return ID;
    }

    public void setID(int ID ) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUID() {
        return UID;
    }

    public void setUID(String UID) {
        this.UID = UID;
    }
}


