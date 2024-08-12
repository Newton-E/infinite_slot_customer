<?php
include_once('connect.php');
$output = 0;

try {

    $sql ="SELECT count(*) AS coun FROM support_tickets WHERE user_id=:id";

    $stmt = $con->prepare($sql);
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();
    
    $output=$result[0]["coun"];
    if (empty($result)) {
        $output = 0;
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
?>