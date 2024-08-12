<?php
include_once('connect.php');
$msg = '';
$error = '';
if (isset($_POST['product_id'])) {
    $stmt = $con->prepare('DELETE FROM tbl_wishlist WHERE product_id = :product_id AND user_id = :user_id');
    $stmt->execute([
        ':product_id' => $_POST['product_id'],
        ':user_id' => $_SESSION["user_id"]
    ]);

    if ($stmt) {
        $msg = "Item deleted successfully";
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