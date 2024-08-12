<?php
include_once('connect.php');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/SMTP.php';

$msg = "";
$error = "";

if (isset($_POST['useremail'])) {
    // Check if the product email exists in the user's table
    $stmt = $con->prepare("SELECT COUNT(*) FROM tb_users WHERE email = :user_email");
    $stmt->execute([
        ':user_email' => $_POST['useremail']
    ]);
    $count = $stmt->fetchColumn();
    
    if ($count === 0) {
        $error = "Sorry, this email does not exist. Please try again";
    } else {
        $stmt = $con->prepare("SELECT * FROM tb_users WHERE email = :user_email");
        $stmt->execute([
            ':user_email' => $_POST['useremail']
        ]);
        $result = $stmt->fetch(); // Fetch a single row
        $cust_name = $result['fullname'];
        
        // Generate a random verification id
        $randCode = rand(100000, 999999);

        $updateCode = $con->prepare("UPDATE tb_users SET code = :randCode WHERE email = :email_verified");
        $updateCode->execute([
            ':randCode' => $randCode,
            ':email_verified' => $_POST['useremail']
            ]);
        if ($updateCode) {
            // Mailer script
            $mail = new PHPMailer();
                
            // Server settings
            $mail->isSMTP(); // Send using SMTP
            $mail->SMTPAuth = true; // enable SMTP authentication
            $mail->SMTPSecure = "tls"; // sets the prefix to the servier
            $mail->Host = "smtp.gmail.com"; // sets GMAIL as the SMTP server
            $mail->Port = 587; // set the SMTP port for the GMAIL server
            $mail->Username   = "infiniteslot@gmail.com"; // SMTP username
            $mail->Password   = "qllzrtcnypqxdbkm"; // SMTP password

            // Recipients
            $mail->setFrom('app@ticketmaster.com', 'Infinite Slot');
            $mail->addAddress($_POST['useremail']); // Use fetched email
            $mail->addReplyTo('help@ticketmaster.com', 'Help Center');

            // Content
            $mail->isHTML();
            $mail->Subject = "Password Reset Verification"; // Set your subject
            
            // Load your HTML template
            $htmlTemplate = file_get_contents('email_templates/otp_msg.html');
            $mail->Body = $htmlTemplate;

            // Replace placeholders with actual values
            $mail->Body = str_replace('{TO_NAME}', $cust_name, $mail->Body);
            // $mail->Body = str_replace('{TO_OTP}', $randCode, $mail->Body);
            $mail->Body = str_replace('{CUSTOM_URL}', $randCode, $mail->Body);
            
            // Finally send email
            if ($mail->send()) {
                $msg = 'We have sent a very fication link to your email address, please verify';
            } else {
                $error = 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo;
            }
        }
    }

    // Prepare the response array
    $response = array(
        'error' => $error,
        'msg' => $msg
    );

    // Send the response as JSON
    echo json_encode($response);
}
?>