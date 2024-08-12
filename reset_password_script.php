<?php
include_once('connect.php');
$msg = "";
$error = "";
//Time to respond
sleep(2);
// Check if the product email exists in the user's table
$stmt = $con->prepare("SELECT COUNT(*) FROM tb_users WHERE code = :verification_code");
$stmt->execute([
    ':verification_code' => $_POST['otpcode']
]);

$count = $stmt->fetchColumn();
if ($count > 0) {
    $password_encrypt = password_hash($_POST['p1'], PASSWORD_DEFAULT);
    $insertSQL = $con->prepare("UPDATE tb_users SET password = :new_password, code = :new_code WHERE code = :verification_code");
    $insertSQL->execute([
        ':new_password' => $password_encrypt,
        ':verification_code' => $_POST['otpcode'],
        ':new_code' => 0
    ]);
    // statement if sql is done
    if ($insertSQL) {
        $msg = "Password changed successfully";
    } else {
        $error = "Unknown error occurred";
    }
} else {
    $error = "Sorry, this verification has expired. Please try again";
}
    // Prepare the response array
    $response = array(
        'error' => $error,
        'msg' => $msg
    );

// Send the response as JSON
echo json_encode($response);
?>