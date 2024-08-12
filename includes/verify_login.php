<?php
// session_start();
require_once("connect.php");
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
    header("location: ./index.php");
}
?>