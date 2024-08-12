<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';

// Check if user is logged in
if (isset($_SESSION['user_id'])) {
    // Check if the product already exists in the user's cart
    $stmt = $con->prepare("SELECT COUNT(*) FROM tbl_compare WHERE user_id = :user_id AND product_id = :first_prod_id");
    $stmt->execute([
        ':user_id' => $_SESSION['user_id'],
        ':first_prod_id' => $_POST['first_prod_id']
    ]);
    $count = $stmt->fetchColumn();

    if ($count > 0) {
        // Set error message if product already exists in wishlist
        $error = 'Product already exists in the compare list';
    } else {
        // Insert each selected product into the compare table
        foreach ($_POST['selectedProducts'] as $selectedProduct) {
            $stmt = $con->prepare("INSERT INTO tbl_compare(user_id, product_id, compared_prod_id) VALUES (:user_id, :first_prod_id, :selectedProduct)");
            $params = array(
                ':user_id' => $_SESSION['user_id'],
                ':first_prod_id' => $_POST['first_prod_id'],
                ':selectedProduct' => $selectedProduct
            );

            if ($stmt->execute($params)) {
                $msg = 'Products added to compare list';
            } else {
                // Set error message
                $error = 'Error comparing products. Please try again.';
                break; // Exit loop if an error occurs
            }
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