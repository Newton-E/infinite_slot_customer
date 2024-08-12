<?php
include_once('connect.php');

$output = '';
$status = '';
$number = 0;

try {
    
    $sql = "SELECT * FROM checkout_address  WHERE user_id=:id";

    $stmt = $con->prepare($sql);
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach ($result as $row) {
        $output .= '
        <option class="py-3" value="'.$row['address'].'">' .$row['address']. '</option>';
    }
    if (empty($result)) {
        $output = '<option class="py-3" value="">No address is being added</option>';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
