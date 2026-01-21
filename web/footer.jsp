<style>
    .main-footer {
        background-color: #3e2723;
        color: #f4f1ea;
        padding: 60px 0 30px;
        margin-top: 50px;
        border-top: 5px solid #d7ccc8;
    }
    .footer-brand {
        font-size: 1.5rem;
        font-weight: 700;
        color: #fff;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
    }
    .footer-brand img {
        height: 40px;
        margin-right: 12px;
    }
    .footer-links h6 {
        color: #d7ccc8;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        margin-bottom: 20px;
    }
    .footer-links ul {
        list-style: none;
        padding: 0;
    }
    .footer-links ul li {
        margin-bottom: 10px;
    }
    .footer-links ul li a {
        color: #f4f1ea;
        text-decoration: none;
        opacity: 0.8;
        transition: 0.3s;
    }
    .footer-links ul li a:hover {
        opacity: 1;
        color: #d7ccc8;
        padding-left: 5px;
    }
    .social-icons a {
        color: #3e2723;
        background: #f4f1ea;
        width: 35px;
        height: 35px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        margin-right: 10px;
        transition: 0.3s;
    }
    .social-icons a:hover {
        background: #d7ccc8;
        transform: translateY(-3px);
    }
    .copyright {
        border-top: 1px solid rgba(215, 204, 200, 0.1);
        padding-top: 25px;
        margin-top: 40px;
        font-size: 0.9rem;
        opacity: 0.7;
    }
</style>

<footer class="main-footer">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="footer-brand">
                    <img src="img/coffeeshopN.png" alt="CoffeeShop Logo">
                    CoffeeShop
                </div>
                <p class="opacity-75 pe-lg-5">
                    Crafting the perfect cup since 2024. We source the finest beans to bring you an unforgettable coffee experience.
                </p>
                <div class="social-icons mt-4">
                    <a href="#"><i class="bi bi-facebook"></i></a>
                    <a href="#"><i class="bi bi-instagram"></i></a>
                    <a href="#"><i class="bi bi-twitter-x"></i></a>
                </div>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
                <h6>Navigation</h6>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#">Menu</a></li>
                    <li><a href="find_us.jsp">Find Us</a></li>
                    <li><a href="#">Track Order</a></li>
                </ul>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
                <h6>Support</h6>
                <ul>
                    <li><a href="cart.jsp">Your Cart</a></li>
                    <li><a href="login.jsp">My Account</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>

            <div class="col-lg-4 col-md-6 footer-links">
                <h6>Contact Us</h6>
                <ul class="opacity-75">
                    <li><i class="bi bi-geo-alt me-2"></i> 123 Coffee Lane, Brew City, Malaysia</li>
                    <li><i class="bi bi-telephone me-2"></i> +60 12-345 6789</li>
                    <li><i class="bi bi-envelope me-2"></i> hello@coffeeshop.com</li>
                    <li><i class="bi bi-clock me-2"></i> Mon - Sun: 8:00 AM - 10:00 PM</li>
                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col-12 text-center copyright">
                <p>&copy; 2024 CoffeeShop Management System. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>