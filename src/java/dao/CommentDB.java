/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DatabaseInfo.DBURL;
import static dao.DatabaseInfo.DRIVERNAME;
import static dao.DatabaseInfo.PASSDB;
import static dao.DatabaseInfo.USERDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Comment;

/**
 *
 * @author ADMIN
 */
public class CommentDB {
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
    
    public static boolean addComment(Comment comment) {
        try (Connection con = getConnect()){
            PreparedStatement stmt = con.prepareStatement(
                    "INSERT INTO Comment (content, star, id_user, product_id) VALUES (?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stmt.setString(1, comment.getContent());
            stmt.setInt(2, comment.getStar());
            stmt.setInt(3, comment.getUser_id());
            stmt.setInt(4, comment.getProductID());
            
            int rowsInserted = stmt.executeUpdate();
            
            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    comment.setComment_id(generatedKeys.getInt(1));
                    return true;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static ArrayList<Comment> listAllCommentsByProductID(int product_id) {
        ArrayList<Comment> commentList = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Comment WHERE product_id = ?");
            stmt.setInt(1, product_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int comment_id = rs.getInt("comment_id");
                String content = rs.getString("content");
                int star = rs.getInt("star");
                int user_id = rs.getInt("id_user");
                int productId = rs.getInt("product_id");
                Comment com = new Comment(comment_id, content, star, user_id, productId);
                commentList.add(com);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }
    
}
