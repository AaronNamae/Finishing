package com.wingstudioly.guard.bean;

import java.util.Date;

public class Car {

    private String car_id;
    private Date in_time;
    private Date out_time;
    private int status;

    public Car( String car_id, Date in_time, Date out_time, int status) {
        this.car_id = car_id;
        this.in_time = in_time;
        this.out_time = out_time;
        this.status = status;
    }

    public Car() {

    }

    public String getCar_id() {
        return car_id;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }

    public Date getIn_time() {
        return in_time;
    }

    public void setIn_time(Date in_time) {
        this.in_time = in_time;
    }

    public Date getOut_time() {
        return out_time;
    }

    public void setOut_time(Date out_time) {
        this.out_time = out_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
