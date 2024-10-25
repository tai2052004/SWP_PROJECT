package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Coupon;

public class CouponDB implements DatabaseInfo {
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

    public static boolean addCoupon(Coupon coupon) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                "INSERT INTO Coupons(coupon_name, coupon_code, discount_value, quantity) VALUES (?, ?, ?, ?)",
                PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, coupon.getCouponName());
            stmt.setString(2, coupon.getCouponCode());
            stmt.setDouble(3, coupon.getDiscountValue());
            stmt.setInt(4, coupon.getQuantity());
            
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    coupon.setCouponId(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean couponExists(String couponCode) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM Coupons WHERE coupon_code = ?");
            stmt.setString(1, couponCode);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static ArrayList<Coupon> listAllCoupons() {
        ArrayList<Coupon> couponList = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Coupons");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("coupon_id");
                String name = rs.getString("coupon_name");
                String code = rs.getString("coupon_code");
                double discountValue = rs.getDouble("discount_value");
                int quantity = rs.getInt("quantity");
                
                Coupon coupon = new Coupon(id, name, code, discountValue, quantity);
                couponList.add(coupon);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return couponList;
    }

    public static Coupon getCouponById(int couponId) {
        Coupon coupon = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Coupons WHERE coupon_id = ?");
            stmt.setInt(1, couponId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("coupon_name");
                String code = rs.getString("coupon_code");
                double discountValue = rs.getDouble("discount_value");
                int quantity = rs.getInt("quantity");
                
                coupon = new Coupon(couponId, name, code, discountValue, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return coupon;
    }

    public static boolean updateCoupon(Coupon coupon) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                "UPDATE Coupons SET coupon_name = ?, coupon_code = ?, discount_value = ?, quantity = ? WHERE coupon_id = ?"
            );
            stmt.setString(1, coupon.getCouponName());
            stmt.setString(2, coupon.getCouponCode());
            stmt.setDouble(3, coupon.getDiscountValue());
            stmt.setInt(4, coupon.getQuantity());
            stmt.setInt(5, coupon.getCouponId());
            
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteCoupon(int couponId) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Coupons WHERE coupon_id = ?");
            stmt.setInt(1, couponId);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static Coupon getCouponByCode(String couponCode) {
        Coupon coupon = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Coupons WHERE coupon_code = ?");
            stmt.setString(1, couponCode);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("coupon_id");
                String name = rs.getString("coupon_name");
                double discountValue = rs.getDouble("discount_value");
                int quantity = rs.getInt("quantity");
                
                coupon = new Coupon(id, name, couponCode, discountValue, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return coupon;
    }

    public static void main(String[] args) {
        // Test methods here
        Coupon testCoupon = new Coupon(1, "Test Coupon", "TEST123", 10.0, 100);
        boolean added = addCoupon(testCoupon);
        System.out.println("Coupon added: " + added);
    }
}