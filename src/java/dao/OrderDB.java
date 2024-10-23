/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import static dao.UserDB.getConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.*;
import model.OrderDetail;
import model.User;
/**
 *
 * @author LAPTOP
 */
public class OrderDB implements DatabaseInfo{
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
    public static List<OrderDetail> getOrderDetail()
    {
        List<OrderDetail> orderDetails = new ArrayList<>();
        
        String query = "SELECT o.user_id, p.name AS product_name, " +
               "p.brand, p.price, pd.size, od.quantity, o.order_date " +
               "FROM [Order] o " +
               "JOIN OrderDetail od ON o.order_id = od.order_id " +
               "JOIN Product p ON od.product_id = p.product_id " +
               "JOIN ProductDetail pd ON p.product_id = pd.product_id";
        
        try (Connection conn = getConnect(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setUser_id(rs.getInt("user_id"));
                orderDetail.setProductName(rs.getString("product_name"));
                orderDetail.setBrand(rs.getString("brand"));
                orderDetail.setPrice(rs.getFloat("price"));
                orderDetail.setSize(rs.getString("size"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                
                orderDetails.add(orderDetail);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return orderDetails;
    }
}

