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
            PreparedStatement stmt = con.prepareStatement("SELECT product_id, name, brand, price, discount,description, image_urls,status "
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
                int status = rs.getInt("status");
                Product product = new Product(id, product_name,brand, price, discount, description,url, status);             
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
            String query = "SELECT p.*,pd.id, pd.size, pd.quantity FROM Product p " +
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
                product.setStatus(rs.getInt("status"));
                List<ProductDetail> productDetails = new ArrayList<>();
            do {
                ProductDetail detail = new ProductDetail();
                detail.setProductDetailID(Integer.parseInt(rs.getString("id")));
                detail.setSize(rs.getString("size"));
                detail.setQuantity(Integer.parseInt(rs.getString("quantity")));
                productDetails.add(detail);
            } while (rs.next());
            product.setProductDetails(productDetails);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    public static boolean updateProduct(Product product) {
        String sql = "UPDATE Product SET name = ?, brand = ?, price = ?, discount = ?, description = ?, status = ? WHERE product_id = ?";
        try (Connection conn = getConnect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getBrand());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setString(4, product.getDiscount());
            pstmt.setString(5, product.getDescription());
            pstmt.setInt(6, product.getStatus());
            pstmt.setInt(7, product.getProductID());
            int affectedRows = pstmt.executeUpdate();
            
            // Update ProductDetail
            if (affectedRows > 0) {
                updateProductDetail(product);
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static String statusByProductId(Product product) {
        if (product.getStatus() == 1){
            return "Publish";
        } else {
            return "Unpublish";
        }
    }
    
    private static void updateProductDetail(Product product) {
        String updateSql = "UPDATE ProductDetail SET quantity = ? WHERE product_id = ? AND size = ?";
        String checkSql = "SELECT quantity FROM ProductDetail WHERE product_id = ? AND size = ?";

        try (Connection conn = getConnect()) {
            for (ProductDetail detail : product.getProductDetails()) {
                try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                    checkStmt.setInt(1, product.getProductID());
                    checkStmt.setString(2, detail.getSize());

                    ResultSet rs = checkStmt.executeQuery();

                    if (rs.next()) {
                        // If size exists, update the quantity
                        int currentQuantity = rs.getInt("quantity");
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                            // Update the quantity to the new value directly
                            updateStmt.setInt(1, detail.getQuantity()); // Set to the new quantity
                            updateStmt.setInt(2, product.getProductID());
                            updateStmt.setString(3, detail.getSize());
                            updateStmt.executeUpdate();
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static int countProductsByStatus(int status) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS total FROM Product WHERE status = ?";
        try (Connection con = getConnect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, status);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public static int countLowStockProducts() {
        int count = 0;
        int threshold = 3; //if quanity < 3 => low in-stock
        String sql = "SELECT COUNT(DISTINCT p.product_id) AS count FROM Product p " +
                     "JOIN ProductDetail pd ON p.product_id = pd.product_id " +
                     "WHERE pd.quantity < ?";

        try (Connection con = getConnect(); PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, threshold);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }


    public static void main(String[] args) {
        Product p = getProductById(1);
        System.out.println(p.toString());
    }
}
