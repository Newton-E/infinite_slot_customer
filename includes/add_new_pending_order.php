<?php
include_once('connect.php');

// Initialize response variables
$msg = '';
$error = '';
$success = false;
$amount = 0;
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
  die('You are not logged in.');
} else {
  // Check if user is logged in
  if (isset($_POST['productid'])) {
    $productid = $_POST['productid'];
    $quantity = $_POST['quantity'];
    $amount = substr(preg_replace('/[^0-9.]/', '', $_POST['amount']), 0,-3)*100;
    $uniqueID = hexdec(substr(uniqid('', true), 0, 8));
    try {
      // Insert order into store_orders table
      $stmt = $con->prepare("INSERT INTO store_orders (order_code,user_id, product_id, qty, product_price) 
                               SELECT :order_code, :user_id, :product_id, :qty, p.cost_price
                               FROM products p
                               WHERE p.prodcode = :product_id");
        $params = array(
            ':order_code'=>$uniqueID,
            ':user_id' => $_SESSION['user_id'],
            ':product_id' => $_POST['productid'],
            ':qty' => $_POST['quantity']
        );

      // $stmt = $con->prepare("INSERT INTO pending_order VALUES(:sn,:productid,:quantity,:amount,:tranxid, :userid, :date,:moved)");
      // $params = array(
      //   ':sn' => null,
      //   ':productid' => $productid,
      //   ':quantity' => $quantity,
      //   ':amount' => $amount,
      //   ':tranxid' => $uniqueID,
      //   ':userid' => $_SESSION['user_id'],
      //   ':date' => date("d-m-Y"),
      //   ':moved' => 0
      // );

      if ($stmt->execute($params)) {
        // Set success message
        // $success = true;         
$url = "https://api.paystack.co/transaction/initialize";

$fields = [
  'email' => $_SESSION['useremail'],
  'phone' => $_SESSION['phone'],
  'amount' => $amount
];

$fields_string = http_build_query($fields);

//open connection
$ch = curl_init();

//set the url, number of POST vars, POST data
curl_setopt($ch,CURLOPT_URL, $url);
curl_setopt($ch,CURLOPT_POST, true);
curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  "Authorization: Bearer sk_test_8829cfa49a425e119d248f64762e6aad8e04360f",
  "Cache-Control: no-cache",
));

//So that curl_exec returns the contents of the cURL; rather than echoing it
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true); 

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

    echo $redirect;
    
      } else {
        // Set error message
        echo 'error';
      }
    } catch (PDOException $e) {
      // $success = false;
      $error = $e->getMessage();
      echo "error in query".$error;
    }
  }
}

?>