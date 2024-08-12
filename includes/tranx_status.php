<?php
include_once('connect.php');

$ref = $_GET['reference'];
$curl = curl_init();

$reference = $_SESSION["refno"];



curl_setopt_array($curl, array(
    CURLOPT_URL => "https://api.paystack.co/transaction/verify/" . $ref,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
    CURLOPT_HTTPHEADER => array(
        "Authorization: Bearer sk_test_8829cfa49a425e119d248f64762e6aad8e04360f",
        "Cache-Control: no-cache",
    ),
)
);

$response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);

if ($err) {
    echo "cURL Error #:" . $err;
} else {

    $aa = json_decode($response);
    //  foreach($aa->data as $e=>$a){
    //      if($e=="status"){
    //          if($a == "success"){
    //              
    //          }
    //      }
    //  }
}
// var_dump($aa);

$status = $aa->{"data"}->{"status"};
// $email = $aa->{"data"}->{"email"};
// $phone = $aa->{"data"}->{"phone"};
$p_ref = $aa->{"data"}->{"reference"};
$id = $aa->{"data"}->{"id"};
$paid_at = $aa->{"data"}->{"paid_at"};
// $amount = $aa->{"data"}->{"amount"};
// $date = date("d-m-Y");
if ($status == "success") {
    try {

        $selectedItems = $_SESSION['selected_items'];
        $refno = $_GET['reference'];
        if (!empty($selectedItems)) {
            // Prepare and execute the SQL statement to insert selected items into the database
            $stmt = $con->prepare("UPDATE store_orders SET pay_status='1', order_code='$refno' WHERE product_id=:product_id");
            
            foreach ($selectedItems as $item) {
                $params = array(
                    ':product_id' => $item['itemId']
                );
                if ($stmt->execute($params)) {
                    $refno = $street;
                    echo "success";
                }
            }
            // Clear the session data
            $_SESSION['selected_items'] = [];
        } else if(!empty($_SESSION["refno"])){
            $stmt = $con->prepare("UPDATE store_orders SET pay_status='1', order_code='$refno' WHERE product_id=:product_id");
            $params = array(
                ':order_code' => $_SESSION['order_code']
            );
    
            if ($stmt->execute($params)) {
              $refno = $street;
            
              echo "success";
              ?>
        <script>alert("payment has been made successfully")
        window.location.href="../account-orders.php"</script>
              <?php
              $_SESSION["refno"] ="";
            }
        
        }else{
            echo "No product to check the status for !";
        }
    } catch (PDOException $e) {
        // $success = false;
        $error = $e->getMessage();
        echo "error in query" . $error;
    }
}