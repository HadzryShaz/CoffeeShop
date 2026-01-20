<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="coffeeshop.model.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%
        // Retrieve the product object passed from the Servlet
        ProductBean product = (ProductBean) request.getAttribute("product");
        if (product == null) {
            response.sendRedirect("DashboardServlet");
            return;
        }
    %>

    <div class="container mt-5">
        <div class="card shadow mx-auto" style="max-width: 600px;">
            <div class="card-header bg-warning text-dark">
                <h4 class="mb-0">Edit Menu Item: <%= product.getProdName() %></h4>
            </div>
            <div class="card-body">
                <form action="EditProductServlet" method="POST" enctype="multipart/form-data">
                    
                    <input type="hidden" name="prodId" value="<%= product.getProdId() %>">
                    
                    <input type="hidden" name="existingImage" value="<%= product.getProdImagePath() %>">

                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="prodName" class="form-control" 
                               value="<%= product.getProdName() %>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="prodDescription" class="form-control" rows="3"><%= product.getProdDescription() %></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Price (RM)</label>
                        <input type="number" step="0.01" name="prodPrice" class="form-control" 
                               value="<%= product.getProdPrice() %>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label d-block">Current Image</label>
                        <img src="<%= product.getProdImagePath() %>" alt="Current Image" 
                             style="width: 100px; height: 100px; object-fit: cover;" class="mb-2 border rounded">
                        <input type="file" name="prodImage" class="form-control" accept="image/*">
                        <small class="text-muted">Select a new file only if you want to change the image.</small>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Update Product</button>
                        <a href="DashboardServlet" class="btn btn-outline-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>