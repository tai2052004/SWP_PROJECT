/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author ngoct
 */
public class Product {
    private int productID;
    private String productName;
    private String brand;
    private double price;
    private String discount;
    private String description;
    private String img_url;
    private int status;
    private List<ProductDetail> productDetails;

    public Product() {
    }
    
    public Product(int productID, String productName, String brand, double price, String discount, String description, String img_url, int status) {
        this.productID = productID;
        this.productName = productName;
        this.brand = brand;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.img_url = img_url;
        this.status = status;
    }

    public Product(int productID, String productName, String brand, double price, String discount, String description, String img_url) {
        this.productID = productID;
        this.productName = productName;
        this.brand = brand;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.img_url = img_url;
    }
    public List<ProductDetail> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(List<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }
    public Product(String productName, String brand, double price, String discount, String description, String img_url) {
        this.productName = productName;
        this.brand = brand;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.img_url = img_url;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", brand=" + brand + ", price=" + price + ", discount=" + discount + ", description=" + description + ", img_url=" + img_url + '}';
    }
    
}
