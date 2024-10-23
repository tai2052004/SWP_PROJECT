    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.User;

public class UserDB implements DatabaseInfo{
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
    public static User login(String username, String password) {
        User user = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Users WHERE User_name=? AND User_password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int userID = rs.getInt("ID");
                String email = rs.getString("User_email");
                String role = rs.getString("User_role");
                String fullname = rs.getString("User_fullname");
                String dob = rs.getString("User_dob");
                String address = rs.getString("User_address");
                String gender = rs.getString("User_gender");
                String phone = rs.getString("User_phone");
                user = new User(userID,username, password, email, role,fullname, dob, phone, address,gender);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }
    public static boolean addUser(User user) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "Insert into Users(User_name,User_password,User_email,User_role) values (?, ?, ?,?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, user.getUser_name());
            stmt.setString(2, user.getUser_password());
            stmt.setString(3, user.getUser_email());
            stmt.setString(4, user.getUser_role());
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    user.setUser_id(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean addUserDetailS(User user) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "Insert into Users(User_name,User_password,User_email,User_role,User_fullname,User_phone,User_address) values (?, ?, ?, ?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, user.getUser_name());
            stmt.setString(2, user.getUser_password());
            stmt.setString(3, user.getUser_email());
            stmt.setString(4, user.getUser_role());
            stmt.setString(5,user.getFullname());
            stmt.setString(6, user.getPhone());
            stmt.setString(7, user.getAddress());
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    user.setUser_id(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static ArrayList<User> listAllUsers() {
        ArrayList<User> userList = new ArrayList<>();
        try (Connection con=getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT ID, User_name, User_password,User_email,User_role FROM Users");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String user_name = rs.getString("User_name");
                String password = rs.getString("User_password");
                String email = rs.getString("User_email");
                String role = rs.getString("User_role");
                User user = new User(id,user_name, password, email, role);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
    public static boolean userExists(String username) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM Users WHERE User_name = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean userExistsEmail(String email) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM Users WHERE User_email = ?");
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
//    public static boolean deleteUser(int ID) throws Exception {
//        try (Connection con=getConnect()) {
//            PreparedStatement stmt = con.prepareStatement("DELETE FROM Users WHERE ID = ?");
//            stmt.setInt(1, ID);
//            int rowsDeleted = stmt.executeUpdate();
//            return rowsDeleted > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//    public static int getTotalUsers() throws Exception {
//        int totalUsers = 0;
//        String query = "SELECT COUNT(*) FROM Users";
//        try (Connection con = getConnect();
//             PreparedStatement ps = con.prepareStatement(query);
//             ResultSet rs = ps.executeQuery()) {
//            if (rs.next()) {
//                totalUsers = rs.getInt(1);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return totalUsers;
//    }
    public static User getUserDetailById(int userId) {
        User user = null;

        try (Connection con = getConnect()) {
            String query = "SELECT * FROM Users WHERE ID = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUser_id(rs.getInt("ID"));
                user.setUser_name(rs.getString("User_name"));
                user.setUser_password(rs.getString("User_password"));
                user.setUser_email(rs.getString("User_email"));
                user.setUser_role(rs.getString("User_role"));
                user.setFullname(rs.getString("User_fullname"));
                user.setDob(rs.getString("User_dob"));
                user.setPhone(rs.getString("User_phone"));
                user.setAddress(rs.getString("User_address"));
                user.setGender(rs.getString("User_gender"));  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static boolean UpdateProfile(User user) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Users SET User_fullname = ?, User_gender = ?, User_dob = ?, User_phone = ?, User_address = ?, User_email = ? WHERE ID = ?",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, user.getFullname()); 
            stmt.setString(2, user.getGender());   
            stmt.setString(3, user.getDob());    
            stmt.setString(4, user.getPhone());    
            stmt.setString(5, user.getAddress()); 
            stmt.setString(6, user.getUser_email());
            stmt.setInt(7,user.getUser_id());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean ChangePassword(User user) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Users SET User_password = ? WHERE ID = ?",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, user.getUser_password());
            stmt.setInt(2, user.getUser_id());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean UpdateUser(User user) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Users SET User_fullname = ?, User_gender = ?, User_phone = ?, User_email = ?, User_role = ? WHERE ID = ?",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, user.getFullname()); 
            stmt.setString(2, user.getGender());      
            stmt.setString(3, user.getPhone());    
            stmt.setString(4, user.getUser_email());
            stmt.setString(5, user.getUser_role());
            stmt.setInt(6,user.getUser_id());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args){
        User user = UserDB.login("ngocthien2503", "ngocthien"); 
        System.out.println(user);
    }
}

