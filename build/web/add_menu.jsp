<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="coffeeshop.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Coffee Item - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            body { background-color: #f4f1ea; font-family: 'Poppins', sans-serif; }

            /* Navbar Branding */
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

            .btn-save { 
                background-color: #3e2723; 
                color: white; 
                border-radius: 25px; 
                padding: 12px;
                font-weight: 600;
                border: none;
            }
            .btn-save:hover { background-color: #5d4037; color: white; }

            .btn-cancel { border-radius: 25px; padding: 12px; }

            /* Image Preview Box */
            #preview-container {
                width: 100%;
                height: 200px;
                border: 2px dashed #d7ccc8;
                border-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: hidden;
                background-color: #fff;
                margin-bottom: 15px;
            }
            #image-preview {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: none;
            }
            .preview-placeholder { color: #8d6e63; text-align: center; }
        </style>
    </head>
    <body>

        <%
            // Security Check
            UserBean user = (UserBean) session.getAttribute("user");
            if (user == null || !"Admin".equals(user.getRole())) {
                response.sendRedirect("login.jsp");
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
            <div class="card mx-auto" style="max-width: 550px;">
                <div class="card-header text-center">
                    <h4 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Add New Coffee Item</h4>
                    <p class="small opacity-75 mb-0 mt-1">Expand your menu with a new blend</p>
                </div>

                <div class="card-body p-4 p-md-5">
                    <form action="AddProductServlet" method="POST" enctype="multipart/form-data">

                        <div class="mb-3">
                            <label class="form-label">Product Name</label>
                            <input type="text" name="prodName" class="form-control rounded-pill px-4" 
                                   placeholder="e.g. Caramel Macchiato" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="prodDescription" class="form-control rounded-4 px-4 py-2" 
                                      rows="3" placeholder="Describe the flavor notes..."></textarea>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Price (RM)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0 rounded-start-pill ps-4">RM</span>
                                <input type="number" step="0.01" name="prodPrice" 
                                       class="form-control border-start-0 rounded-end-pill px-3" 
                                       placeholder="0.00" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Product Image</label>
                            <div id="preview-container">
                                <img id="image-preview" src="#" alt="Preview">
                                <div class="preview-placeholder">
                                    <i class="bi bi-image fs-1"></i>
                                    <p class="small mb-0">Image preview will appear here</p>
                                </div>
                            </div>
                            <input type="file" name="prodImage" id="imageInput" class="form-control" accept="image/*" required>
                        </div>

                        <div class="d-grid gap-2 pt-2">
                            <button type="submit" class="btn btn-save shadow-sm">
                                <i class="bi bi-cloud-upload me-2"></i> Save to Menu
                            </button>
                            <a href="DashboardServlet" class="btn btn-outline-secondary btn-cancel">
                                Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Image Preview Script
            const imageInput = document.getElementById('imageInput');
            const imagePreview = document.getElementById('image-preview');
            const placeholder = document.querySelector('.preview-placeholder');

            imageInput.onchange = evt => {
                const [file] = imageInput.files;
                if (file) {
                    imagePreview.src = URL.createObjectURL(file);
                    imagePreview.style.display = 'block';
                    placeholder.style.display = 'none';
                }
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>