<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';
$success = false;

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo 'User not logged in';
    exit;
}

// Check if the required fields are set
if (isset($_POST['phone']) && isset($_POST['address1']) && isset($_POST['zip_code']) && isset($_POST['map_url'])) {
    $phone = $_POST['phone'];
    $address1 = $_POST['address1'];
    $zip_code = $_POST['zip_code'];
    $state = $_POST['state'];
    $map_url = $_POST['map_url'];

    try {
        // Check if the user already has a shipping info record
        $checkStmt = $con->prepare("SELECT COUNT(*) FROM shipping_info WHERE user_id = :user_id");
        $checkStmt->bindParam(':user_id', $_SESSION['user_id']);
        $checkStmt->execute();
        $exists = $checkStmt->fetchColumn();

        if ($exists > 0) {
            // Update existing shipping info
            $stmt = $con->prepare("UPDATE shipping_info 
                                   SET phone_number = :phone, state = :state, address = :address, zip_code = :zip_code, map_url = :map_url 
                                   WHERE user_id = :user_id");
        } else {
            // Insert new shipping info
            $stmt = $con->prepare("INSERT INTO shipping_info (user_id, phone_number, state, address, zip_code, map_url) 
                                   VALUES (:user_id, :phone, :state, :address, :zip_code, :map_url)");
        }

        $params = array(
            ':user_id' => $_SESSION['user_id'],
            ':phone' => $phone,
            ':state' => $state,
            ':address' => $address1,
            ':zip_code' => $zip_code,
            ':map_url' => $map_url
        );

        if ($stmt->execute($params)) {
            echo "success";
        } else {
            echo 'Error in adding or updating shipping info.';
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
} else {
    echo 'Required fields are missing';
}
?>