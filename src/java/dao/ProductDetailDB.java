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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author ADMIN
 */
public class ProductDetailDB {
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
    public static ArrayList<ProductDetail> allListProductDetail() {
        ArrayList<ProductDetail> productDetailList = new ArrayList<>();
        try (Connection con=getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * "
                    + "FROM ProductDetail ");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int product_id = rs.getInt("product_id");
                String size = rs.getString("size");
                int quantity = rs.getInt("quantity");
                ProductDetail pd = new ProductDetail(id, product_id, size, quantity);       
                productDetailList.add(pd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDetailList;
    }
    
    public static boolean addProductDetail(ProductDetail pd) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "Insert into ProductDetail(product_id, size, quantity) values (?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setInt(1, pd.getProductID());
            stmt.setString(2, pd.getSize());
            stmt.setInt(3, pd.getQuantity());
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    pd.setProductDetailID(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
