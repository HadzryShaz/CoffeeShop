<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="coffeeshop.model.ProductBean"%>
<%@page import="coffeeshop.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Menu Item - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        /* Consistent Theme: Espresso & Mocha */
        body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }
        
        .navbar { background-color: #3e2723 !important; border-bottom: 4px solid #d7ccc8; }
        .navbar-brand img { height: 40px; margin-right: 10px; }

        .card { 
            border: none; 
            border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); 
            overflow: hidden;
        }
        
        .card-header { 
            background-color: #3e2723 !important; 
            color: white !important; 
            border: none; 
            padding: 20px;
        }

        .form-label { color: #3e2723; font-weight: 600; }
        
        .btn-update { 
            background-color: #3e2723; 
            color: white; 
            border-radius: 25px; 
            padding: 12px;
            font-weight: 600;
            border: none;
        }
        .btn-update:hover { background-color: #5d4037; color: white; }
        
        .btn-cancel { border-radius: 25px; padding: 12px; }
        
        .current-img-preview {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border: 3px solid #d7ccc8;
            border-radius: 15px;
        }
        
        .form-control:focus {
            border-color: #8d6e63;
            box-shadow: 0 0 0 0.25rem rgba(141, 110, 99, 0.25);
        }
    </style>
</head>
<body>
    <%
        // Security Check (Optional but recommended)
        UserBean user = (UserBean) session.getAttribute("user");
        ProductBean product = (ProductBean) request.getAttribute("product");
        if (product == null) {
            response.sendRedirect("DashboardServlet");
            return;
        }
    %>

    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center fw-bold" href="DashboardServlet">
                <img src="img/coffeeshopN.png" alt="Logo"> Admin Panel
            </a>
        </div>
    </nav>

    <div class="container py-5">
        <div class="card mx-auto" style="max-width: 650px;">
            <div class="card-header text-center">
                <h4 class="mb-0"><i class="bi bi-pencil-square me-2"></i>Edit Menu Item</h4>
                <p class="small opacity-75 mb-0 mt-1">Update details for: <%= product.getProdName() %></p>
            </div>
            <div class="card-body p-4 p-md-5">
                <form action="EditProductServlet" method="POST" enctype="multipart/form-data">
                    
                    <input type="hidden" name="prodId" value="<%= product.getProdId() %>">
                    <input type="hidden" name="existingImage" value="<%= product.getProdImagePath() %>">

                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Product Name</label>
                            <input type="text" name="prodName" class="form-control rounded-pill px-4" 
                                   value="<%= product.getProdName() %>" required>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="prodDescription" class="form-control rounded-4 px-4 py-3" 
                                      rows="3"><%= product.getProdDescription() %></textarea>
                        </div>

                        <div class="col-md-12 mb-4">
                            <label class="form-label">Price (RM)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0 rounded-start-pill ps-4">RM</span>
                                <input type="number" step="0.01" name="prodPrice" 
                                       class="form-control border-start-0 rounded-end-pill px-3" 
                                       value="<%= product.getProdPrice() %>" required>
                            </div>
                        </div>

                        <div class="col-md-12 mb-4">
                            <label class="form-label d-block">Current Product Image</label>
                            <div class="d-flex align-items-center gap-4 p-3 bg-light rounded-4">
                                <img src="<%= product.getProdImagePath() %>" alt="Current Image" class="current-img-preview">
                                <div>
                                    <label class="form-label small mb-1">Replace Image?</label>
                                    <input type="file" name="prodImage" class="form-control form-control-sm" accept="image/*">
                                    <small class="text-muted d-block mt-1">Leave empty to keep existing image.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-6">
                            <button type="submit" class="btn btn-update w-100 shadow-sm">
                                <i class="bi bi-check-circle me-1"></i> Save Changes
                            </button>
                        </div>
                        <div class="col-6">
                            <a href="DashboardServlet" class="btn btn-outline-secondary btn-cancel w-100">
                                Cancel
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>