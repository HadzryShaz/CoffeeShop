

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - CoffeeShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Checkout</h2>

    <!-- Order Summary Table -->
    <h4 class="mb-3">Your Order</h4>
    <div class="table-responsive mb-4">
        <table class="table table-bordered text-center align-middle">
            <thead class="table-light">
                <tr>
                    <th>Item</th>
                    <th>Customization</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Latte</td>
                    <td>Medium, Extra Shot</td>
                    <td>$7.50</td>
                    <td>1</td>
                    <td>$7.50</td>
                </tr>
                <tr>
                    <td>Croissant</td>
                    <td>Butter, Warmed</td>
                    <td>$5.50</td>
                    <td>2</td>
                    <td>$11.00</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="4" class="text-end">Total</th>
                    <th colspan="2">$18.50</th>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Checkout Form -->
    <form action="index.html" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="mb-3">
            <label for="orderType" class="form-label">Order Type</label>
            <select class="form-select" id="orderType" name="orderType" onchange="toggleAddressField()" required>
                <option value="dine_in" selected>Dine-In</option>
                <option value="take_away">Take-Away</option>
                <option value="delivery">Delivery</option>
            </select>
        </div>

        <div class="mb-3 d-none" id="addressContainer">
            <label for="address" class="form-label">Delivery Address</label>
            <textarea class="form-control" id="address" name="address" rows="2"></textarea>
        </div>

        <div class="mb-3">
            <label for="payment" class="form-label">Payment Method</label>
            <select class="form-select" id="payment" name="payment" required>
                <option value="card">Card</option>
                <option value="cash">Cash</option>
            </select>
        </div>

        <a href="index.html" class="btn btn-primary w-100">Place Order</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleAddressField() {
        const orderType = document.getElementById('orderType').value;
        const addressContainer = document.getElementById('addressContainer');
        const addressInput = document.getElementById('address');

        if (orderType === 'delivery') {
            addressContainer.classList.remove('d-none');
            addressInput.setAttribute('required', 'true');
        } else {
            addressContainer.classList.add('d-none');
            addressInput.removeAttribute('required');
            addressInput.value = '';
        }
    }
</script>
</body>
</html>
