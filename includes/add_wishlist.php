<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';
$success = false;

// Check if user is logged in
if (isset($_SESSION['user_id'])) {
    // Check if the product already exists in the user's cart
    $stmt = $con->prepare("SELECT COUNT(*) FROM tbl_wishlist WHERE user_id = :user_id AND product_id = :wishlistid");
    $stmt->execute([
        ':user_id' => $_SESSION['user_id'],
        ':wishlistid' => $_POST['wishlistid']
    ]);
    $count = $stmt->fetchColumn();

    if ($count > 0) {
        // Set error message if product already exists in wishlist
        $error = 'Product already exists in the wishlist';
    } else {
        // Insert order into store_orders table
        $stmt = $con->prepare("INSERT INTO tbl_wishlist (user_id, product_id) VALUES(:user_id, :wishlistid)");
        $params = array(
            ':user_id' => $_SESSION['user_id'],
            ':wishlistid' => $_POST['wishlistid']
        );

        if ($stmt->execute($params)) {
            $wishlist_id = $con->lastInsertId(); // Get the last inserted order ID

            // Additional logic specific to logged-in users
            // ...

            // Set success message
            $msg = 'Product added to wishlist successfully';
            $success = true;
        } else {
            // Set error message
            $error = 'Error adding product to wishlist. Please try again.';
        }
    }
}
// Prepare the response array
$output = array(
    'success' => $success,
    'msg' => $msg,
    'error' => $error
);

// Send the response as JSON
echo json_encode($output);
?>