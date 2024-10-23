/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DatabaseInfo.DBURL;
import static dao.DatabaseInfo.DRIVERNAME;
import static dao.DatabaseInfo.PASSDB;
import static dao.DatabaseInfo.USERDB;
import static dao.UserDB.getConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.ProductDetail;
import model.User;

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
                double price = rs.getDouble("price");
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
    public static Product getProductById(int productID) {
        Product product = null;
        try (Connection con = getConnect()) {
            String query = "SELECT p.*, pd.size, pd.quantity FROM Product p " +
                       "LEFT JOIN ProductDetail pd ON p.product_id = pd.product_id " +
                       "WHERE p.product_id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, productID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductID(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setBrand(rs.getString("brand"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setDiscount(rs.getString("discount"));
                product.setImg_url(rs.getString("image_urls"));
                List<ProductDetail> productDetails = new ArrayList<>();
            do {
                ProductDetail detail = new ProductDetail();
                detail.setSize(rs.getString("size"));
                productDetails.add(detail);
            } while (rs.next());
            product.setProductDetails(productDetails);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    public static void main(String[] args) {
        List<Product> product = ProductDB.allListProduct();
        for(Product products: product) {
            System.out.println(products);
        }
    }
}
