
package com.wingstudioly.guard.bean;

import java.util.Date;

public class Court {
    private int court_id;
    private int Inc;
    private int outC;
    private Date last_date;
    private int allC;
    private int gdIn;
    private int gdOut;

    public int getCourt_id() {
        return court_id;
    }

    public void setCourt_id(int court_id) {
        this.court_id = court_id;
    }

    public int getInc() {
        return Inc;
    }

    public void setInc(int inc) {
        Inc = inc;
    }

    public int getOutC() {
        return outC;
    }

    public void setOutC(int outC) {
        this.outC = outC;
    }

    public Date getDate() {
        return last_date;
    }

    public void setDate(Date date) {
        this.last_date = date;
    }

    public int getAllC() {
        return allC;
    }

    public void setAllC(int allC) {
        this.allC = allC;
    }

    public int getGdIn() {
        return gdIn;
    }

    public void setGdIn(int gdIn) {
        this.gdIn = gdIn;
    }

    public int getGdOut() {
        return gdOut;
    }

    public void setGdOut(int gdOut) {
        this.gdOut = gdOut;
    }

}
