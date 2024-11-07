/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hi
 */
public class Favourite {
    private int favourite_id;
    private int user_id;
    private int product_id;

    public Favourite() {
    }

    public int getFavourite_id() {
        return favourite_id;
    }

    public void setFavourite_id(int favourite_id) {
        this.favourite_id = favourite_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public Favourite(int user_id, int product_id) {
        this.user_id = user_id;
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Favourite{" + "favourite_id=" + favourite_id + ", user_id=" + user_id + ", product_id=" + product_id + '}';
    }

    
    
}
