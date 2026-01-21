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
                object-fit: cover;
                background-color: #f8f9fa;
            }
            .navbar-nav .nav-item { padding: 0 15px; }
            .card { transition: transform 0.2s; border: none; }
            .card:hover { transform: translateY(-5px); }
            /* Coffee themed primary color */
            .btn-primary { background-color: #6f4e37; border-color: #6f4e37; }
            .btn-primary:hover { background-color: #5a3e2b; border-color: #5a3e2b; }
            .text-primary { color: #6f4e37 !important; }
        </style>
    </head>
    <body class="bg-light">

        <%-- Navigation Bar --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">CoffeeShop</a>
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="MenuServlet">Menu</a>
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

        <%-- Header Section --%>
        <div class="container-fluid bg-white text-center p-5 shadow-sm">
            <h1 class="display-5 fw-bold">Our Full Menu</h1>
            <p class="lead">Explore our variety of freshly brewed coffee and treats</p>
        </div>

        <%-- Menu Grid --%>
        <div class="container mt-5">
            <div class="row g-4 justify-content-center">
                <%
                    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                        for (ProductBean p : products) {
                %>
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="<%= p.getProdImagePath()%>" class="card-img-standard" alt="<%= p.getProdName()%>">
                        <div class="card-body text-center">
                            <h5 class="card-title fw-bold"><%= p.getProdName()%></h5>
                            <p class="card-text text-muted small" style="height: 40px; overflow: hidden;">
                                <%= p.getProdDescription()%>
                            </p>
                            <h6 class="text-primary mb-3 fw-bold">RM <%= String.format("%.2f", p.getProdPrice())%></h6>

                            <%-- Trigger Button for Popup --%>
                            <button type="button" class="btn btn-primary w-100" 
                                    onclick="openCustomizationModal('<%= p.getProdId()%>', '<%= p.getProdName()%>')">
                                Add to Cart
                            </button>
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

        <%-- Customization Popup (Modal) --%>
        <div class="modal fade" id="customModal" tabindex="-1" aria-labelledby="modalProdName" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="AddToCartServlet" method="POST">
                        <div class="modal-header bg-dark text-white">
                            <h5 class="modal-title" id="modalProdName">Customize Your Coffee</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-4">
                            <%-- Hidden Input to carry the Product ID to the Servlet --%>
                            <input type="hidden" name="prodId" id="modalProdId">

                            <div class="mb-3">
                                <label class="form-label fw-bold">Sugar Level</label>
                                <select name="sugarLevel" class="form-select">
                                    <option value="Normal Sugar">Normal Sugar</option>
                                    <option value="Less Sugar">Less Sugar</option>
                                    <option value="No Sugar">No Sugar</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Milk Type</label>
                                <select name="milkType" class="form-select">
                                    <option value="Full Cream">Full Cream</option>
                                    <option value="Oat Milk (+RM2)">Oat Milk</option>
                                    <option value="Soy Milk">Soy Milk</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Special Notes (Optional)</label>
                                <textarea name="specialNotes" class="form-control" placeholder="E.g. Extra hot, no ice..."></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <footer class="bg-dark text-white text-center py-3 mt-5">
            <p>&copy; 2026 CoffeeShop</p>
        </footer>

        <%-- Scripts --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                        function openCustomizationModal(id, name) {
                                            // Update Modal Content
                                            document.getElementById('modalProdName').innerText = name;
                                            document.getElementById('modalProdId').value = id;

                                            // Trigger the Bootstrap Modal
                                            var myModal = new bootstrap.Modal(document.getElementById('customModal'));
                                            myModal.show();
                                        }
        </script>
    </body>
</html>