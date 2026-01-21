<%@page import="coffeeshop.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, coffeeshop.model.OrderBean, coffeeshop.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Orders - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }
        .navbar { background-color: #3e2723; border-bottom: 4px solid #d7ccc8; }
        .navbar-brand img { height: 40px; margin-right: 10px; }
        
        .order-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            background: #fff;
            margin-bottom: 25px;
        }
        .order-header {
            background: #5d4037;
            color: white;
            padding: 15px 25px;
        }
        .progress { height: 15px; border-radius: 10px; background-color: #e9ecef; }
        .btn-refresh { background-color: #8d6e63; color: white; border-radius: 25px; border: none; }
        .btn-refresh:hover { background-color: #3e2723; color: white; }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center fw-bold" href="index.jsp">
                <img src="img/coffeeshopN.png" alt="Logo"> CoffeeShop
            </a>
            <div class="ms-auto">
                <a href="MenuServlet" class="btn btn-outline-light btn-sm rounded-pill px-4">Back to Menu</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-7">
                
                <div class="text-center mb-5">
                    <h2 class="fw-bold" style="color: #3e2723;">Order Tracker</h2>
                    <p class="text-muted">Stay updated on your caffeine fix!</p>
                </div>

                <%
                    UserBean user = (UserBean) session.getAttribute("user");
                    if (user == null) { response.sendRedirect("login.jsp"); return; }

                    OrderDao dao = new OrderDao();
                    // Fetch all orders as a list to prevent overwriting
                    List<OrderBean> userOrders = dao.getActiveUserOrders(user.getUserId());

                    if (userOrders != null && !userOrders.isEmpty()) {
                        for (OrderBean order : userOrders) { 
                            String status = order.getOrderStatus();
                            int progressValue = 0;
                            String barColor = "bg-warning";

                            // Logic to determine progress based on current status
                            if ("Pending".equals(status)) {
                                progressValue = 25;
                            } else if ("In the making".equals(status)) {
                                progressValue = 50;
                                barColor = "bg-info";
                            } else if ("Done".equals(status)) {
                                progressValue = 75;
                                barColor = "bg-primary";
                            } else if ("Ready to pickup".equals(status)) {
                                progressValue = 100;
                                barColor = "bg-success";
                            }
                %>
                    <div class="order-card">
                        <div class="order-header d-flex justify-content-between align-items-center">
                            <span>Order #<%= order.getOrderId() %></span>
                            <span class="badge rounded-pill bg-light text-dark"><%= order.getOrderType() %></span>
                        </div>
                        
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h6 class="text-uppercase fw-bold m-0" style="color: #5d4037;"><%= status %></h6>
                                <span class="fw-bold fs-5">RM <%= String.format("%.2f", order.getTotalPrice()) %></span>
                            </div>
                            
                            <div class="progress mb-3">
                                <div class="progress-bar progress-bar-striped progress-bar-animated <%= barColor %>" 
                                     style="width: <%= progressValue %>%"></div>
                            </div>

                            <% if ("Ready to pickup".equals(status)) { %>
                                <div class="text-center mt-3">
                                    <span class="badge bg-success-subtle text-success p-2 px-3 border border-success">
                                        ☕ Your drink is ready at the counter!
                                    </span>
                                </div>
                            <% } %>
                        </div>
                    </div>
                <% 
                        } 
                    } else { 
                %>
                    <div class="card text-center p-5 border-0 shadow-sm rounded-4">
                        <h5 class="text-muted">No active orders found.</h5>
                        <div class="mt-3">
                            <a href="MenuServlet" class="btn btn-refresh px-5 py-2">Order Now</a>
                        </div>
                    </div>
                <% } %>
                
                <div class="text-center mt-4">
                    <button onclick="location.reload()" class="btn btn-refresh px-4">
                        Refresh Status
                    </button>
                </div>

            </div>
        </div>
    </div>

    <script>
        // Auto-refresh every 15 seconds to sync with Admin Dashboard changes
        setTimeout(function() {
            location.reload();
        }, 15000);
    </script>
</body>
<%@include file="footer.jsp" %>
</html>