
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Forgot Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

        <div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
            <div class="card p-4 shadow-sm" style="width: 360px;">
                <h3 class="text-center mb-3">Forgot Password</h3>

                <p class="text-center text-secondary small mb-4">
                    Enter your email and we will send a reset link.
                </p>

                <form action="index.html" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mb-3">Send Reset Link</button>

                    <div class="text-center">
                        <a href="login.html" class="text-secondary small">Back to Login</a>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
