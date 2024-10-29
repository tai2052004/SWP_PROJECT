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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.*;
import model.Order;
import model.OrderDetail;

import model.Product;
import model.ProductDetail;
import model.User;

/**
 *
 * @author LAPTOP
 */
public class OrderDB implements DatabaseInfo {

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
               "p.brand, p.price, pd.size, od.quantity, o.order_date, o.total_price, o.order_id, o.status " +  // Thêm khoảng trắng sau o.status
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
                orderDetail.setStatus("status");
                orderDetail.setPrice(rs.getFloat("price"));
                orderDetail.setSize(rs.getString("size"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                orderDetail.setTotalPrice(rs.getDouble("total_price"));
                orderDetail.setOrder_id(rs.getInt("order_id"));
                orderDetails.add(orderDetail);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return orderDetails;
    }

    public static List<Order> getOrder() {
        List<Order> order = new ArrayList<>();
        String query = "select * from [Order]";
        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {

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

    public static User getUserInfo(int user_id) {
        User user = null;
        String query = "SELECT u.User_fullname, u.User_phone FROM [Order] o "
                + "JOIN Users u ON o.user_id = u.ID "
                + "WHERE o.user_id = ?";
        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, user_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();
                user.setFullname(rs.getString("User_fullname"));
                user.setPhone(rs.getString("User_phone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static Order getOrderById(int orderId) {
        Order orders = null;

        String query = "Select * from [Order] where order_id = ? ";
        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {
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
                orders.setAddress(rs.getString("address"));
                orders.setCoupon(rs.getInt("coupon_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static String getUserFullName(int user_id) {
        String query = "SELECT u.User_fullname FROM [Order] o "
                + "JOIN Users u ON o.user_id = u.ID "
                + "WHERE o.user_id = ?";
        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {

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

    public static List<OrderDetail> getOrderDetailsById(int orderId) {
        List<OrderDetail> orderDetail = new ArrayList<>();
        String query = "SELECT o.order_id, od.order_detail_id, u.id AS user_id, p.name, pd.size, p.brand, "
                + "od.quantity, p.price, p.discount,p.image_urls, o.order_date, o.status "
                + "FROM [Order] o "
                + "JOIN Users u ON o.user_id = u.ID "
                + "JOIN OrderDetail od ON o.order_id = od.order_id "
                + "JOIN ProductDetail pd ON od.product_detail_id = pd.id "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "WHERE o.order_id = ?";
        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail orderDetails = new OrderDetail();
                orderDetails.setOrder_detail_id(rs.getInt("order_detail_id"));
                orderDetails.setProductName(rs.getString("name"));
                orderDetails.setSize(rs.getString("size"));
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setPrice(rs.getDouble("price"));
                orderDetails.setOrderDate(rs.getObject("order_date", LocalDateTime.class));
                orderDetails.setDiscount(rs.getFloat("discount"));
                orderDetails.setImg_url(rs.getString("image_urls"));
                orderDetails.setBrand(rs.getString("brand"));
                orderDetail.add(orderDetails);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderDetail;
    }

    public static List<Order> getOrderByIdUser(int userId) {
        List<Order> order = new ArrayList<>();
        String query = "Select * from [Order] where user_id = ?";
        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order orders = new Order();
                orders.setOrder_id(rs.getInt("order_id"));
                orders.setUser_id(rs.getInt("user_id"));
                orders.setOrder_date(rs.getString("order_date"));
                orders.setStatus(rs.getString("status"));
                orders.setFeeship(rs.getFloat("feeship"));
                orders.setCoupon(rs.getInt("coupon_id"));
                orders.setAddress(rs.getString("address"));
                order.add(orders);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public static boolean addNewOrder(Order order) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "Insert into [Order] (user_id,order_date,status,total_price,feeship,address,coupon_id) values (?, ?, ?,?,?,?,?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setInt(1, order.getUser_id());
            stmt.setString(2, order.getOrder_date());
            stmt.setString(3, order.getStatus());
            stmt.setFloat(4, order.getTotal_price());
            stmt.setFloat(5, order.getFeeship());
            stmt.setString(6, order.getAddress());
            if (order.getCoupon() == -1) {
                stmt.setNull(7, java.sql.Types.INTEGER);
            } else {
                stmt.setInt(7, order.getCoupon());
            }
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    order.setOrder_id(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean addOrderDetails(List<OrderDetail> orderDetails, int orderId) {
        try (Connection con = getConnect()) {
            String query = "INSERT INTO OrderDetail (order_id, product_detail_id, quantity, price) VALUES (?, ?, ?, ?)";

            try (PreparedStatement stmt = con.prepareStatement(query)) {
                for (OrderDetail orderDetail : orderDetails) {
                    stmt.setInt(1, orderId);
                    stmt.setInt(2, orderDetail.getProduct_detail_id());
                    stmt.setInt(3, orderDetail.getQuantity());
                    stmt.setDouble(4, orderDetail.getPrice());

                    stmt.addBatch();
                }

                stmt.executeBatch();
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean addProductDetail(OrderDetail OD, ProductDetail pd) {
        try (Connection con = getConnect()) {
            String query = "INSERT INTO ProductDetail (product_id, size, quantity) VALUES (?, ?, ?)";

            PreparedStatement stmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

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
        return false; // Thêm thất bại
    }

    public static boolean updateOrderStatus(int orderId, String status) {
        String query = "Update [order] Set status= ? where order_id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean setStaus(int orderId, String action) {
    String query = "UPDATE [order] SET status = ? WHERE order_id = ?";
    
    try (Connection con = getConnect()) {
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, action);
        ps.setInt(2, orderId);
        
        // Thực hiện cập nhật và kiểm tra số hàng được cập nhật
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    public static List<Order> getOrderByTimeframe(String timeframe) {
        List<Order> orders = new ArrayList<>();
        String query = "";

        // Xây dựng truy vấn SQL dựa trên khoảng thời gian
        switch (timeframe.toLowerCase()) {
            case "this day":
                query = "SELECT * FROM [Order] WHERE CAST(order_date AS DATE) = CAST(GETDATE() AS DATE)";
                break;
            case "this week":
                query = "SELECT * FROM [Order] WHERE DATEPART(week, order_date) = DATEPART(week, GETDATE()) "
                        + "AND YEAR(order_date) = YEAR(GETDATE())";
                break;
            case "this month":
                query = "SELECT * FROM [Order] WHERE MONTH(order_date) = MONTH(GETDATE()) "
                        + "AND YEAR(order_date) = YEAR(GETDATE())";
                break;
            default:
                System.out.println("Invalid timeframe specified.");
                return orders;
        }

        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getString("order_date"));
                order.setTotal_price(rs.getFloat("total_price"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) {
////// Tạo đối tượng ProductDetail
////        ProductDetail productDetail = new ProductDetail(1, "M", 50); // productID = 1, size = "M", quantity = 50
////        OrderDetail orderDetail = new OrderDetail(1, 1, "Giày Nike", "Nike", 1500.0, "M", 2, LocalDateTime.now()); // cart_id = 1, product_id = 1, quantity = 2
////        // Tạo danh sách OrderDetail
////        List<OrderDetail> orderDetails = new ArrayList<>();
////
////        // Thêm các OrderDetail vào danh sách
////        orderDetails.add(new OrderDetail(1, 1, "Giày Nike", "Nike", 1500.0, "M", 2, LocalDateTime.now())); // cart_id = 1, product_id = 1, quantity = 2
////        orderDetails.add(new OrderDetail(1, 2, "Giày Adidas", "Adidas", 1200.0, "L", 1, LocalDateTime.now())); // cart_id = 1, product_id = 2, quantity = 1
////
//////        // Gọi phương thức để thêm ProductDetail
////        boolean isProductDetailAdded = addProductDetail(orderDetail, productDetail);
////        System.out.println("Thêm ProductDetail thành công: " + isProductDetailAdded);
////        System.out.println(productDetail.getProductDetailID());
////
////        // Gọi phương thức để thêm OrderDetail
////        boolean isOrderDetailsAdded = addOrderDetails(orderDetails, 1); // Giả sử orderId là 1
////        System.out.println("Thêm OrderDetail thành công: " + isOrderDetailsAdded);
//        Order testOrder = new Order();
//
//        // Thiết lập các thuộc tính cho testOrder
//        testOrder.setUser_id(1); // Ví dụ: user_id là 1
//        testOrder.setOrder_date("2024-10-28"); // Định dạng yyyy-MM-dd
//        testOrder.setStatus("Pending"); // Ví dụ: trạng thái là "Pending"
//        testOrder.setTotal_price(200.0f); // Ví dụ: tổng giá là 200.0
//        testOrder.setFeeship(15.0f); // Ví dụ: phí giao hàng là 15.0
//        testOrder.setAddress("123 Main Street"); // Địa chỉ giao hàng
//        testOrder.setCoupon(2); // Ví dụ: ID của coupon là 2
//
//        // Gọi method addNewOrder để thêm đơn hàng vào cơ sở dữ liệu
//        boolean result = addNewOrder(testOrder); // Thay "YourClassName" bằng tên class chứa method addNewOrder
//
//        // Kiểm tra kết quả
//        if (result) {
//            System.out.println("Đơn hàng đã được thêm thành công với Order ID: " + testOrder.getOrder_id());
//        } else {
//            System.out.println("Thêm đơn hàng thất bại.");
//        }
        List<OrderDetail> order = OrderDB.getOrderDetailsById(1);
        for(OrderDetail orders : order) {
            System.out.println(orders);
        }
        
    }
}
