<?php
include_once('connect.php');
$response = array();

if (isset($_SESSION['user_id'])) {
    try {
        $stmt = $con->prepare("SELECT shipping_method FROM shipping_info WHERE user_id = :user_id LIMIT 1");
        $stmt->bindParam(':user_id', $_SESSION['user_id']);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            if ($result['shipping_method'] == 0) {
                $response['status'] = 'error';
                $response['message'] = 'Please select a shipping method.';
            } else {
                $response['status'] = 'success';
            }
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Shipping method not found.';
        }
    } catch (PDOException $e) {
        $response['status'] = 'error';
        $response['message'] = 'Database error: ' . $e->getMessage();
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'User not logged in.';
}

echo json_encode($response);
?>