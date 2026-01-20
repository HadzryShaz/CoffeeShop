
<%@page import="coffeeshop.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="coffeeshop.model.OrderBean, coffeeshop.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Order Progress - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <%
            UserBean user = (UserBean) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            OrderDao dao = new OrderDao();
            OrderBean order = dao.getLatestUserOrder(user.getUserId());
        %>

        <div class="container mt-5">
            <div class="card shadow-sm border-0">
                <div class="card-body text-center">
                    <h2 class="mb-4">Order Status</h2>

                    <% if (order != null) {%>
                    <div class="alert alert-info">
                        <strong>Order #<%= order.getOrderId()%></strong> - <%= order.getOrderType()%>
                    </div>

                    <div class="progress mb-4" style="height: 30px;">
                        <%
                            String status = order.getOrderStatus();
                            int progress = 0;
                            String color = "bg-warning";

                            if ("Pending".equals(status)) {
                                progress = 25;
                            } else if ("In the making".equals(status)) {
                                progress = 50;
                            } else if ("Done".equals(status)) {
                                progress = 75;
                                color = "bg-info";
                            } else if ("Ready to pickup".equals(status)) {
                                progress = 100;
                                color = "bg-success";
                            }
                        %>
                        <div class="progress-bar progress-bar-striped progress-bar-animated <%= color%>" 
                             role="progressbar" style="width: <%= progress%>%">
                            <%= status%>
                        </div>
                    </div>

                    <div class="mt-3">
                        <p>Total: <strong>RM <%= String.format("%.2f", order.getTotalPrice())%></strong></p>
                        <a href="order_progress.jsp" class="btn btn-outline-primary btn-sm">Refresh Status</a>
                    </div>

                    <% } else { %>
                    <p class="text-muted">You have no active orders. <a href="MenuServlet">Order some coffee!</a></p>
                    <% }%>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Automatically refresh the page every 30 seconds
            setTimeout(function () {
                location.reload();
            }, 30000);
        </script>
    </body>
</html>


