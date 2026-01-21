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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <style>
            /* Consistent Theme: Espresso & Mocha */
            body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }
            
            .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }
            .navbar-brand img { height: 40px; margin-right: 10px; }

            /* Stats Cards matching Order Progress cards */
            .stat-card { 
                border-radius: 15px; 
                color: #fff; 
                padding: 24px; 
                text-align: center; 
                transition: transform 0.2s;
                border: none;
                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            }
            .stat-card:hover { transform: translateY(-5px); }

            /* Professional Palette */
            .bg-espresso { background-color: #3e2723; } 
            .bg-mocha { background-color: #5d4037; }    
            .bg-latte { background-color: #8d6e63; }    
            .bg-cream { background-color: #a1887f; }    

            .nav-tabs .nav-link { color: #5d4037; font-weight: 600; border: none; }
            .nav-tabs .nav-link.active { color: #3e2723; border-bottom: 3px solid #3e2723; background: none; }

            .table-container { 
                background: white; 
                border-radius: 20px; 
                overflow: hidden; 
                box-shadow: 0 8px 20px rgba(0,0,0,0.05); 
            }
            .table thead { background-color: #3e2723; color: white; }
            
            .btn-update { background-color: #3e2723; color: white; border-radius: 20px; font-size: 0.8rem; }
            .btn-update:hover { background-color: #5d4037; color: white; }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center fw-bold" href="#">
                    <img src="img/coffeeshopN.png" alt="Logo"> Admin Panel
                </a>
                <div class="navbar-nav ms-auto align-items-center">
                    <span class="text-white-50 me-3 small">Admin: <strong class="text-white"><%= user.getUsername()%></strong></span>
                    <a class="btn btn-outline-light btn-sm rounded-pill px-3 me-2" href="MenuServlet">Live Menu</a>
                    <a class="nav-link text-white small" href="LogoutServlet"><i class="bi bi-box-arrow-right"></i> Logout</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <ul class="nav nav-tabs mb-4" id="adminTab" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="tab-overview" data-bs-toggle="tab" data-bs-target="#overview" type="button">Analytics Report</button>
                </li>
                <li class="nav-item">
                    <button class="nav-link" id="tab-orders" data-bs-toggle="tab" data-bs-target="#ordersMan" type="button">Order Queue</button>
                </li>
                <li class="nav-item">
                    <button class="nav-link" id="tab-manage" data-bs-toggle="tab" data-bs-target="#manage" type="button">Product Inventory</button>
                </li>
            </ul>

            <div class="tab-content" id="adminTabContent">
                <div class="tab-pane fade show active" id="overview">
                    <div class="row g-3 mb-4">
                        <div class="col-md-3">
                            <div class="stat-card bg-espresso">
                                <small class="text-uppercase opacity-75">Total Orders</small>
                                <h2 class="display-6 fw-bold m-0"><%= request.getAttribute("totalOrders")%></h2>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card bg-mocha">
                                <small class="text-uppercase opacity-75">Revenue</small>
                                <h2 class="display-6 fw-bold m-0">RM <%= String.format("%.2f", request.getAttribute("totalRevenue"))%></h2>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card bg-latte">
                                <small class="text-uppercase opacity-75">Products</small>
                                <h2 class="display-6 fw-bold m-0"><%= request.getAttribute("menuItems")%></h2>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card bg-cream">
                                <small class="text-uppercase opacity-75">Pending</small>
                                <h2 class="display-6 fw-bold m-0"><%= request.getAttribute("pendingOrders")%></h2>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px;">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h5 class="m-0 fw-bold" style="color: #3e2723;">Sales Performance Overview</h5>
                                    <button onclick="window.print()" class="btn btn-sm btn-outline-brown rounded-pill">
                                        <i class="bi bi-printer"></i> Print PDF Report
                                    </button>
                                </div>
                                <div class="bg-light rounded-4 d-flex align-items-center justify-content-center" style="height: 350px; border: 2px dashed #d7ccc8;">
                                    <div class="text-center">
                                        <i class="bi bi-graph-up text-muted display-1"></i>
                                        <p class="text-muted mt-2">Dynamic Revenue Chart will render here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="ordersMan">
                    <div class="table-container shadow-sm">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">Order ID</th>
                                    <th>Service</th>
                                    <th>Customization</th>
                                    <th>Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<OrderBean> orders = (List<OrderBean>) request.getAttribute("orders");
                                    if (orders != null) {
                                        for (OrderBean o : orders) {
                                %>
                                <tr>
                                    <td class="ps-4 fw-bold">#<%= o.getOrderId()%></td>
                                    <td><span class="badge rounded-pill bg-info text-dark px-3"><%= o.getOrderType()%></span></td>
                                    <td>
                                        <small class="text-muted">
                                            <%= (o.getOrderCustomization() == null || o.getOrderCustomization().equalsIgnoreCase("null")) ? "No instructions" : o.getOrderCustomization()%>
                                        </small>
                                    </td>
                                    <td>
                                        <%-- Status labels matching image_f39762.png --%>
                                        <span class="badge rounded-pill <%= o.getOrderStatus().equals("Done") ? "bg-success" : "bg-warning text-dark"%> px-3">
                                            <%= o.getOrderStatus()%>
                                        </span>
                                    </td>
                                    <td class="pe-4">
                                        <form action="UpdateOrderStatusServlet" method="POST" class="d-flex gap-2 justify-content-center">
                                            <input type="hidden" name="orderId" value="<%= o.getOrderId()%>">
                                            <select name="newStatus" class="form-select form-select-sm rounded-pill" style="width: 140px;">
                                                <option value="Pending" <%= o.getOrderStatus().equals("Pending") ? "selected" : ""%>>Pending</option>
                                                <option value="In the making" <%= o.getOrderStatus().equals("In the making") ? "selected" : ""%>>In the making</option>
                                                <option value="Ready to pickup" <%= o.getOrderStatus().equals("Ready to pickup") ? "selected" : ""%>>Ready to pickup</option>
                                                <option value="Done" <%= o.getOrderStatus().equals("Done") ? "selected" : ""%>>Done</option>
                                            </select>
                                            <button type="submit" class="btn btn-sm btn-update px-3">Update</button>
                                            <a href="DeleteOrderServlet?id=<%= o.getOrderId()%>" class="text-danger ms-2 mt-1" onclick="return confirm('Permanently delete?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </form>
                                    </td>
                                </tr>
                                <% } } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane fade" id="manage">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="fw-bold" style="color: #3e2723;">Product Catalog</h4>
                        <a href="add_menu.jsp" class="btn btn-mocha rounded-pill px-4 text-white" style="background-color: #5d4037;">
                            <i class="bi bi-plus-circle"></i> Add New Coffee
                        </a>
                    </div>
                    <div class="table-container shadow-sm">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th class="text-center">Manage</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                                    if (products != null) {
                                        for (ProductBean p : products) {
                                %>
                                <tr>
                                    <td class="ps-4 text-muted"><%= p.getProdId()%></td>
                                    <td><strong style="color: #3e2723;"><%= p.getProdName()%></strong></td>
                                    <td class="fw-bold">RM <%= String.format("%.2f", p.getProdPrice())%></td>
                                    <td><span class="badge bg-success-subtle text-success border border-success px-3">Active</span></td>
                                    <td class="text-center pe-4">
                                        <a href="EditProductServlet?id=<%= p.getProdId()%>" class="btn btn-sm btn-outline-mocha rounded-pill px-3">Edit</a>
                                        <a href="DeleteProductServlet?id=<%= p.getProdId()%>" class="btn btn-sm btn-outline-danger rounded-pill px-3 ms-1" onclick="return confirm('Delete item?')">Delete</a>
                                    </td>
                                </tr>
                                <% } }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>