<?php
sleep(2);
include_once('connect.php');
// Check if the promo code exists and is within its valid period
$query = $con->prepare("SELECT * FROM promo_codes WHERE code = :promo_code AND 
max_usage > current_usage AND 
NOW() BETWEEN valid_from AND valid_to");
$query->execute([
    ':promo_code' => $_POST['promocode']
]);

$result = $query->fetch();
    
    if ($result) {
        $discount = $result['discount'] / 100;
        $total_p = $discount * $_POST['total_price'];
        $sumresult = $_POST['total_price'] - $total_p;
        
        // Increment the current_usage of the promo code
        $incrementQuery = $con->prepare("UPDATE promo_codes SET current_usage = current_usage + 1 WHERE code = :promo_code");
        $incrementQuery->execute([
            ':promo_code' => $_POST['promocode']
        ]);
        
        $output = array(
            'discounted_price' => $sumresult
        );
    } else {
        // Promo code is not valid
        $sumresult = $_POST['total_price'];
        
        $output = array(
            'error' => 'You have entered an invalid or expired promo code'
        );
    }

    echo json_encode($output);
?>