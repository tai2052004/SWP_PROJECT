/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoct
 */
public class Order {
    private int order_id;
    private int user_id;
    private String order_date;
    private String status;
    private int pay;
    private float total_price;
    private float feeship;
    private String address;
    private int coupon;

    public Order() {
    }

    public Order(int order_id, int user_id, String order_date, String status, int pay, float total_price, float feeship, String address, int coupon) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.status = status;
        this.pay = pay;
        this.total_price = total_price;
        this.feeship = feeship;
        this.address = address;
        this.coupon = coupon;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

    public float getFeeship() {
        return feeship;
    }

    public void setFeeship(float feeship) {
        this.feeship = feeship;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCoupon() {
        return coupon;
    }

    public void setCoupon(int coupon) {
        this.coupon = coupon;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", status=" + status + ", pay=" + pay + ", total_price=" + total_price + ", feeship=" + feeship + ", address=" + address + ", coupon=" + coupon + '}';
    }
    
    
}
