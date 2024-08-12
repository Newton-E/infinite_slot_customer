<?php
session_start();
include_once('connect.php');
if (isset($_POST['product_id'])) {
    $product_id = $_POST['product_id'];

    try {
        // Fetch the current view counter value
        $selectSql = "SELECT view_counter FROM products WHERE prodcode=:prod_code";
        $selectStmt = $con->prepare($selectSql);
        $selectStmt->bindParam(":prod_code", $product_id);
        $selectStmt->execute();
        
        $currentCounter = $selectStmt->fetchColumn();
        
        // Update the view counter by incrementing it by one
        $newCounter = $currentCounter + 1;

        // Update the database with the new counter value
        $updateSql = "UPDATE products SET view_counter=:counter WHERE prodcode=:prod_code";
        $updateStmt = $con->prepare($updateSql);
        $updateStmt->bindParam(":counter", $newCounter);
        $updateStmt->bindParam(":prod_code", $product_id);
       
        $updateStmt->execute();
        $count = $updateStmt->rowCount();
        if ($count > 0) {
            echo "ok";
        } else {
            echo "not ok";
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}
?>
