package coffeeshop.dao;

import coffeeshop.model.OrderBean;
import coffeeshop.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    // 1. Method to fetch all orders for the Dashboard
  public List<OrderBean> getAllOrders() {
    List<OrderBean> orderList = new ArrayList<>();
    String sql = "SELECT * FROM ORDERS ORDER BY ORDER_DATE DESC";
    try (Connection con = DBConnection.createConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            OrderBean order = new OrderBean();
            order.setOrderId(rs.getInt("ORDER_ID"));
            order.setUserId(rs.getInt("USER_ID"));
            order.setTotalPrice(rs.getDouble("TOTAL_PRICE"));
            order.setOrderType(rs.getString("ORDER_TYPE"));
            order.setOrderStatus(rs.getString("ORDER_STATUS")); // Get the status
            orderList.add(order);
        }
    } catch (SQLException e) { e.printStackTrace(); }
    return orderList;
}

public void updateOrderStatus(int orderId, String status) {
    String sql = "UPDATE ORDERS SET ORDER_STATUS = ? WHERE ORDER_ID = ?";
    try (Connection con = DBConnection.createConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, status);
        ps.setInt(2, orderId);
        ps.executeUpdate();
    } catch (SQLException e) { e.printStackTrace(); }
}
}
