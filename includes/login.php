<?php
include_once('connect.php');
// Get username and password from the login form
$user_email = $_POST['user_email'];
$password = $_POST['password'];

// Check username in the database
$stmt = $con->prepare("SELECT userid, password FROM tb_users WHERE email = :user_email");
$stmt->execute([
    ':user_email' => $user_email
]);
$user = $stmt->fetch();

if ($user && password_verify($password, $user['password'])) {
    // Login successful
    $_SESSION['user_id'] = $user['userid'];

    // Check if there is a cart in the session
    if (isset($_SESSION['cart'])) {
        $cart = $_SESSION['cart'];

        // Loop through the cart items
        foreach ($cart as $item) {
            // Retrieve the existing order for the user and product
            $stmt = $con->prepare("SELECT * FROM store_orders WHERE user_id = :user_id AND product_id = :product_id");
            $stmt->execute([
                ':user_id' => $user['userid'],
                ':product_id' => $item['product_id']
            ]);
            $existingOrder = $stmt->fetch();

            if ($existingOrder) {
                // Update the quantity of the existing order
                $newQuantity = $existingOrder['qty'] + $item['qty'];

                $stmt = $con->prepare("UPDATE store_orders SET qty = :new_quantity WHERE ordersid = :order_id");
                $stmt->execute([
                    ':new_quantity' => $newQuantity,
                    ':order_id' => $existingOrder['ordersid']
                ]);
            } else {
                // Retrieve the price of the product
                $stmt = $con->prepare("SELECT cost_price FROM products WHERE prodcode = :product_id");
                $stmt->execute([
                    ':product_id' => $item['product_id']
                ]);
                $product = $stmt->fetch();

                if ($product) {
                    // Insert order details into the store_orders table
                    $stmt = $con->prepare("INSERT INTO store_orders (user_id, product_id, qty, product_price, pay_status, packag_status, date_order)
                                           VALUES (:user_id, :product_id, :qty, :product_price, :pay_status, :shipt_status, NOW())");
                    $stmt->execute([
                        ':user_id' => $user['userid'],
                        ':product_id' => $item['product_id'],
                        ':qty' => $item['qty'],
                        ':product_price' => $item['product_price'],
                        ':pay_status' => 0, // Set the appropriate payment status value
                        ':shipt_status' => 0 // Set the appropriate shipment status value
                    ]);
                }
            }
        }

        // Clear the cart in the session
        unset($_SESSION['cart']);
    }

    // Prepare the response array
    $response = array(
        'success' => true
    );
} else {
    // Login failed
    $response = array(
        'success' => false,
        'error' => 'Invalid username or password'
    );
}

// Send the response as JSON
echo json_encode($response);
?>