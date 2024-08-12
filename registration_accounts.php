<?php
include_once('connect.php');

$msg = "";
$error = "";

if (isset($_POST['user_email'])) {
    // Check if the product email exists in the user's table
    $stmt = $con->prepare("SELECT COUNT(*) FROM tb_users WHERE email = :user_email");
    $stmt->execute([
        ':user_email' => $_POST['user_email']
    ]);

    $count = $stmt->fetchColumn();
    
    if ($count > 0) {
        $error = "Sorry, this email is already in use.";
    } else {
        $password = $_POST['user_password'];
        $password_encrypt = password_hash($password, PASSWORD_DEFAULT);

        // Generate a random user ID
        $randCode = rand(100000, 999999);

        // Insert user data into tb_users table
        $insertSQL = $con->prepare("INSERT INTO tb_users (userid, fullname, email, phone, password) 
                                   VALUES (:userid, :fullname, :email, :phone, :password)");
        $insertSQL->execute([
            ':userid' => $randCode,
            ':fullname' => $_POST['fname'],
            ':email' => $_POST['user_email'],
            ':phone' => $_POST['user_phone'],
            ':password' => $password_encrypt
        ]);

        if ($insertSQL) {
            $_SESSION['user_id'] = $randCode;
            $msg = "Registration successful";
        } else {
            $error = "Unable to register your account. Please try again.";
        }
        // handle cart
        if (isset($_SESSION['cart'])) {
            $cart = $_SESSION['cart'];
    
            // Loop through the cart items
            foreach ($cart as $item) {
                // Retrieve the existing order for the user and product
                $stmt = $con->prepare("SELECT * FROM store_orders WHERE user_id = :user_id AND product_id = :product_id");
                $stmt->execute([
                    ':user_id' => $randCode,
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
                            ':user_id' => $randCode,
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
    }

    // Prepare the response array
    $response = array(
        'error' => $error,
        'msg' => $msg
    );

    // Send the response as JSON
    echo json_encode($response);
}
?>