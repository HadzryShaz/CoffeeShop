<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="coffeeshop.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CoffeeShop | Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            /* Design alignment with Order Progress and Menu */
            body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }
            
            .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }
            .navbar-brand img { height: 40px; margin-right: 10px; }
            
            /* Hero Section Styling */
            .hero-section {
                background: linear-gradient(rgba(62, 39, 35, 0.7), rgba(62, 39, 35, 0.7)), 
                            url('https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=1974&auto=format&fit=crop');
                background-size: cover;
                background-position: center;
                color: white;
                padding: 100px 0;
                margin-bottom: 50px;
                border-bottom: 5px solid #5d4037;
            }

            .card {
                border: none;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }
            .card:hover { transform: translateY(-10px); }
            
            .card-img-standard {
                height: 250px;
                width: 100%;
                object-fit: cover;
                background-color: #f8f9fa;
            }
            
            .btn-coffee { 
                background-color: #5d4037; 
                color: white; 
                border-radius: 25px; 
                border: none; 
                padding: 10px 30px;
                font-weight: 600;
            }
            .btn-coffee:hover { background-color: #3e2723; color: white; }
            
            .section-title { color: #3e2723; font-weight: 700; position: relative; padding-bottom: 10px; }
            .section-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 60px;
                height: 3px;
                background-color: #8d6e63;
            }
        </style>
    </head>

    <body>

        <%-- Navigation Bar matching Order Progress --%>
        <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center fw-bold" href="index.jsp">
                    <img src="img/coffeeshopN.png" alt="Logo"> CoffeeShop
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <div class="navbar-nav ms-auto align-items-center">
                        <a class="nav-link" href="login.jsp">Menu</a>
                        <% if (session.getAttribute("user") != null) { %>
                            <a class="nav-link" href="cart.jsp"><i class="bi bi-cart3"></i> Cart</a>
                            <a class="btn btn-outline-light btn-sm rounded-pill ms-lg-3 px-4" href="order_progress.jsp">
                                <i class="bi bi-clock-history"></i> Track Order
                            </a>
                            <a class="nav-link ms-lg-2" href="LogoutServlet">Logout</a>
                        <% } else { %>
                            <a class="nav-link" href="login.jsp">Login</a>
                            <a class="btn btn-light btn-sm rounded-pill ms-lg-2 px-4" href="register.jsp">Register</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </nav>

        <%-- Hero Section --%>
        <div class="hero-section text-center shadow-sm">
            <div class="container">
                <h1 class="display-3 fw-bold mb-3">Wake Up to Freshly Brewed Joy</h1>
                <p class="lead mb-4">Experience the finest beans, roasted with passion and served with love.</p>
                <a href="login.jsp" class="btn btn-light btn-lg rounded-pill px-5 fw-bold text-dark">Explore Menu</a>
            </div>
        </div>

        <%-- Featured Items Section --%>
        <div class="container mt-5">
            <h2 class="text-center section-title mb-5">Today's Recommended Items</h2>

            <div class="row g-4 justify-content-center mb-5">
                <%-- Latte Card --%>
                <div class="col-md-4">
                    <div class="card h-100">
                        <img src="img/stock_latte.jpg" class="card-img-standard" alt="Latte">
                        <div class="card-body text-center p-4">
                            <h5 class="fw-bold mb-2">Signature Latte</h5>
                            <p class="text-muted small mb-4">Rich, smooth, and topped with our signature cream.</p>
                            <a href="login.jsp" class="btn btn-coffee w-100">Order Now</a>
                        </div>
                    </div>
                </div>

                <%-- Croissant Card --%>
                <div class="col-md-4">
                    <div class="card h-100">
                        <img src="img/stock_croissant.jpg" class="card-img-standard" alt="Croissant">
                        <div class="card-body text-center p-4">
                            <h5 class="fw-bold mb-2">Buttery Croissant</h5>
                            <p class="text-muted small mb-4">Golden, flaky layers baked fresh every morning.</p>
                            <a href="login.jsp" class="btn btn-coffee w-100">Order Now</a>
                        </div>
                    </div>
                </div>

                <%-- Americano Card --%>
                <div class="col-md-4">
                    <div class="card h-100">
                        <img src="img/stock_americano.jpg" class="card-img-standard" alt="Americano">
                        <div class="card-body text-center p-4">
                            <h5 class="fw-bold mb-2">Classic Americano</h5>
                            <p class="text-muted small mb-4">The bold, traditional brew for a perfect morning start.</p>
                            <a href="login.jsp" class="btn btn-coffee w-100">Order Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Footer --%>
<%@include file="footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>