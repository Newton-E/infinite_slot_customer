<?php
session_start();
include_once('connect.php');
if (isset($_POST['fullname'])) {
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = $_POST['password'];
    try {

        // if (empty($password)) {
        //     $sql = "UPDATE tb_users SET fullname=:fullname,email=:email,phone=:phone  WHERE user_id=:id";
        // } else {
            
        // }
        $sql = "UPDATE tb_users SET fullname=:fullname,email=:email,phone=:phone,password=:password  WHERE userid=:id";
        $stmt = $con->prepare($sql);
        $stmt->bindParam(":id", $_SESSION['user_id']);
        $stmt->bindParam(":fullname", $fullname);
        $stmt->bindParam(":email", $email);
        $stmt->bindParam(":phone", $phone);
        $stmt->bindParam(":password", password_hash($password, PASSWORD_DEFAULT));

        $stmt->execute();
        $count = $stmt->rowCount();
        if ($count > 0) {
            echo "ok";
        } else {
            echo "not ok";
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}
