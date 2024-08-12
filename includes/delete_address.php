<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';
$success = false;

// Check if user is logged in
if (isset($_POST['id'])) {
        $id = $_POST['id'];
     
        try{       
        // Insert order into store_orders table
        $stmt = $con->prepare("DELETE FROM checkout_address WHERE user_id = :user_id AND sn = :sn");
        $params = array(
            ':user_id' => $_SESSION['user_id'],
            ':sn'=>$id,
        );

        if ($stmt->execute($params)) {
            // Set success message
            $success = true;
            echo "yes";
        } else {
            // Set error message
            $error = 'Error in deleting address.';
            echo $error;
        }
    }catch(PDOException $e){
        // $success = false;
        echo $e->getMessage();
    }

}


?>