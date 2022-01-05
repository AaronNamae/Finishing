package com.wingstudioly.guard.bean;

import java.util.Date;

public class Car_set {

    private String car_id;
    private int tax_year;
    private int status;
    private Date tax_date;

    public Car_set(String car_id, int tax_year, int status,Date tax_date) {
        this.car_id = car_id;
        this.tax_year = tax_year;
        this.status = status;
        this.tax_date = tax_date;
    }

    public Car_set() {

    }

    public String getCar_id() {
        return car_id;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }

    public int getTax_year() { return tax_year; }

    public void setTex_year( int tex_year) {
        this.tax_year = tex_year;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getTax_Date() {
        return tax_date;
    }

    public void setTax_Date(Date tax_date) {
        this.tax_date = tax_date;
    }

}

