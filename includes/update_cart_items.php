<?php
include_once('connect.php');

$msg = '';
$error = '';

try {
    // Check if the user is logged in
    if (!isset($_SESSION['user_id'])) {
        $error = 'User not logged in';
    } else {
        // Query to check stock 
        $checkStock = $con->prepare("SELECT stock FROM products WHERE prodcode = :prodcode");
        $checkStock->execute([
            ':prodcode' => $_POST['qtyid']
        ]);
        $result = $checkStock->fetch();

        // Check if the requested quantity exceeds the available stock
        if ($result && $result['stock'] < $_POST['qtyVal']) {
            $error = 'This product cannot be more than ' . $result['stock'];
        } else {
            // Update the quantity in the cart
            $stmt = $con->prepare("UPDATE store_orders SET qty = :qty WHERE product_id = :product_id AND user_id = :user_id");
            $stmt->execute([
                ':qty' => $_POST['qtyVal'],
                ':product_id' => $_POST['qtyid'],
                ':user_id' => $_SESSION['user_id']
            ]);

            // Check if the update was successful
            if ($stmt->rowCount() > 0) {
                $msg = 'Cart updated successfully';
            } else {
                $error = 'Nothing to update or something went wrong, try again';
            }
        }
    }
} catch (PDOException $e) {
    $error = $e->getMessage();
}

$output = [
    'msg' => $msg,
    'error' => $error
];
echo json_encode($output);
?>