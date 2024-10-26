/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Coupon {
    private int couponId;
    private String couponName;
    private String couponCode; 
    private float discountValue;
    private int quantity;
    
    public Coupon() {
    }
    
    public Coupon(int couponId, String couponName, String couponCode, float discountValue, int quantity) {
        this.couponId = couponId;
        this.couponName = couponName;
        this.couponCode = couponCode;
        this.discountValue = discountValue;
        this.quantity = quantity;
    }
    
    // Getters and setters
    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public float getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(float discountValue) {
        this.discountValue = discountValue;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Coupon{" + "couponId=" + couponId + ", couponName=" + couponName + ", couponCode=" + couponCode + ", discountValue=" + discountValue + ", quantity=" + quantity + '}';
    }
    
}
