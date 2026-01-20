<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Customize Order - CoffeeShop</title>

        <style>
            .card-img-standard {
                height: 200px; /* Set a fixed height for the *container* */
                width: 100%; /* Ensures the container takes the full width */
                object-fit: contain; /* The key change: Resizes while preserving aspect ratio */

                /* Optional: Add a background color to the container 
                   to fill the empty space left by 'contain' */
                background-color: #f8f9fa; /* Light gray background to match bg-light body */
            }
        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Customize Your Order</h2>
            <form action="cart.html" method="post">
                <div class="mb-3">
                    <label class="form-label">Item: Latte</label>
                </div>
                <div class="mb-3">
                    <img src="img/stock_latte.jpg" class="card-img-standard" alt="Latte">
                </div>
                <div class="mb-3">
                    <label for="size" class="form-label">Size</label>
                    <select class="form-select" id="size" name="size">
                        <option value="small">Small</option>
                        <option value="medium" selected>Medium</option>
                        <option value="large">Large</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="extras" class="form-label">Extras</label>
                    <input type="text" class="form-control" id="extras" name="extras" placeholder="e.g., extra shot, syrup">
                </div>
                <button type="submit" class="btn btn-success">Add to Cart</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
