
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Cart - CoffeeShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Your Cart</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Customization</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Cart Row -->
                    <tr>
                        <td>Latte</td>
                        <td>Medium, Extra Shot</td>
                        <td>$7.50</td>
                        <td>1</td>
                        <td>$7.50</td>
                        <td><button class="btn btn-danger btn-sm">Remove</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="text-end">
                <a href="checkout.html" class="btn btn-primary">Proceed to Checkout</a>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
