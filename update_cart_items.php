<?php
include_once('connect.php');
$msg = '';
$error = '';
$stock=0;
try {
    // query to check stock 
    $checkStock = $con->prepare("SELECT stock FROM products WHERE prodcode = :prodcode");
    $checkStock->execute([
        ':prodcode' => $_POST['qtyid']
    ]);
    $result = $checkStock->fetch();
    if ($result['stock'] < $_POST['qtyVal']) {
        $error = 'This product is cannot be more than ' . $result['stock'];
    } else {
    // Fetch product details from the database using $product_id
    $stmt = $con->prepare("UPDATE store_orders SET qty=:qty WHERE product_id=:product_id AND user_id=:user_id");
    $stmt->execute(
        array(
            ':qty' => $_POST['qtyVal'],
            ':product_id' => $_POST['qtyid'], // Remove extra $
            ':user_id' => $_SESSION['user_id']
        )
    );
    if ($stmt){
        $msg = 'Cart updated successfully';
    } else {
        $error = 'Something went wrong, try again';
    }
    }
} catch (PDOException $e) {
    $error = $e->getMessage();
}
$output = array(
    'msg' => $msg,
    'error' => $error
);
echo json_encode($output);
?>