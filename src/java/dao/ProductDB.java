/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DatabaseInfo.DBURL;
import static dao.DatabaseInfo.DRIVERNAME;
import static dao.DatabaseInfo.PASSDB;
import static dao.DatabaseInfo.USERDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author ngoct
 */
public class ProductDB implements DatabaseInfo {
    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver: " + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    public static ArrayList<Product> allListProduct() {
        ArrayList<Product> productList = new ArrayList<>();
        try (Connection con=getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT product_id, name, brand, price, discount,description, image_urls "
                    + "FROM Product ");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String product_name = rs.getString("name");
                String brand = rs.getString("brand");
                String price = rs.getString("price");
                String discount = rs.getString("discount");
                String description = rs.getString("description");
                String url = rs.getString("image_urls");
                Product product = new Product(id, product_name,brand, price, discount, description,url);             
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    public static void main(String[] args) {
        List<Product> product = ProductDB.allListProduct();
        for(Product products: product) {
            System.out.println(products);
        }
    }
}
