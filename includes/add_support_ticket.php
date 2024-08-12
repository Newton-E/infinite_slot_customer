<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';
$success = false;

// Check if user is logged in
if (isset($_POST['subject'])) {
        $subject = $_POST['subject'];
        $type = $_POST['type'];
        $priority = $_POST['priority'];
        $content = $_POST['content'];
        $date = date("d-m-Y");
        $status = "Open";
     
        try{       
        // Insert order into store_orders table
        $stmt = $con->prepare("INSERT INTO support_tickets VALUES(:id, :user_id, :subject, :type, :priority, :description, :status, :file, :created_at,:updated_at)");
        $params = array(
            'id'=>null,
            ':user_id' => $_SESSION['user_id'],
            ':subject' => $subject,
            ':type' => $type,
            ':priority' => $priority,
            ':description' => $content,
            ':status' => $status,
            ':file' => " ",
            ':created_at' => $date,
            ':updated_at' => ''
        );

        if ($stmt->execute($params)) {
            // Set success message
            $success = true;
            echo "yes";
        } else {
            // Set error message
            $error = 'Error in Submitting Ticket.';
            echo $error;
        }
    }catch(PDOException $e){
        // $success = false;
        echo $e->getMessage();
    }

}


?>