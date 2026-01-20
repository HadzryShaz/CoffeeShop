<%@page import="coffeeshop.model.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="coffeeshop.model.ProductBean"%>
<%@page import="coffeeshop.model.OrderBean"%>
<!DOCTYPE html>
<html lang="en">
    <%
    UserBean user = (UserBean) session.getAttribute("user");
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .stat-card { border-radius: 10px; color: white; padding: 20px; text-align: center; }
            .bg-orders { background-color: #17a2b8; } .bg-revenue { background-color: #28a745; }
            .bg-items { background-color: #ffc107; } .bg-pending { background-color: #dc3545; }
        </style>
    </head>
    <body class="bg-light">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">CoffeeShop Admin</a>
                <div class="navbar-nav ms-auto">
                    <h3>Welcome, <%= ((UserBean)session.getAttribute("user")).getUsername() %>!</h3>
                    <a class="nav-link" href="MenuServlet">View Live Menu</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <ul class="nav nav-tabs mb-4" id="adminTab" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="overview-tab" data-bs-toggle="tab" data-bs-target="#overview">Overview</button>
                </li>
                <li class="nav-item">
                    <button class="nav-link" id="manage-tab" data-bs-toggle="tab" data-bs-target="#manage">Manage Menu</button>
                </li>
                <li class="nav-item">
                    <button class="nav-link" id="orders-tab" data-bs-toggle="tab" data-bs-target="#ordersMan">Order Management</button>
                </li>

                
            </ul>

            <div class="tab-content" id="adminTabContent">
                <div class="tab-pane fade show active" id="overview">
                    <div class="row g-3 mb-4">
                        <div class="col-md-3"><div class="stat-card bg-orders"><h5>Total Orders</h5><h2>45</h2></div></div>
                        <div class="col-md-3"><div class="stat-card bg-revenue"><h5>Total Revenue</h5><h2>$650</h2></div></div>
                        <div class="col-md-3"><div class="stat-card bg-items"><h5>Menu Items</h5><h2>12</h2></div></div>
                        <div class="col-md-3"><div class="stat-card bg-pending"><h5>Pending Orders</h5><h2>8</h2></div></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6"><div class="card p-3 shadow-sm"><h5>Orders by Type</h5><hr><div style="height:200px; background:#f8f9fa; border:1px dashed #ccc; text-align:center; line-height:200px;">Chart Placeholder</div></div></div>
                        <div class="col-md-6"><div class="card p-3 shadow-sm"><h5>Revenue by Item</h5><hr><div style="height:200px; background:#f8f9fa; border:1px dashed #ccc; text-align:center; line-height:200px;">Chart Placeholder</div></div></div>
                    </div>
                </div>
<div class="tab-pane fade" id="ordersMan">
                    <h3>Customer Orders</h3>
                    <div class="card shadow-sm p-3">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>Order ID</th>
                                    <th>Type</th>
                                    <th>Status</th>
                                    <th>Update Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<OrderBean> orders = (List<OrderBean>) request.getAttribute("orders");
                                    if (orders != null) {
                                        for (OrderBean o : orders) {
                                %>
                                <tr>
                                    <td>#<%= o.getOrderId()%></td>
                                    <td><span class="badge bg-info text-dark"><%= o.getOrderType()%></span></td>
                                    <td>
                                        <span class="badge <%= o.getOrderStatus().equals("Done") ? "bg-success" : "bg-warning text-dark"%>">
                                            <%= o.getOrderStatus()%>
                                        </span>
                                    </td>
                                    <td>
                                        <form action="UpdateOrderStatusServlet" method="POST" class="d-flex gap-2">
                                            <input type="hidden" name="orderId" value="<%= o.getOrderId()%>">
                                            <select name="newStatus" class="form-select form-select-sm">
                                                <option value="Pending" <%= o.getOrderStatus().equals("Pending") ? "selected" : ""%>>Pending</option>
                                                <option value="In the making" <%= o.getOrderStatus().equals("In the making") ? "selected" : ""%>>In the making</option>
                                                <option value="Done" <%= o.getOrderStatus().equals("Done") ? "selected" : ""%>>Done</option>
                                                <option value="Ready to pickup" <%= o.getOrderStatus().equals("Ready to pickup") ? "selected" : ""%>>Ready to pickup</option>
                                            </select>
                                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                                        </form>
                                    </td>
                                </tr>
                                <%      }
                    } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="manage">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3>Product Inventory</h3>
                        <a href="add_menu.jsp" class="btn btn-success">+ Add New Product</a>
                    </div>
                    <div class="card shadow-sm p-3">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                                    if (products != null) {
                                        for (ProductBean p : products) {
                                %>
                                <tr>
                                    <td><%= p.getProdId()%></td>
                                    <td><strong><%= p.getProdName()%></strong></td>
                                    <td>RM <%= String.format("%.2f", p.getProdPrice())%></td>
                                    <td><span class="badge bg-success">Available</span></td>
                                    <td>
                                        <a href="EditProductServlet?id=<%= p.getProdId()%>" class="btn btn-sm btn-outline-warning">Edit</a>
                                        <a href="DeleteProductServlet?id=<%= p.getProdId()%>" 
                                           class="btn btn-sm btn-outline-danger" 
                                           onclick="return confirm('Are you sure you want to delete this coffee item?')">
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                                <%      }
                                    }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>