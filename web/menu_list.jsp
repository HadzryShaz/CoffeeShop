
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="coffeeshop.model.ProductBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Menu - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .card-img-standard {
                height: 200px;
                width: 100%;
                object-fit: contain;
                background-color: #f8f9fa;
            }
            .navbar-nav .nav-item { padding: 0 15px; }
        </style>
    </head>
    <body class="bg-light">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">CoffeeShop</a>
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="MenuServlet">Menu</a>

                    <%-- Check if user is logged in --%>
                    <% if (session.getAttribute("user") != null) { %>
                    <a class="nav-link" href="cart.jsp">Cart</a>
                    <a class="btn btn-outline-warning ms-lg-2" href="order_progress.jsp">
                        <i class="bi bi-clock-history"></i> Track Order
                    </a>
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                    <% } else { %>
                    <a class="nav-link" href="login.jsp">Login</a>
                    <a class="nav-link" href="register.jsp">Register</a>
                    <% } %>
                </div>
            </div>
        </nav>

        <div class="container-fluid bg-white text-center p-5 shadow-sm">
            <h1 class="display-5 fw-bold">Our Full Menu</h1>
            <p class="lead">Explore our variety of freshly brewed coffee and treats</p>
        </div>

        <div class="container mt-5">
            <div class="row g-4 justify-content-center">
                <%
                    // 1. Get the list of products passed by MenuServlet [cite: 200]
                    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");

                    if (products != null && !products.isEmpty()) {
                        for (ProductBean p : products) {
                %>
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="<%= p.getProdImagePath()%>" class="card-img-top" alt="<%= p.getProdName()%>">
                        <div class="card-body text-center">
                            <h5 class="card-title"><%= p.getProdName()%></h5>
                            <p class="card-text text-muted small"><%= p.getProdDescription()%></p>
                            <h6 class="text-primary mb-3">RM <%= String.format("%.2f", p.getProdPrice())%></h6>
                            <form action="AddToCartServlet" method="POST">
                                <input type="hidden" name="prodId" value="<%= p.getProdId()%>">

                                <div class="mb-2">
                                    <label class="small fw-bold">Sugar Level:</label>
                                    <select name="sugarLevel" class="form-select form-select-sm">
                                        <option value="Normal Sugar">Normal Sugar</option>
                                        <option value="Less Sugar">Less Sugar</option>
                                        <option value="No Sugar">No Sugar</option>
                                    </select>
                                </div>

                                <div class="mb-2">
                                    <label class="small fw-bold">Milk Type:</label>
                                    <select name="milkType" class="form-select form-select-sm">
                                        <option value="Full Cream">Full Cream</option>
                                        <option value="Oat Milk (+RM2)">Oat Milk</option>
                                        <option value="Soy Milk">Soy Milk</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-sm btn-primary w-100">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-12 text-center">
                    <div class="alert alert-warning">No products available at the moment.</div>
                </div>
                <% }%>
            </div>
        </div>

        <footer class="bg-dark text-white text-center py-3 mt-5">
            <p>&copy; 2026 CoffeeShop</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


