
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Find Our Store - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .map-container {
            height: 400px;
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.html">CoffeeShop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-3">
                <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="menu_list.html">Menu</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.html">Cart</a></li>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center" href="find_us.html">
                        <img src="img/location.png" alt="location" style="width:18px; height:18px; margin-right:6px;">
                        Find our store
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5">
    <h2 class="text-center mb-4">Visit Our Store</h2>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="map-container mb-4">
                <!-- Replace src with your Google Maps embed URL -->
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.123456!2d-122.419415!3d37.774929!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80858064c8b2b123%3A0xabcdef1234567890!2sCoffeeShop!5e0!3m2!1sen!2sus!4v1234567890"
                    width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
                </iframe>
            </div>

            <div class="text-center">
                <h5>Our Address</h5>
                <p>Subang Coffee Street, Sungai Buloh, Malaysia</p>

                <h5>Contact Us</h5>
                <p>Email: coffeeshop@gmail.com | Phone: +60 19-456 7890</p>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3">
    &copy; 2025 CoffeeShop
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
