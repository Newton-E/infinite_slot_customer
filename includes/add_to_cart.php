<?php
include_once('connect.php');
// Initialize response variables
$msg = '';
$error = '';
// Check if user is logged in
if (isset($_SESSION['user_id'])) {
    try{
    // Check if the product already exists in the user's cart
    $stmt = $con->prepare("SELECT COUNT(*) FROM store_orders WHERE user_id = :user_id AND product_id = :product_id");
    $stmt->execute([
        ':user_id' => $_SESSION['user_id'],
        ':product_id' => $_POST['product_id']
    ]);
    $count = $stmt->fetchColumn();

    if ($count > 0) {
        // Set error message if product already exists in cart
        $error = 'Product already exists in the cart';
    } else {
        // Insert order into store_orders table
        $stmt = $con->prepare("INSERT INTO store_orders (order_code,user_id, product_id, qty, product_price) 
                               SELECT :order_code, :user_id, :product_id, :qty, p.cost_price
                               FROM products p
                               WHERE p.prodcode = :product_id");
        $params = array(
            ':order_code'=>random_int(1000000,9000000),
            ':user_id' => $_SESSION['user_id'],
            ':product_id' => $_POST['product_id'],
            ':qty' => $_POST['quantity']

        );

        if ($stmt->execute($params)) {
            $order_id = $con->lastInsertId(); // Get the last inserted order ID
            // Set success message
            $msg = 'Product added to cart successfully';
        } else {
            // Set error message
            $error = 'Error adding product to cart. Please try again.';
        }
    }
}catch(PDOException $e){
    $error= $e->getMessage();
}
} else {
    // User is not logged in, save order in session
    $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
    $product_id = $_POST['product_id'];

    // Create a unique key for the cart item based on product ID
    $cart_key = 'cart_' . $product_id;

    // Retrieve product details from the database using $product_id
    $stmt = $con->prepare("SELECT cost_price FROM products WHERE prodcode = :product_id");
    $stmt->bindParam(':product_id', $product_id);
    $stmt->execute();
    $product = $stmt->fetch();

    if ($product) {
        // Check if the product already exists in the cart
        $existing_item = isset($cart[$cart_key]) ? $cart[$cart_key] : null;

        if ($existing_item) {
            // Set error message if product already exists in cart
            $error = 'Product already exists in the cart';
        } else {
            // Add order details to the cart
            $cart[$cart_key] = array(
                'product_id' => $_POST['product_id'],
                'qty' => $_POST['quantity'],
                'product_price' => $product['cost_price']
            );

            // Save the updated cart in the session
            $_SESSION['cart'] = $cart;

            // Set success message
            $msg = 'Product added to cart successfully';
        }
    } else {
        // Set error message
        $error = 'Error retrieving product details. Please try again.';
    }
}

// Prepare the response array
$output = array(
    'msg' => $msg,
    'error' => $error
);

// Send the response as JSON
echo json_encode($output);
?>