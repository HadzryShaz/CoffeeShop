/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.dao;

import coffeeshop.model.UserBean;
import coffeeshop.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ajiji
 */
public class UserDao {

    public UserBean authenticateUser(String username, String password) {
        // Using exact column names from your schema
        String sql = "SELECT * FROM USERS WHERE USER_USERNAME = ? AND USER_PASSWORD = ?";

        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                UserBean user = new UserBean();
                user.setUserId(rs.getInt("USER_ID"));
                user.setUsername(rs.getString("USER_USERNAME"));
                user.setRole(rs.getString("USER_ROLE"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String registerUser(UserBean user) {
        // Match columns: USER_USERNAME, USER_EMAIL, USER_PASSWORD, USER_ROLE
        String sql = "INSERT INTO USERS (USER_USERNAME, USER_EMAIL, USER_PASSWORD, USER_ROLE) VALUES (?, ?, ?, 'Customer')";

        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                return "SUCCESS";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "FAIL";
    }
}
