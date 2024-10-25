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
import model.Order;
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
//    public static List<OrderDetail> getOrderDetail()
//    {
//        List<OrderDetail> orderDetails = new ArrayList<>();
//        
//        String query = "SELECT o.user_id, p.name AS product_name, " +
//               "p.brand, p.price, pd.size, od.quantity, o.order_date, o.total_price, o.order_id, o.status " +  // Thêm khoảng trắng sau o.status
//               "FROM [Order] o " +
//               "JOIN OrderDetail od ON o.order_id = od.order_id " +
//               "JOIN Product p ON od.product_id = p.product_id " +
//               "JOIN ProductDetail pd ON p.product_id = pd.product_id";
//        
//        try (Connection conn = getConnect(); 
//             PreparedStatement ps = conn.prepareStatement(query)) {
//            
//            ResultSet rs = ps.executeQuery();
//            
//            while (rs.next()) {
//                OrderDetail orderDetail = new OrderDetail();
//                orderDetail.setUser_id(rs.getInt("user_id"));
//                orderDetail.setProductName(rs.getString("product_name"));
//                orderDetail.setBrand(rs.getString("brand"));
//                orderDetail.setStatus("status");
//                orderDetail.setPrice(rs.getFloat("price"));
//                orderDetail.setSize(rs.getString("size"));
//                orderDetail.setQuantity(rs.getInt("quantity"));
//                orderDetail.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
//                orderDetail.setTotalPrice(rs.getDouble("total_price"));
//                orderDetail.setOrder_id(rs.getInt("order_id"));
//                orderDetails.add(orderDetail);
//            }
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        return orderDetails;
//    }
    public static List<Order> getOrder() {
        List<Order> order = new ArrayList<>();
        String query = "select * from [Order]";
        try (Connection conn = getConnect(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Order orders = new Order();
                orders.setOrder_id(rs.getInt("order_id"));
                orders.setUser_id(rs.getInt("user_id"));
                orders.setOrder_date(rs.getString("order_date"));
                orders.setTotal_price(rs.getFloat("total_price"));
                orders.setStatus(rs.getString("status"));
                order.add(orders);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }
    public static String getUserFullName(int user_id) {
        String query = "SELECT u.User_fullname FROM [Order] o "
                     + "JOIN Users u ON o.user_id = u.ID "
                     + "WHERE o.user_id = ?";
        try (Connection conn = getConnect();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, user_id);                                                                        

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("User_fullname");
            }
        } catch (Exception e) { 
            e.printStackTrace();
        }

        return null;
        }
    public static Order getOrderById(int orderId) {
        Order orders = null;
        
        String query = "SELECT o.order_id, o.user_id, o.order_date, o.total_price, o.status, o.feeship, c.discount_value "
             + "FROM [Order] o "
             + "JOIN Coupon c ON o.coupon_id = c.coupon_id "
             + "WHERE o.order_id = ?";
        try (Connection conn = getConnect(); 
            PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                orders = new Order();
                orders.setOrder_id(rs.getInt("order_id"));
                orders.setUser_id(rs.getInt("user_id"));
                orders.setOrder_date(rs.getString("order_date"));
                orders.setTotal_price(rs.getFloat("total_price"));
                orders.setStatus(rs.getString("status"));
                orders.setFeeship(rs.getFloat("feeship"));        
                orders.setCouponValue(rs.getFloat("discount_value"));
            }        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;  
    }
    public static List<OrderDetail> getOrderDetailsById(int orderId) {
        List<OrderDetail> orderDetail = new ArrayList<>();
        String query = "SELECT o.order_id, od.order_detail_id, u.id AS user_id, p.name, pd.size, "
                + "od.quantity, p.price, p.discount, o.order_date, o.status "
                + "FROM [Order] o "
                + "JOIN Users u ON o.user_id = u.ID "
                + "JOIN OrderDetail od ON o.order_id = od.order_id "
                + "JOIN ProductDetail pd ON od.product_detail_id = pd.id "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "WHERE o.order_id = ?";
        try (Connection conn = getConnect(); 
            PreparedStatement ps = conn.prepareStatement(query)) {  
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
               OrderDetail orderDetails = new OrderDetail();
               orderDetails.setOrder_detail_id(rs.getInt("order_detail_id"));
               orderDetails.setProductName(rs.getString("name"));
               orderDetails.setSize(rs.getString("size"));
               orderDetails.setQuantity(rs.getInt("quantity"));
               orderDetails.setPrice(rs.getDouble("price"));
               orderDetails.setDiscount(rs.getFloat("discount"));
               orderDetail.add(orderDetails);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderDetail;  
    }
    public static void main(String[] args) {
        List<Order> order = OrderDB.getOrder();
        for(Order orders : order) {
            System.out.println(orders);
        }
    }
}

