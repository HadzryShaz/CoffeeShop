        <%@page import="java.util.List, coffeeshop.model.CartItemBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Cart - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <h2>Your Coffee Cart</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Customization</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");
                        double total = 0;
                        if (cart != null) {
                            for (CartItemBean item : cart) {
                                total += item.getProduct().getProdPrice();
                    %>
                    <tr>
                        <td><%= item.getProduct().getProdName()%></td>
                        <td><small><%= item.getCustomization()%></small></td>
                        <td>RM <%= String.format("%.2f", item.getProduct().getProdPrice())%></td>
                        <td><a href="RemoveFromCart?id=..." class="btn btn-sm btn-danger">Remove</a></td>
                    </tr>
                    <%      }
                }%>
                </tbody>
            </table>
            <h3>Total: RM <%= String.format("%.2f", total)%></h3>

            <form action="CheckoutServlet" method="POST">
                <select name="orderType" class="form-select mb-3" required>
                    <option value="Dine In">Dine In</option>
                    <option value="Take Away">Take Away</option>
                </select>
                <button type="submit" class="btn btn-success">Confirm Order</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
