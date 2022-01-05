/**
 * ClassName: User <br/>
 * Description: <br/>
 * date: 2021/4/26 17:10<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.bean;


public class User extends Car_set {
    private long per_id;
    private String car_id;
    private String name;
    private String sex;
    private String location;
    private long phone;
    private int status;
    private int tax_year;

    public User(long per_id, String car_id, String name, String sex, String location, long phone, int status, int tax_year) {
        this.per_id = per_id;
        this.car_id = car_id;
        this.name = name;
        this.sex = sex;
        this.location = location;
        this.phone = phone;
        this.status = status;
        this.tax_year = tax_year;
    }

    public User() {

    }

    public String getCar_id() {
        return car_id;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }

    public long getPer_id() {
        return per_id;
    }

    public void setPer_id(long per_id) {
        this.per_id = per_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public int getTax_year() {
        return tax_year;
    }

    public void setTax_year(int tax_year) {
        this.tax_year = tax_year;
    }

    @Override
    public String toString() {
        return "User{" +
                "per_id=" + per_id +
                ", car_id='" + car_id + '\'' +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", phone=" + phone +
                ", status=" + status +
                ", sex=" + sex +'\''+
                ", tax_year=" + tax_year +
                '}';
    }
}
