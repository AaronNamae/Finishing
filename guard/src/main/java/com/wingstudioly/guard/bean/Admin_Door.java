package com.wingstudioly.guard.bean;

public class Admin_Door {
    private int DID;
    private String Dname;
    private String Dpassword;
    private String DUID;

    public Admin_Door(int DID, String Dname,String Dpassword,String DUID) {
        this.DID = DID;
        this.Dname = Dname;
        this.Dpassword = Dpassword;
        this.DUID = DUID;
    }
    public Admin_Door() {

    }

    public int getDID() {
        return DID;
    }

    public void setDID(int ID ) {
        this.DID = DID;
    }

    public String getDname() {
        return Dname;
    }

    public void setDname(String Dname) {
        this.Dname = Dname;
    }

    public String getDpassword() {
        return Dpassword;
    }

    public void setDpassword(String Dpassword) {
        this.Dpassword = Dpassword;
    }

    public String getDUID() {
        return DUID;
    }

    public void setDUID(String DUID) {
        this.DUID = DUID;
    }
}
