<?php
include_once('connect.php');
$output = array();

if (isset($_SESSION['user_id'])) {
    try {
        $stmt = $con->prepare("SELECT * FROM tb_users WHERE userid = :userid");
        $stmt->bindParam(':userid', $_SESSION['user_id']);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $output["userid"] = $row['userid'];
        $output["image"] = $row['image'];
        $output["username"] = $row['fullname'];
        $output["useremail"] = $row['email'];
        $output["phone"] = $row['phone'];
        $output["phone2"] = $row['other_phone'];
        $output["address"] = $row['address'];
        $output["state"] = $row['state'];
        $output["lga"] = $row['lga'];
        $output["zip"] = $row['zip_code'];
        $output["status"] = $row['status'];
    }
    catch (PDOException $e) {
        $output["error"] = "There is some problem in connection: " . $e->getMessage();
    }
} else {
    $output["username"] = "Hello, Sign in";
}

echo json_encode($output);
?>