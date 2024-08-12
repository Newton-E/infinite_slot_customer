<?php
session_start();
// include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';
$success = false;
$amount = "20000";
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
    die('You are not logged in.');
} else {
    echo $_SESSION['totalAmountCheckout'];
    // Check if user is logged in
    if (isset($_SESSION['totalAmountCheckout'])) {
        $amount = $_SESSION['totalAmountCheckout']*100;
        $email = $_SESSION['useremail'];
        // $amount = substr(preg_replace('/[^0-9.]/', '', $_POST['amount']), 0, -3) * 100;
        $uniqueID = hexdec(substr(uniqid('', true), 0, 8));
        $url = "https://api.paystack.co/transaction/initialize";

        $fields = [
            'email' => $email,
            'phone' => $_SESSION['phone'],
            'amount' => $amount
        ];

        $fields_string = http_build_query($fields);

        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt(
            $ch,
            CURLOPT_HTTPHEADER,
            array(
                "Authorization: Bearer sk_test_8829cfa49a425e119d248f64762e6aad8e04360f",
                "Cache-Control: no-cache",
            )
        );

        //So that curl_exec returns the contents of the cURL; rather than echoing it
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //execute post
        $result = curl_exec($ch);
        // echo $result;
        $aa = json_decode($result);
        // var_dump($aa);

        $redirect = "";
        foreach ($aa->data as $coords => $street) {
            // echo $coords ."=>".$street."<br>";
            if ($coords == "authorization_url") {
                $redirect = $street;
            }
            if ($coords == "reference") {
                $refno = $street;
                $_SESSION['refno'] = $refno;
                $_SESSION['order_code'] = $uniqueID;
                // $_SESSION['tranx'] = $uniqueID;
                // $_SESSION['productid'] = $productid;
                // $_SESSION['qty'] = $quantity;
                // $_SESSION['amount'] = $amount;
            }
        }

        header("location: ".$redirect);
    }else{
        
        header("location: ../shop-cart.php?error=true");
    }
}

?>