<?php
include_once('connect.php');

$msg = '';
$error = '';

// Check if user is logged in and address is set
if (!isset($_SESSION['user_id'])) {
    $error = 'User not logged in';
} elseif (isset($_POST['address'])) {
    $address = $_POST['address'];

    try {
        // Insert new address into checkout_address table
        $stmt = $con->prepare("INSERT INTO checkout_address (user_id, address) 
                               VALUES (:user_id, :address)");
        $params = array(
            ':user_id' => $_SESSION['user_id'],
            ':address' => $address
        );

        if ($stmt->execute($params)) {
            // Set success message
            $msg = 'yes';
        } else {
            // Set error message
            $error = 'Error in adding address.';
        }
    } catch (PDOException $e) {
        $error = $e->getMessage();
    }
} else {
    $error = 'Required fields are missing';
}

$output = array(
    'msg' => $msg,
    'error' => $error
);
echo json_encode($output);
?>