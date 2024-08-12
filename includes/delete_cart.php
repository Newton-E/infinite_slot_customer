<?php
include_once('connect.php');
$msg = '';
$error = '';
if (isset($_POST['delete_id'])) {
    $stmt = $con->prepare('DELETE FROM store_orders WHERE product_id = :product_id AND user_id = :user_id');
    $stmt->execute([
        ':product_id' => $_POST['delete_id'],
        ':user_id' => $_SESSION["user_id"]
    ]);

    if ($stmt) {
        $msg = "Cart deleted successfully";
    } else {
        $error = "Unknown error occurred. Please try again";
    }
}

$data = array(
    'msg' => $msg,
    'error' => $error
); 

echo json_encode($data);
?>