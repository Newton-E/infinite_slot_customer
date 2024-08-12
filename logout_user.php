<?php
session_start();

// Simulate a delay (remove this line in a production environment)
sleep(2);

$response = array();

if (isset($_SESSION['user_id'])) {
    // Unset all of the session variables
    $_SESSION = array();

    // Destroy the session
    session_destroy();

    // Check if the session is really destroyed
    if (!isset($_SESSION['user_id'])) {
        $response['success'] = true;
    } else {
        $response['success'] = false;
    }
} else {
    $response['success'] = false;
}

// Return the JSON response
echo json_encode($response);
?>