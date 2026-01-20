package coffeeshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:derby://localhost:1527/CShopV2"; // Database URL
    private static final String USER = "app"; // Database username
    private static final String PASSWORD = "app"; // Database password

    public static Connection createConnection() {
        Connection connection = null;
        try {
            // Load the JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            // Establish the connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connection established successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to establish connection.");
            e.printStackTrace();
        }
        return connection;
    }
}