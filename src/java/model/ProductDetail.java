/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoct
 */
public class ProductDetail {
    private int productDetailID;
    private int productID;
    private String size;
    private int quantity;

    public ProductDetail() {
    }

    public ProductDetail(int productID, String size, int quantity) {
        this.productID = productID;
        this.size = size;
        this.quantity = quantity;
    }

    public ProductDetail(int productDetailID, int productID, String size, int quantity) {
        this.productDetailID = productDetailID;
        this.productID = productID;
        this.size = size;
        this.quantity = quantity;
    }

    public int getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(int productDetailID) {
        this.productDetailID = productDetailID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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

    @Override
    public String toString() {
        return "ProductDetail{" + "productDetailID=" + productDetailID + ", productID=" + productID + ", size=" + size + ", quantity=" + quantity + '}';
    }
    
}
