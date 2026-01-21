<%@page import="java.util.List, coffeeshop.model.CartItemBean, coffeeshop.model.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Your Cart - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }

            .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }
            .navbar-brand img { height: 40px; margin-right: 10px; }

            .cart-container { background: white; border-radius: 20px; box-shadow: 0 8px 20px rgba(0,0,0,0.05); }

            .table thead { border-bottom: 2px solid #f4f1ea; }
            .table th { color: #8d6e63; text-transform: uppercase; font-size: 0.8rem; letter-spacing: 1px; }

            .product-name { color: #3e2723; font-weight: 700; margin-bottom: 0; }
            .custom-text { color: #8d6e63; font-style: italic; }

            .checkout-card { 
                background-color: #3e2723; 
                color: white; 
                border-radius: 20px; 
                position: sticky; 
                top: 20px; 
            }

            .btn-confirm { 
                background-color: #fff; 
                color: #3e2723; 
                font-weight: 700; 
                border-radius: 25px; 
                border: none;
                transition: transform 0.2s;
            }
            .btn-confirm:hover { background-color: #d7ccc8; transform: scale(1.02); }

            .btn-remove { color: #dc3545; text-decoration: none; font-size: 0.9rem; }
            .btn-remove:hover { color: #a71d2a; }

            .empty-cart-icon { font-size: 4rem; color: #d7ccc8; }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center fw-bold" href="MenuServlet">
                    <img src="img/coffeeshopN.png" alt="Logo"> CoffeeShop
                </a>
                <div class="ms-auto">
                    <a href="MenuServlet" class="btn btn-outline-light btn-sm rounded-pill px-4">
                        <i class="bi bi-arrow-left"></i> Back to Menu
                    </a>
                </div>
            </div>
        </nav>

        <div class="container py-5">
            <div class="row g-4">
                <div class="col-lg-8">
                    <div class="cart-container p-4">
                        <h4 class="fw-bold mb-4" style="color: #3e2723;">Shopping Cart</h4>

                        <%
                            List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");
                            double total = 0;
                            int itemCount = 0;
                            if (cart != null && !cart.isEmpty()) {
                        %>
                        <div class="table-responsive">
                            <table class="table align-middle">
                                <thead>
                                    <tr>
                                        <th>Product Details</th>
                                        <th class="text-end">Price</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int index = 0;
                                        for (CartItemBean item : cart) {
                                            total += item.getProduct().getProdPrice();
                                            itemCount++;
                                    %>
                                    <tr>
                                        <td>
                                            <p class="product-name"><%= item.getProduct().getProdName()%></p>
                                            <small class="custom-text">
                                                <i class="bi bi-gear-wide"></i> <%= item.getCustomization()%>
                                            </small>
                                        </td>
                                        <td class="text-end fw-bold">RM <%= String.format("%.2f", item.getProduct().getProdPrice())%></td>
                                        <td class="text-center">
                                            <%-- Assuming you use index for removal --%>
                                            <a href="RemoveFromCartServlet?index=<%= index%>" class="btn-remove">
                                                <i class="bi bi-trash3"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                            index++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <% } else { %>
                        <div class="text-center py-5">
                            <i class="bi bi-cart-x empty-cart-icon"></i>
                            <p class="text-muted mt-3">Your cart is currently empty.</p>
                            <a href="MenuServlet" class="btn btn-coffee rounded-pill mt-2" style="background-color: #5d4037; color: white;">Order Now</a>
                        </div>
                        <% }%>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="checkout-card p-4 shadow">
                        <h5 class="fw-bold mb-4">Order Summary</h5>

                        <div class="d-flex justify-content-between mb-2">
                            <span class="opacity-75">Items (<%= itemCount%>)</span>
                            <span>RM <%= String.format("%.2f", total)%></span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                            <span class="opacity-75">Service Tax (0%)</span>
                            <span>RM 0.00</span>
                        </div>

                        <hr class="border-light opacity-25">

                        <div class="d-flex justify-content-between mb-4">
                            <span class="fs-5 fw-bold">Total</span>
                            <span class="fs-5 fw-bold text-white">RM <%= String.format("%.2f", total)%></span>
                        </div>

                        <form action="CheckoutServlet" method="POST">
                            <div class="mb-4">
                                <label class="form-label small fw-bold opacity-75">Order Type</label>
                                <select name="orderType" class="form-select bg-light border-0 rounded-pill" required>
                                    <option value="Dine In">☕ Dine In</option>
                                    <option value="Take Away">🛍️ Take Away</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-confirm w-100 py-3 mb-2" <%= (cart == null || cart.isEmpty()) ? "disabled" : ""%>>
                                Confirm Order
                            </button>
                            <p class="text-center x-small opacity-50 mb-0" style="font-size: 0.7rem;">
                                By clicking confirm, your order will be sent to the kitchen.
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <%@include file="footer.jsp" %>
</html>