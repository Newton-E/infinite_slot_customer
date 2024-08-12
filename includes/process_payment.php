<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json'); // Ensure the content type is JSON

include_once('connect.php');

$response = array();

try {
    // Retrieve POST data
    $email = $_POST['email'];
    $amount = $_POST['amount'];
    $reference = $_POST['reference'];
    $user_id = $_POST['userid'];
    $username = $_POST['username'];
    $choice = $_POST['paymentmethod'];

    // Update store_orders to set pay_status
    $stmt = $con->prepare("UPDATE store_orders SET pay_status = 1 WHERE user_id = :user_id");
    $stmt->execute([':user_id' => $user_id]);

    // Select all products for this user
    $stmt = $con->prepare("SELECT * FROM store_orders WHERE user_id = :user_id");
    $stmt->execute([':user_id' => $user_id]);
    $orders = $stmt->fetchAll();

    $total_cost = 0;
    $total_tax = 0;
    $sub_total = 0;
    $store_id = null;

    foreach ($orders as $order) {
        // Fetch product details
        $stmt = $con->prepare("SELECT * FROM products WHERE prodcode = :prodcode");
        $stmt->execute([':prodcode' => $order['product_id']]);
        $product = $stmt->fetch();

        if ($product) {
            // Reduce product quantity
            $new_qty = $product['stock'] - $order['qty'];
            $stmt = $con->prepare("UPDATE products SET stock = :new_qty WHERE prodcode = :prodcode");
            $stmt->execute([':new_qty' => $new_qty, ':prodcode' => $order['product_id']]);

            // Calculate total cost and tax
            $total_cost += $order['qty'] * $product['cost_price'];
            $total_tax += $order['taxes_amt'];
            $store_id = $product['store_id']; // Assuming all products belong to the same store
        }
    }

    $sub_total = $total_cost + $total_tax;

    // Check if the buyer_id and store_id combination exists in the store_buyers table
    $stmt = $con->prepare("SELECT * FROM store_buyers WHERE buyer_id = :buyer_id AND store_id = :store_id");
    $stmt->execute([':buyer_id' => $user_id, ':store_id' => $store_id]);
    $store_buyer = $stmt->fetch();

    if ($store_buyer) {
        // Update buyingCount and date_buy if the combination exists
        $stmt = $con->prepare("UPDATE store_buyers SET buyingCount = buyingCount + 1, date_buy = NOW() WHERE buyer_id = :buyer_id AND store_id = :store_id");
        $stmt->execute([':buyer_id' => $user_id, ':store_id' => $store_id]);
    } else {
        // Insert a new row if the combination doesn't exist
        $stmt = $con->prepare("INSERT INTO store_buyers (buyer_id, store_id, buyingCount, date_buy) VALUES (:buyer_id, :store_id, 1, NOW())");
        $stmt->execute([':buyer_id' => $user_id, ':store_id' => $store_id]);
    }

    // Fetch shipping info
    $stmt = $con->prepare("SELECT * FROM shipping_info WHERE user_id = :user_id LIMIT 1");
    $stmt->execute([':user_id' => $user_id]);
    $shipping_info = $stmt->fetch();

    if (!$shipping_info) {
        throw new Exception('Shipping info not found.');
    }

    // Insert into invoice_order table
    $stmt = $con->prepare("INSERT INTO invoice_order (store_id, invoiceCodex, order_date, ctype, cname, cphoneNumber, c_state, c_address, online_cid, subTotalx, status, choice, r_amount, cchange, fnote, tax, disAmount)
                           VALUES (:store_id, :invoiceCodex, NOW(), 'online', :cname, :cphoneNumber, :c_state, :c_address, :online_cid, :subTotalx, 'Paid', :choice, :r_amount, 0, '', :tax, 0)");
    $stmt->execute(
        array(
            ':store_id'         => $store_id,
            ':invoiceCodex'     => $reference, // Using the reference passed from POST data
            ':cname'            => $username,
            ':choice'           => $choice,
            ':cphoneNumber'     => $shipping_info['phone_number'],
            ':c_state'          => $shipping_info['state'],
            ':c_address'        => $shipping_info['address'],
            ':online_cid'       => $user_id,
            ':subTotalx'        => $sub_total,
            ':r_amount'         => $sub_total,
            ':tax'              => $total_tax
        )
    );
    $response['status'] = 'success';
} catch (Exception $e) {
    $response['status'] = 'error';
    $response['message'] = $e->getMessage();
}

echo json_encode($response);
?>