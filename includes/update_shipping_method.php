<?php
include_once('connect.php');
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['shipping_method_id'])) {
    $shipping_method_id = $_POST['shipping_method_id'];

    try {
        // Update the shipping_info table with the selected shipping method
        $stmt = $con->prepare("UPDATE shipping_info SET shipping_method = ? WHERE user_id = ?");
        $stmt->execute([$shipping_method_id, $_SESSION['user_id']]);
    } catch (PDOException $e) {
        // Handle the exception if needed
        // For now, we will ignore the error to prevent any response
    }
}
?>