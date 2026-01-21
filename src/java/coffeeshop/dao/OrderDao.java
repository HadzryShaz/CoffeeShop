package coffeeshop.dao;

import coffeeshop.model.CartItemBean;
import coffeeshop.model.OrderBean;
import coffeeshop.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public List<OrderBean> getAllOrders() {
        List<OrderBean> list = new ArrayList<>();
        String sql = "SELECT o.ORDER_ID, o.ORDER_TYPE, o.ORDER_STATUS, i.CUSTOM_NOTES "
                + "FROM ORDERS o "
                + "JOIN ORDER_ITEMS i ON o.ORDER_ID = i.ORDER_ID "
                + "ORDER BY o.ORDER_ID DESC";

        try (Connection con = DBConnection.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                OrderBean o = new OrderBean();
                o.setOrderId(rs.getInt("ORDER_ID"));
                o.setOrderType(rs.getString("ORDER_TYPE"));
                o.setOrderStatus(rs.getString("ORDER_STATUS"));

                // This pulls the text from the CUSTOM_NOTES column
                o.setOrderCustomization(rs.getString("CUSTOM_NOTES"));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE ORDERS SET ORDER_STATUS = ? WHERE ORDER_ID = ?";
        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addOrder(OrderBean order) {
        String sql = "INSERT INTO ORDERS (USER_ID, TOTAL_PRICE, ORDER_TYPE, ORDER_STATUS, ORDER_CUSTOMIZATION) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalPrice());
            ps.setString(3, order.getOrderType());
            ps.setString(4, "Pending");
            ps.setString(5, order.getOrderCustomization()); // Save customization here

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean placeOrder(OrderBean order, List<CartItemBean> cart) {
        Connection con = null;
        try {
            con = DBConnection.createConnection();
            con.setAutoCommit(false); // Start transaction

            // 1. Insert into ORDERS table
            String orderSql = "INSERT INTO ORDERS (USER_ID, TOTAL_PRICE, ORDER_TYPE, ORDER_STATUS) VALUES (?, ?, ?, ?)";
            PreparedStatement psOrder = con.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, order.getUserId());
            psOrder.setDouble(2, order.getTotalPrice());
            psOrder.setString(3, order.getOrderType());
            psOrder.setString(4, order.getOrderStatus());
            psOrder.executeUpdate();

            // Get the generated ORDER_ID
            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // 2. Insert into ORDER_ITEMS table
            String itemSql = "INSERT INTO ORDER_ITEMS (ORDER_ID, PROD_ID, QUANTITY, CUSTOM_NOTES, SUBTOTAL) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psItem = con.prepareStatement(itemSql);

            for (CartItemBean item : cart) {
                psItem.setInt(1, orderId);
                psItem.setInt(2, item.getProduct().getProdId());
                psItem.setInt(3, item.getQuantity());
                // This pulls the data from your new modal
                psItem.setString(4, item.getCustomization());
                psItem.setDouble(5, item.getProduct().getProdPrice() * item.getQuantity());
                psItem.addBatch();
            }
            psItem.executeBatch();

            con.commit(); // Save everything
            return true;
        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (Exception ex) {
                }
            }
            e.printStackTrace();
            return false;
        }
    }

    public OrderBean getLatestUserOrder(int userId) {
        OrderBean order = null;
        String sql = "SELECT * FROM ORDERS WHERE USER_ID = ? ORDER BY ORDER_DATE DESC FETCH FIRST 1 ROWS ONLY";

        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order = new OrderBean();
                order.setOrderId(rs.getInt("ORDER_ID"));
                order.setOrderStatus(rs.getString("ORDER_STATUS")); //
                order.setOrderType(rs.getString("ORDER_TYPE"));
                order.setTotalPrice(rs.getDouble("TOTAL_PRICE"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public int getTotalOrderCount() {
        String sql = "SELECT COUNT(*) FROM ORDERS"; //
        try (Connection con = DBConnection.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public double getTotalRevenue() {
        // Only count completed/ready orders as revenue
        String sql = "SELECT SUM(TOTAL_PRICE) FROM ORDERS WHERE ORDER_STATUS IN ('Done', 'Ready to pickup')";
        try (Connection con = DBConnection.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public int getPendingOrderCount() {
        String sql = "SELECT COUNT(*) FROM ORDERS WHERE ORDER_STATUS = 'Pending'";
        try (Connection con = DBConnection.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void saveOrderItem(int orderId, CartItemBean item) {
        // Note: CUSTOM_NOTES maps to your item.getCustomization()
        String sql = "INSERT INTO ORDER_ITEMS (ORDER_ID, PROD_ID, QUANTITY, CUSTOM_NOTES, SUBTOTAL) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ps.setInt(2, item.getProduct().getProdId());
            ps.setInt(3, 1); // Or item.getQuantity() if you have one
            ps.setString(4, item.getCustomization()); // This saves the note!
            ps.setDouble(5, item.getProduct().getProdPrice());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteOrder(int orderId) {
        String deleteItemsSql = "DELETE FROM ORDER_ITEMS WHERE ORDER_ID = ?";
        String deleteOrderSql = "DELETE FROM ORDERS WHERE ORDER_ID = ?";

        try (Connection con = DBConnection.createConnection()) {
            con.setAutoCommit(false); // Start transaction

            try (PreparedStatement psItems = con.prepareStatement(deleteItemsSql);
                    PreparedStatement psOrder = con.prepareStatement(deleteOrderSql)) {

                // 1. Delete items first
                psItems.setInt(1, orderId);
                psItems.executeUpdate();

                // 2. Delete the main order record
                psOrder.setInt(1, orderId);
                int affectedRows = psOrder.executeUpdate();

                con.commit();
                return affectedRows > 0;
            } catch (SQLException e) {
                con.rollback();
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
