<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        /* Coffee-themed gradient background */
        body { 
            background: linear-gradient(135deg, #3e2723 0%, #6d4c41 100%);
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .login-card { 
            border: none; 
            border-radius: 25px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.3); 
            overflow: hidden;
            background: #f4f1ea;
        }

        .login-header {
            text-align: center;
            padding: 30px 20px 10px;
        }

        .login-header img {
            height: 60px;
            margin-bottom: 15px;
        }

        .login-header h3 {
            color: #3e2723;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #d7ccc8;
        }

        .form-control:focus {
            border-color: #3e2723;
            box-shadow: 0 0 0 0.25rem rgba(62, 39, 35, 0.1);
        }

        .btn-login {
            background-color: #3e2723;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-login:hover {
            background-color: #2b1b19;
            color: #d7ccc8;
            transform: translateY(-2px);
        }

        .msg-container {
            min-height: 25px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card login-card px-3">
                    <div class="login-header">
                        <img src="img/coffeeshopN.png" alt="Logo">
                        <h3>Welcome Back!</h3>
                        <p class="text-muted small">Your daily brew is just a login away.</p>
                    </div>

                    <div class="card-body">
                        <%-- Message Area --%>
                        <div class="msg-container mb-2">
                            <% if (request.getAttribute("err") != null) { %>
                                <div class="alert alert-danger py-2 text-center small border-0" role="alert">
                                    <i class="bi bi-exclamation-triangle-fill me-2"></i> <%= request.getAttribute("err") %>
                                </div>
                            <% } %>
                            
                            <% if ("registered".equals(request.getParameter("msg"))) { %>
                                <div class="alert alert-success py-2 text-center small border-0" role="alert">
                                    <i class="bi bi-check-circle-fill me-2"></i> Account created! Please login.
                                </div>
                            <% } %>
                        </div>

                        <form action="LoginServlet" method="POST">
                            <div class="mb-3">
                                <label class="form-label small fw-bold" style="color: #5d4037;">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0" style="border-radius: 10px 0 0 10px;">
                                        <i class="bi bi-person text-muted"></i>
                                    </span>
                                    <input type="text" name="username" class="form-control border-start-0" 
                                           style="border-radius: 0 10px 10px 0;" placeholder="Enter username" required>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label small fw-bold" style="color: #5d4037;">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0" style="border-radius: 10px 0 0 10px;">
                                        <i class="bi bi-lock text-muted"></i>
                                    </span>
                                    <input type="password" name="password" class="form-control border-start-0" 
                                           style="border-radius: 0 10px 10px 0;" placeholder="••••••••" required>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-login w-100 shadow-sm">
                                Login to Account
                            </button>
                        </form>

                        <div class="mt-4 text-center pb-3">
                            <span class="small text-muted">Don't have an account?</span> 
                            <a href="register.jsp" class="small fw-bold text-decoration-none" style="color: #3e2723;">
                                Join the Club
                            </a>
                        </div>
                    </div>
                </div>
                
                <%-- Quick Link Back to Home --%>
                <div class="text-center mt-4">
                    <a href="index.jsp" class="text-white-50 text-decoration-none small">
                        <i class="bi bi-arrow-left me-1"></i> Back to Homepage
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>