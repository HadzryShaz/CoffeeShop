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
            /* Professional Coffee Palette */
            .stat-card { 
                border-radius: 12px; 
                color: #fff; 
                padding: 24px; 
                text-align: center; 
                transition: transform 0.2s;
                border: none;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }
            .stat-card:hover { transform: translateY(-5px); }

            /* Coffee Tones */
            .bg-dark-coffee { background-color: #3e2723; } /* Deep Espresso */
            .bg-mocha { background-color: #5d4037; }       /* Rich Mocha */
            .bg-latte { background-color: #8d6e63; }       /* Warm Latte */
            .bg-cream { background-color: #a1887f; }       /* Light Roast */

            .card-title-sm { 
                font-size: 0.9rem; 
                text-transform: uppercase; 
                letter-spacing: 1px; 
                opacity: 0.9; 
            }
        </style>
    </head>
    <body class="bg-light">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">CoffeeShop Admin</a>
                <div class="navbar-nav ms-auto align-items-center">
                    <span class="text-white me-3">Welcome, <strong><%= user.getUsername()%></strong>!</span>
                    <a class="nav-link" href="MenuServlet">View Live Menu</a>
                    <a class="nav-link text-danger" href="LogoutServlet">Logout</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <ul class="nav nav-tabs mb-4" id="adminTab" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="tab-overview" data-bs-toggle="tab" data-bs-target="#overview" type="button">Report</button>

                </li>
                <li class="nav-item">
                    <button class="nav-link " id="tab-orders" data-bs-toggle="tab" data-bs-target="#ordersMan" type="button">Order Management</button>

                </li>
                <li class="nav-item">
                    <button class="nav-link" id="tab-manage" data-bs-toggle="tab" data-bs-target="#manage" type="button">Manage Menu</button>

                </li>
            </ul>

            <div class="tab-content" id="adminTabContent">
                <div class="tab-pane fade" id="overview">
                    <div class="row g-3 mb-4">
                        <div class="col-md-3">
                            <div class="stat-card bg-dark-coffee">
                                <h5 class="card-title-sm">Total Orders</h5>
                                <h2 class="display-6 fw-bold"><%= request.getAttribute("totalOrders")%></h2>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="stat-card bg-mocha">
                                <h5 class="card-title-sm">Total Revenue</h5>
                                <h2 class="display-6 fw-bold">RM <%= String.format("%.2f", request.getAttribute("totalRevenue"))%></h2>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="stat-card bg-latte">
                                <h5 class="card-title-sm">Menu Items</h5>
                                <h2 class="display-6 fw-bold"><%= request.getAttribute("menuItems")%></h2>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="stat-card bg-cream">
                                <h5 class="card-title-sm">Active Queue</h5>
                                <h2 class="display-6 fw-bold"><%= request.getAttribute("pendingOrders")%></h2>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="card border-0 shadow-sm p-4 mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="m-0 fw-bold">Sales Performance</h5>
                                    <button onclick="window.print()" class="btn btn-sm btn-outline-secondary">Download PDF Report</button>
                                </div>
                                <div class="bg-light rounded d-flex align-items-center justify-content-center" style="height: 300px; border: 2px dashed #d7ccc8;">
                                    <p class="text-muted">Dynamic Sales Chart will render here</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm p-4">
                                <h5 class="fw-bold mb-3">Today's Goal</h5>
                                <div class="progress mb-2" style="height: 10px;">
                                    <div class="progress-bar bg-dark-coffee" style="width: 70%"></div>
                                </div>
                                <small class="text-muted">70% of daily target reached (RM 1000.00)</small>
                            </div>
                        </div>
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
                                    <th>Customization</th>
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
                                        <small>
                                            <%= (o.getOrderCustomization() == null || o.getOrderCustomization().equalsIgnoreCase("null"))
                ? "No specific instructions" : o.getOrderCustomization()%>
                                        </small>
                                    </td>

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