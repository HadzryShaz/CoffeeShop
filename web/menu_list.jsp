
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-3"> 
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link active" href="MenuServlet">Menu</a></li>
                        <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
                    </ul>
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
                        <img src="<%= p.getProdImagePath() %>" class="card-img-top" alt="<%= p.getProdName() %>">
                        <div class="card-body text-center">
                            <h5 class="card-title"><%= p.getProdName() %></h5>
                            <p class="card-text text-muted small"><%= p.getProdDescription() %></p>
                            <h6 class="text-primary mb-3">RM <%= String.format("%.2f", p.getProdPrice()) %></h6>
                            <form action="AddToCartServlet" method="POST">
                                <input type="hidden" name="productId" value="<%= p.getProdId() %>">
                                <button type="submit" class="btn btn-outline-primary">Add to Cart</button>
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
                <% } %>
            </div>
        </div>

        <footer class="bg-dark text-white text-center py-3 mt-5">
            <p>&copy; 2026 CoffeeShop</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


