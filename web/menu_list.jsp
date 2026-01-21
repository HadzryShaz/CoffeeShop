<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, coffeeshop.model.ProductBean, coffeeshop.model.UserBean"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Menu - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }
            .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }
            .navbar-brand img { height: 40px; margin-right: 10px; }
            .menu-title { color: #3e2723; font-weight: 700; margin-bottom: 30px; }

            .product-card {
                border: none;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
                background: #fff;
                transition: transform 0.2s;
            }
            .product-card:hover { transform: translateY(-5px); }
            .card-img-top { height: 200px; object-fit: cover; }

            .btn-coffee { background-color: #5d4037; color: white; border-radius: 25px; border: none; padding: 10px 20px; }
            .btn-coffee:hover { background-color: #3e2723; color: white; }
            .price-text { color: #5d4037; font-weight: bold; font-size: 1.1rem; }

            .modal-header { background-color: #3e2723; color: white; }
            .modal-content { border-radius: 20px; overflow: hidden; border: none; }

            /* Toast Position */
            .toast-container { z-index: 1060; }
        </style>
    </head>
    <body>

        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="successToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <i class="bi bi-check-circle-fill me-2"></i> Item added to cart successfully!
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>

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
                    <a href="DashboardServlet" class="btn btn-warning btn-sm rounded-pill px-4 me-2 shadow-sm">
                        <i class="bi bi-speedometer2"></i> Admin Panel
                    </a>
                    <% } %>



                    <a href="cart.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4 me-2">
                        <i class="bi bi-cart"></i> Cart
                    </a>

                    <a href="order_progress.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4 me-2">Track Order</a>

                    <a href="LogoutServlet" class="btn btn-link text-white text-decoration-none btn-sm">Logout</a>


                    <% } else { %>

                    <a href="login.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4">Login</a>

                    <% } %>
                </div>

            </div>
                                <a href="find_us.jsp" class="btn btn-outline-light btn-sm rounded-pill px-4 me-2">
                    <i class="bi bi-geo-alt"></i> Find Us
                </a>
        </nav>

        <div class="container py-5">
            <%-- Optional Alert Version (Alternative to Toast) --%>
            <% if ("true".equals(request.getParameter("success"))) { %>
            <div class="alert alert-success alert-dismissible fade show rounded-pill px-4 shadow-sm border-0 mb-4" role="alert">
                <i class="bi bi-cart-check-fill me-2"></i> <strong>Success!</strong> Your coffee is waiting in the cart.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>

            <div class="text-center mb-5">
                <h2 class="menu-title">Our Coffee Selection</h2>
                <p class="text-muted">Freshly roasted beans delivered to your cup.</p>
            </div>

            <div class="row g-4">
                <%
                    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                        for (ProductBean p : products) {
                %>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <img src="<%= p.getProdImagePath()%>" class="card-img-top" alt="<%= p.getProdName()%>">
                        <div class="card-body p-4 text-center">
                            <h5 class="fw-bold"><%= p.getProdName()%></h5>
                            <p class="text-muted small mb-3"><%= p.getProdDescription()%></p>
                            <div class="d-flex justify-content-between align-items-center mt-auto">
                                <span class="price-text">RM <%= String.format("%.2f", p.getProdPrice())%></span>
                                <button class="btn btn-coffee btn-sm" onclick="openCustomizationModal('<%= p.getProdId()%>', '<%= p.getProdName()%>')">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>

        <div class="modal fade" id="customModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="AddToCartServlet" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalProdName">Customize Your Drink</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body p-4">
                            <input type="hidden" name="prodId" id="modalProdId">

                            <div class="mb-3">
                                <label class="form-label fw-bold">Sugar Level</label>
                                <select name="sugarLevel" class="form-select rounded-pill">
                                    <option>Normal Sugar</option>
                                    <option>Less Sugar</option>
                                    <option>No Sugar</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Milk Type</label>
                                <select name="milkType" class="form-select rounded-pill">
                                    <option>Full Cream</option>
                                    <option>Oat Milk (+RM2.00)</option>
                                    <option>Soy Milk</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Special Notes</label>
                                <textarea name="specialNotes" class="form-control" rows="2" placeholder="E.g. Extra hot..."></textarea>
                            </div>
                        </div>
                        <div class="modal-footer border-0">
                            <button type="submit" class="btn btn-coffee w-100">Add to Cart</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                    function openCustomizationModal(id, name) {
                                        document.getElementById('modalProdName').innerText = name;
                                        document.getElementById('modalProdId').value = id;
                                        var myModal = new bootstrap.Modal(document.getElementById('customModal'));
                                        myModal.show();
                                    }

                                    // Show Toast if success parameter is present in URL
                                    window.onload = function () {
                                        const urlParams = new URLSearchParams(window.location.search);
                                        if (urlParams.get('success') === 'true') {
                                            var toastEl = document.getElementById('successToast');
                                            var toast = new bootstrap.Toast(toastEl);
                                            toast.show();
                                        }
                                    }
        </script>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
        </footer>
    
</html>