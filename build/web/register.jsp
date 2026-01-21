<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Join the Club - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        /* Consistent with Login Page */
        body { 
            background: linear-gradient(135deg, #3e2723 0%, #6d4c41 100%);
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .register-card { 
            border: none; 
            border-radius: 25px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.3); 
            background: #f4f1ea;
            overflow: hidden;
        }

        .register-header {
            text-align: center;
            padding: 30px 20px 10px;
        }

        .register-header img {
            height: 50px;
            margin-bottom: 10px;
        }

        .register-header h3 {
            color: #3e2723;
            font-weight: 700;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 15px;
            border: 1px solid #d7ccc8;
        }

        .form-control:focus {
            border-color: #3e2723;
            box-shadow: 0 0 0 0.25rem rgba(62, 39, 35, 0.1);
        }

        .btn-register {
            background-color: #3e2723;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-register:hover {
            background-color: #2b1b19;
            color: #d7ccc8;
            transform: translateY(-2px);
        }

        .input-group-text {
            background-color: white;
            border-right: none;
            color: #8d6e63;
            border-radius: 10px 0 0 10px;
        }
        
        .border-start-0 {
            border-radius: 0 10px 10px 0 !important;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5 col-xl-4">
                <div class="card register-card px-3">
                    <div class="register-header">
                        <img src="img/coffeeshopN.png" alt="Logo">
                        <h3>Create Account</h3>
                        <p class="text-muted small">Join us for the finest coffee experience.</p>
                    </div>

                    <div class="card-body">
                        <form action="RegisterServlet" method="POST">
                            <div class="mb-3">
                                <label class="form-label small fw-bold" style="color: #5d4037;">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                                    <input type="text" name="username" class="form-control border-start-0" placeholder="Pick a username" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold" style="color: #5d4037;">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                    <input type="email" name="email" class="form-control border-start-0" placeholder="email@example.com" required>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label small fw-bold" style="color: #5d4037;">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                    <input type="password" name="password" class="form-control border-start-0" placeholder="••••••••" required>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-register w-100 shadow-sm">
                                Create Account
                            </button>
                        </form>

                        <div class="mt-4 text-center pb-3">
                            <span class="small text-muted">Already a member?</span> 
                            <a href="login.jsp" class="small fw-bold text-decoration-none" style="color: #3e2723;">
                                Login here
                            </a>
                        </div>
                    </div>
                </div>

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