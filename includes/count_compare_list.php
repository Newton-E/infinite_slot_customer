<?php
include_once('connect.php');
$output = 0;

try {

    $sql ="SELECT count(*) AS count FROM tbl_compare  WHERE user_id=:id";

    $stmt = $con->prepare($sql);
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();
    
    $output=$result[0]["count"];
    if (empty($result)) {
        $output = 0;
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
