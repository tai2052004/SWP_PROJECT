/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author LAPTOP
 */
public class OrderDetail {
    private int order_detail_id;
    private int cart_id;
    private int order_id;
    private int user_id;
    private int product_id;
    private String productName;
    private String brand;
    private double totalPrice;
    private double price;
    private String size;
    private int quantity;
    private LocalDateTime orderDate;
    private String status;
    public OrderDetail(int cart_id, int product_id, String productName, String brand, double price, String size, int quantity, LocalDateTime orderDate) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.productName = productName;
        this.brand = brand;
        this.price = price;
        this.size = size;
        this.quantity = quantity;
        this.orderDate = orderDate;
    }
    
    public OrderDetail() {
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    
    public int getUser_id() {
        return user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "order_id=" + order_id + ", user_id=" + user_id + ", product_id=" + product_id + ", productName=" + productName + ", brand=" + brand + ", totalPrice=" + totalPrice + ", price=" + price + ", size=" + size + ", quantity=" + quantity + ", orderDate=" + orderDate + ", status=" + status + '}';
    }
    
    
}
