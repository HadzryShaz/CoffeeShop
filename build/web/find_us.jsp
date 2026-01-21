<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="coffeeshop.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Find Us - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }
        
        /* Navbar Branding */
        .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }
        .navbar-brand img { height: 40px; margin-right: 10px; }

        .page-title { color: #3e2723; font-weight: 700; margin-bottom: 30px; }

        /* Card & Map Styling */
        .info-card { 
            background: white; 
            border-radius: 20px; 
            border: none; 
            box-shadow: 0 8px 20px rgba(0,0,0,0.05); 
            height: 100%;
        }
        
        .map-container {
            height: 450px;
            width: 100%;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border: 5px solid white;
        }

        .contact-icon {
            width: 45px;
            height: 45px;
            background-color: #f4f1ea;
            color: #3e2723;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 1.2rem;
            margin-right: 15px;
        }

        .hours-badge {
            background-color: #3e2723;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center fw-bold" href="index.jsp">
                <img src="img/coffeeshopN.png" alt="Logo"> CoffeeShop
            </a>
            <div class="ms-auto">
                <% 
                    UserBean currentUser = (UserBean) session.getAttribute("user");
                    if (currentUser != null) { 
                %>
                    <% if ("Admin".equals(currentUser.getRole())) { %>
                        <a href="DashboardServlet" class="btn btn-warning btn-sm rounded-pill px-4 me-2">Admin Panel</a>
                    <% } %>
                    <a href="cart.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4 me-2"><i class="bi bi-cart"></i> Cart</a>
                    <a href="order_progress.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4 me-2">Track Order</a>
                    <a href="LogoutServlet" class="btn btn-link text-white text-decoration-none btn-sm">Logout</a>
                <% } else { %>
                    <a href="login.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4">Login</a>
                <% } %>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="text-center mb-5">
            <h2 class="page-title">Visit Our Roastery</h2>
            <p class="text-muted">The smell of fresh coffee is waiting for you.</p>
        </div>

        <div class="row g-4 align-items-stretch">
            <div class="col-lg-4">
                <div class="info-card p-4">
                    <h5 class="fw-bold mb-4" style="color: #3e2723;">Contact Details</h5>
                    
                    <div class="d-flex align-items-start mb-4">
                        <div class="contact-icon"><i class="bi bi-geo-alt"></i></div>
                        <div>
                            <p class="mb-0 fw-bold">Location</p>
                            <small class="text-muted">Subang Coffee Street, Sungai Buloh, Malaysia</small>
                        </div>
                    </div>

                    <div class="d-flex align-items-start mb-4">
                        <div class="contact-icon"><i class="bi bi-envelope"></i></div>
                        <div>
                            <p class="mb-0 fw-bold">Email Us</p>
                            <small class="text-muted">hello@coffeeshop.com</small>
                        </div>
                    </div>

                    <div class="d-flex align-items-start mb-4">
                        <div class="contact-icon"><i class="bi bi-telephone"></i></div>
                        <div>
                            <p class="mb-0 fw-bold">Call Us</p>
                            <small class="text-muted">+60 19-456 7890</small>
                        </div>
                    </div>

                    <hr class="my-4 opacity-50">

                    <h5 class="fw-bold mb-3" style="color: #3e2723;">Opening Hours</h5>
                    <ul class="list-unstyled">
                        <li class="d-flex justify-content-between mb-2">
                            <span>Mon - Fri</span>
                            <span class="hours-badge">8:00 AM - 10:00 PM</span>
                        </li>
                        <li class="d-flex justify-content-between">
                            <span>Sat - Sun</span>
                            <span class="hours-badge">9:00 AM - 11:00 PM</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="map-container">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127482.41727763784!2d101.52047321558488!3d3.1319197288636746!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc48d0875143b1%3A0x400cb572af484d0!2sSungai%20Buloh%2C%20Selangor!5e0!3m2!1sen!2smy!4v1710000000000!5m2!1sen!2smy" 
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
                    </iframe>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>