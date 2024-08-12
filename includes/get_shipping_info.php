<?php

include_once("connect.php");

$output = array();

if (isset($_SESSION['user_id'])) {
  $statement = $con->prepare("SELECT * FROM shipping_info WHERE user_id = :user_id ORDER BY sn DESC");
  $statement->execute(
    array(
      ':user_id' => $_SESSION['user_id']
    )
  );

  $result = $statement->fetch(PDO::FETCH_ASSOC);

  if ($result) {
    $output["name"] = $result["fullname"];
    $output["phone"] = $result["phone"];
    $output["address"] = $result["address1"];
  }
}

echo json_encode($output);
?>
