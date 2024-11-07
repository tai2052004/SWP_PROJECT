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
import java.beans.Statement;
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
    
    public static boolean addNewProduct(Product product) {
        try (Connection conn = getConnect()) {
            // Insert into Product table
            PreparedStatement productStmt = conn.prepareStatement(
                    "INSERT INTO Product (name, brand, price, discount, description,image_urls, status) VALUES (?, ?, ?, ?, ?, ?,?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            float price = (float)product.getPrice();
            float discount = Float.parseFloat(product.getDiscount());
            productStmt.setString(1, product.getProductName());
            productStmt.setString(2, product.getBrand());
            productStmt.setFloat(3,price);
            productStmt.setString(4, product.getDiscount());
            productStmt.setString(5, product.getDescription());
            productStmt.setString(6, product.getImg_url());
            productStmt.setInt(7, product.getStatus());

            int rowsInserted = productStmt.executeUpdate();

            if (rowsInserted > 0) {
                // Retrieve generated product_id
                ResultSet generatedKeys = productStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int productId = generatedKeys.getInt(1);
                    product.setProductID(productId); // Set the generated ID to the product object

                    // Insert product details into ProductDetail table
                    PreparedStatement detailStmt = conn.prepareStatement(
                            "INSERT INTO ProductDetail (product_id, size, quantity) VALUES (?, ?, ?)"
                    );
                    for (ProductDetail detail : product.getProductDetails()) {
                        detailStmt.setInt(1, productId);
                        detailStmt.setString(2, detail.getSize());
                        detailStmt.setInt(3, detail.getQuantity());
                        detailStmt.executeUpdate();
                    }
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
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
    public static List<Product> getProductsByStatus(int status) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT product_id, name, brand, price, discount, description, image_urls, status "
                   + "FROM Product WHERE status = ?";
        try (Connection con = getConnect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, status);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("product_id");
                String productName = rs.getString("name");
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                String discount = rs.getString("discount");
                String description = rs.getString("description");
                String imageUrl = rs.getString("image_urls");
                int productStatus = rs.getInt("status");

                Product product = new Product(id, productName, brand, price, discount, description, imageUrl, productStatus);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    public static List<Product> getProductByFavourite(int user_id) {
        List<Product> productList = new ArrayList<>();
        String sql = "Select * from Product p "
                + "JOIN Favorite f ON p.product_id = f.product_id "
                + "JOIN Users u on f.user_id = u.ID "
                + "Where u.ID = ? ";
        try (Connection con = getConnect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, user_id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setImg_url(rs.getString("image_urls"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getString("discount"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }



    public static void main(String[] args) {
    }
}

