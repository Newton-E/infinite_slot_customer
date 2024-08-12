<?php
include_once('connect.php');

$output = '';
$total = '';
$total_price = 0;
$total_shipping = 0;
$total_taxes = 0;
$total_discount = 0;
$error = '';

try {
    // Fetch product details from the database using $user_id
    $stmt = $con->prepare("SELECT so.product_id, so.qty, so.product_price, so.taxes_amt, so.discount_amt, pr.name, pr.cost_price, pi.image_name 
                           FROM store_orders so 
                           INNER JOIN products pr ON pr.prodcode = so.product_id 
                           LEFT JOIN product_brand pb ON pr.brand_id = pb.brand_id 
                           INNER JOIN product_img pi ON pr.prodcode = pi.product_id 
                           WHERE so.user_id = :user_id AND so.pay_status <= 1
                           GROUP BY so.product_id");
    $stmt->bindParam(':user_id', $_SESSION['user_id']);
    $stmt->execute();
    $products = $stmt->fetchAll();

    // Fetch the shipping method ID and handling fee for the current user
    $stmt = $con->prepare("SELECT si.shipping_method, sm.handling_fee 
                           FROM shipping_info si 
                           INNER JOIN tb_shipping_method sm ON si.shipping_method = sm.id 
                           WHERE si.user_id = :user_id LIMIT 1");
    $stmt->bindParam(':user_id', $_SESSION['user_id']);
    $stmt->execute();
    $shipping_info = $stmt->fetch();

    if ($shipping_info) {
        $total_shipping = $shipping_info['handling_fee'];
    }

    if ($products) {
        foreach ($products as $row) {
            $product_name = $row['name'];
            $product_price = $row['cost_price'];
            $quantity = $row['qty'];
            $image_name = $row['image_name'];
            $product_id = $row['product_id'];
            $price = number_format($product_price, 2);
            $base_amount = substr($price, 0, strpos($price, '.'));
            $point = substr($price, -2);

            // Append product details to the output
            $output .= '
                <div class="d-flex align-items-center pb-2 border-bottom">
                    <a class="d-block flex-shrink-0" href="shop-single-v1.html">
                        <img src="../retailers_admin/assets/img/products/' . $image_name . '" width="64" alt="Product">
                    </a>
                    <div class="ps-2">
                        <h6 class="widget-product-title"><a href="shop-single-v1.html">' . substr($product_name, 0, 50) . '...</a></h6>
                        <div class="widget-product-meta"><span class="text-accent me-2">' . $base_amount . '<small>.' . $point . '</small></span><span class="text-muted">x ' . $quantity . '</span></div>
                    </div>
                </div>
            ';

            $total_price += ($quantity * $product_price);
            $total_taxes += $row['taxes_amt'];
            $total_discount += $row['discount_amt'];
        }

        $final_total = $total_price + $total_shipping + $total_taxes - $total_discount;

        $total = '
            <div class="py-2 px-xl-2">
                <div class="text-center mb-4 pb-3 border-bottom">
                    <h2 class="h6 mb-3 pb-1">Subtotal</h2>
                    <h3 class="fw-normal">₦ ' . number_format($total_price, 2) . '</h3>
                </div>
                <ul class="list-unstyled fs-sm pb-2 border-bottom">
                    <li class="d-flex justify-content-between align-items-center"><span class="me-2">Subtotal:</span><span class="text-end">₦ ' . number_format($total_price, 2) . '</span></li>
                    <li class="d-flex justify-content-between align-items-center"><span class="me-2">Shipping:</span><span class="text-end" id="shipping_amount">₦ ' . number_format($total_shipping, 2) . '</span></li>
                    <li class="d-flex justify-content-between align-items-center"><span class="me-2">Taxes:</span><span class="text-end" id="tax_amount">₦ ' . number_format($total_taxes, 2) . '</span></li>
                    <li class="d-flex justify-content-between align-items-center"><span class="me-2">Discount:</span><span class="text-end text-danger" id="discount_amount">-₦ ' . number_format($total_discount, 2) . '</span></li>
                </ul>
                <h2 class="fw-normal text-center my-4">₦ ' . number_format($final_total, 2) . '</h2>
            </div>
        ';
    } else {
        $error = 'Your Cart is Empty!';
    }
} catch (PDOException $e) {
    $error = $e->getMessage();
}

$data = array(
    'order_summary' => $output,
    'order_summary_bottom' => $total,
    'final_total' => $final_total,  // Add this line
    'error' => $error
);
echo json_encode($data);
?>