package coffeeshop.model;

import java.io.Serializable;

public class OrderBean implements Serializable {

    private int orderId;
    private int userId;
    private double totalPrice;
    private String orderType;   // "Dine In" or "Take Away"
    private String orderStatus; // "Pending", "In the making", "Done", etc.

    // Default Constructor
    public OrderBean() {
    }
    //Normal Constructor
    public OrderBean(int orderId, int userId, double totalPrice, String orderType, String orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.orderType = orderType;
        this.orderStatus = orderStatus;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    private String orderCustomization;

public String getOrderCustomization() { return orderCustomization; }
public void setOrderCustomization(String orderCustomization) { this.orderCustomization = orderCustomization; }
}
