
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CoffeeShop</title>

        <style>
            .card-img-standard {
                height: 200px; /* Set a fixed height for the *container* */
                width: 100%; /* Ensures the container takes the full width */
                object-fit: contain; /* **The key change**: Resizes while preserving aspect ratio */

                /* Optional: Add a background color to the container 
                   to fill the empty space left by 'contain' */
                background-color: #f8f9fa; /* Light gray background to match bg-light body */
            }
            .navbar-nav .nav-item {
                padding: 0 15px;
            }
        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MenuServlet">Menu</a> 
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">Cart</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center" href="find_us.html">
                                Find our store&nbsp;&nbsp;
                                <img src="img/location.png" alt="location" 
                                     style="width:18px; height:18px; margin-right:6px;">
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="container-fluid bg-white text-center p-5 shadow-sm">
            <h1 class="display-5 fw-bold">Welcome to CoffeeShop</h1>
            <p class="lead">Freshly brewed coffee and warm pastries daily</p>
            <a href="menu_list.html" class="btn btn-primary btn-lg">Order Now</a>
        </div>

        <div class="container mt-5">
            <h2 class="text-center mb-4">Today's Recommended Items</h2>

            <div class="row g-4 justify-content-center">

                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="img/stock_latte.jpg" class="card-img-standard" alt="Latte">
                        <div class="card-body text-center">
                            <h5 class="card-title">Latte</h5>
                            <p class="card-text">Rich, smooth, and creamy</p>
                            <a href="menu_list.html" class="btn btn-outline-primary">Order</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="img/stock_croissant.jpg" class="card-img-standard" alt="Croissant">
                        <div class="card-body text-center">
                            <h5 class="card-title">Croissant</h5>
                            <p class="card-text">Fresh and buttery</p>
                            <a href="menu_list.html" class="btn btn-outline-primary">Order</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="img/stock_americano.jpg" class="card-img-standard" alt="Americano">
                        <div class="card-body text-center">
                            <h5 class="card-title">Americano</h5>
                            <p class="card-text">Bold traditional brew</p>
                            <a href="menu_list.html" class="btn btn-outline-primary">Order</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <footer class="bg-dark text-white text-center py-3 mt-5">
            <p>&copy; 2025 CoffeeShop</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
