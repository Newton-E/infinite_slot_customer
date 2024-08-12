<?php
include_once('connect.php');

$response = array();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Check if the user already exists
        $stmt = $con->prepare("SELECT id FROM checkout_payment_type WHERE user_id = :user_id");
        $stmt->execute(array(':user_id' => $_SESSION['user_id']));
        $existingRecord = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existingRecord) {
            // Update the existing record
            $stmt = $con->prepare("UPDATE checkout_payment_type
                                   SET pay_type = :pay_type,
                                       status = :status
                                   WHERE user_id = :user_id");
            $stmt->execute(
                array(
                    ':pay_type'  => $_POST['pay_type'],
                    ':status'    => 'active',
                    ':user_id'   => $_SESSION['user_id']
                )
            );
            $response['status'] = 'success';
        } else {
            // Ensure card data is provided before attempting to insert
            if (!empty($_POST['card_number']) && !empty($_POST['card_name']) && !empty($_POST['card_expired_date']) && !empty($_POST['card_csv'])) {
                // Insert a new record
                $stmt = $con->prepare("INSERT INTO checkout_payment_type (user_id, pay_type, card_number, card_name, card_expired_date, card_csv, status)
                                       VALUES (:user_id, :pay_type, :card_number, :card_name, :card_expired_date, :card_csv, :status)");
                $stmt->execute(
                    array(
                        ':user_id'          => $_SESSION['user_id'],
                        ':pay_type'         => $_POST['pay_type'],
                        ':card_number'      => $_POST['card_number'],
                        ':card_name'        => $_POST['card_name'],
                        ':card_expired_date'=> $_POST['card_expired_date'],
                        ':card_csv'         => $_POST['card_csv'],
                        ':status'           => 'active'
                    )
                );
                $response['status'] = 'success';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Missing card details. Please fill in all the required fields.';
            }
        }
    } catch (PDOException $e) {
        $response['status'] = 'error';
        $response['message'] = 'Database error: ' . $e->getMessage();
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method.';
}

echo json_encode($response);
?>