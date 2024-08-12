<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';

// Check if user is logged in
if (isset($_SESSION['user_id'])) {
    // Check if the product already exists in the user's cart
    $stmt = $con->prepare("SELECT COUNT(*) FROM tbl_compare WHERE user_id = :user_id AND product_id = :compareid");
    $stmt->execute([
        ':user_id' => $_SESSION['user_id'],
        ':compareid' => $_POST['compareid']
    ]);
    $count = $stmt->fetchColumn();

    if ($count > 0) {
        // Set error message if product already exists in wishlist
        $error = 'Product already exists in the compare list';
    } else {
        // Insert order into store_orders table
        $stmt = $con->prepare("INSERT INTO tbl_compare (user_id, product_id) VALUES(:user_id, :compareid)");
        $params = array(
            ':user_id' => $_SESSION['user_id'],
            ':compareid' => $_POST['compareid']
        );

        if ($stmt->execute($params)) {
            $wishlist_id = $con->lastInsertId(); // Get the last inserted order ID

            // Additional logic specific to logged-in users
            // ...

            // Set success message
            $msg = 'Product added to compare list';
            $success = true;
        } else {
            // Set error message
            $error = 'Error comparing product. Please try again.';
        }
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