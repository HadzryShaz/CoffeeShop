

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex align-items-center" style="height: 100vh;">
        <div class="card mx-auto shadow" style="width: 350px;">
            <div class="card-body">
                <h3 class="text-center">CoffeeShop Login</h3>

                <%-- Display error or registration success messages --%>
                <% if (request.getAttribute("err") != null) {%>
                <p class="text-danger text-center small"><%= request.getAttribute("err")%></p>
                <% } %>
                <% if ("registered".equals(request.getParameter("msg"))) { %>
                <p class="text-success text-center small">Registration successful! Please login.</p>
                <% }%>

                <form action="LoginServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-dark w-100">Login</button>
                </form>

                <div class="mt-3 text-center">
                    <small class="text-muted">Don't have an account?</small> 
                    <a href="register.jsp" class="small text-decoration-none">Register here</a>
                </div>

            </div>
        </div>
    </body>
</html>
