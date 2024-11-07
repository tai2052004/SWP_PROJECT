/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DatabaseInfo.DBURL;
import static dao.DatabaseInfo.DRIVERNAME;
import static dao.DatabaseInfo.PASSDB;
import static dao.DatabaseInfo.USERDB;
import static dao.ProductDB.getConnect;
import static dao.UserDB.getConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Favourite;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author hi
 */
public class FavouriteDB {
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
    public static boolean addFavouriteProduct(Favourite favor) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "Insert into Favorite(user_id, product_id) values (?, ?) ",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setInt(1, favor.getUser_id());
            stmt.setInt(2, favor.getProduct_id());
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    favor.setFavourite_id(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean checkFavourite(int userId, int productId) {
        boolean isFavourite = false;
        String query = "SELECT COUNT(*) FROM Favorite WHERE product_id = ? AND user_id = ?";
        
        try (Connection conn = getConnect();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, productId);
            ps.setInt(2, userId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    isFavourite = rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return isFavourite;
    }
    public static boolean removeFavourite(int productId, int userId) {
        String query = "DELETE FROM Favorite WHERE user_id = ? AND product_id = ?"; 

        try (Connection conn = getConnect();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
}


    public static void main(String[] args) {
        Favourite favor = new Favourite(1,2);
        boolean success = addFavouriteProduct(favor);
        if(success) {
            System.out.println("ok");
        } else {
            System.out.println("fail");
        }
    }
}
