<?php
include_once('connect.php');
$response = array();
try {
    // Prepare and execute SQL query
    $stmt = $con->prepare("SELECT 
    u.fullname,
    s.address, 
    s.state, 
    s.phone_number, 
    c.pay_type, 
    c.card_number
FROM 
    tb_users u 
JOIN 
    shipping_info s ON u.userid = s.user_id 
JOIN 
    checkout_payment_type c ON u.userid = c.user_id 
WHERE 
    u.userid = :userid AND c.paystatus = 0");

    $stmt->execute(array(':userid' => $_SESSION['user_id']));
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($data) {
        // Process data if available
        if ($data['pay_type'] === 'card') {
            $data['card_number_last4'] = substr($data['card_number'], -4);
        } else {
            $data['card_number_last4'] = null; // Ensure this key exists
        }
        echo json_encode($data);
    } else {
        $response['status'] = 'error';
        $response['message'] = 'No checkout details found.';
        echo json_encode($response);
    }
} catch (PDOException $e) {
    $response['status'] = 'error';
    $response['message'] = 'Database error: ' . $e->getMessage();
    echo json_encode($response);
}
?>