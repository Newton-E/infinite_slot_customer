<?php
include_once('connect.php');
$total_price = 0;
$total_item = 0;

$output = '<div style="height: 15rem;" data-simplebar data-simplebar-auto-hide="false">';
if (!empty($_SESSION["user_id"])) {
    $sql = "SELECT *, store_orders.product_id AS shopid FROM store_orders 
    LEFT JOIN products ON products.prodcode = store_orders.product_id 
    WHERE store_orders.user_id = :userid";
    $statement = $con->prepare($sql);
    $statement->execute([
        ':userid' => $_SESSION["user_id"]
    ]);
    $result = $statement->fetchAll();

    $output = '';
    $total_price = 0;
    $total_item = 0;

    foreach ($result as $row) {
        $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
        $stmt->execute(['productID' => $row["product_id"]]);
        $image_row = $stmt->fetch();
        $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';

        $output .= '
            <div class="widget-cart-item pb-2 border-bottom">
                <button class="btn-close text-danger btn_remove" id="'.$row['prodcode'].'" type="button" aria-label="Remove"><span aria-hidden="true">&times;</span></button>
                <div class="d-flex align-items-center">
                    <a class="d-block flex-shrink-0" href="shop-single.php?product='.$row['prodcode'].'">
                        <img src="../retailers_admin/assets/img/products/' . $image_preview . '" width="64" alt="Product">
                    </a>
                    <div class="ps-2">
                        <h6 class="widget-product-title"><a href="href="shop-single.php?product='.$row['prodcode'].'"">' . substr($row["name"], 0, 25) . '...</a></h6>
                        <div class="widget-product-meta">
                            <span class="text-accent me-2">₦' . number_format($row["cost_price"], 2) . '</span>
                            <span class="text-muted">x ' . $row["qty"] . '</span>
                        </div>
                    </div>
                </div>
            </div>
        ';

        $total_price += ($row["qty"] * $row["cost_price"]);
        $total_item++;
    }

    if (empty($result)) {
        $output .= '<h3>Your Cart is Empty!</h3>';
    }

    $output .= '
        <div class="d-flex flex-wrap justify-content-between align-items-center py-3">
            <div class="fs-sm me-2 py-2">
                <span class="text-muted">Subtotal:</span>
                <span class="text-accent fs-base ms-1">₦ ' . number_format($total_price, 2) . '</span>
            </div>
            <a class="btn btn-outline-secondary btn-sm" href="shop-cart.php">Expand cart<i class="ci-arrow-right ms-1 me-n1"></i></a>
        </div>
        <a class="btn btn-primary btn-sm d-block w-100" href="checkout-details.php">
            <i class="ci-card me-2 fs-base align-middle"></i>Checkout
        </a>
    ';
} else {
    $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();

    foreach ($cart as $cart_item) {
        $product_id = $cart_item['product_id'];
        $quantity = $cart_item['qty'];

        // Fetch product details from the database using $product_id
        $stmt = $con->prepare("SELECT cost_price, name FROM products WHERE prodcode = :product_id");
        $stmt->bindParam(':product_id', $product_id);
        $stmt->execute();
        $product = $stmt->fetch();

        if ($product) {
            $product_name = $product['name'];
            $product_price = $product['cost_price'];

            $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
            $stmt->execute(['productID' => $product_id]);
            $image_row = $stmt->fetch();
            $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';

            // Append product details to the output
            $output .= '
                <div class="widget-cart-item pb-2 border-bottom">
                    <button class="btn-close text-danger" type="button" aria-label="Remove"><span aria-hidden="true">&times;</span></button>
                    <div class="d-flex align-items-center">
                        <a class="d-block flex-shrink-0" href="shop-single.php?product='.$product_id.'">
                            <img src="../retailers_admin/assets/img/products/' . $image_preview . '" width="64" alt="Product">
                        </a>
                        <div class="ps-2">
                            <h6 class="widget-product-title"><a href="shop-single.php?product='.$product_id.'">' . substr($product_name, 0, 25) . '...</a></h6>
                            <div class="widget-product-meta">
                                <span class="text-accent me-2">₦' . number_format($product_price, 2) . '</span>
                                <span class="text-muted">x ' . $quantity . '</span>
                            </div>
                        </div>
                    </div>
                </div>
            ';

            $total_price += ($quantity * $product_price);
            $total_item++;
        }
    }

    if (empty($cart)) {
        $output .= '<h3>Your Cart is Empty!</h3>';
    }

    $output .= '
        <div class="d-flex flex-wrap justify-content-between align-items-center py-3">
            <div class="fs-sm me-2 py-2">
                <span class="text-muted">Subtotal:</span>
                <span class="text-accent fs-base ms-1">₦ ' . number_format($total_price, 2) . '</span>
            </div>
            <a class="btn btn-outline-secondary btn-sm" href="shop-cart.php">Expand cart<i class="ci-arrow-right ms-1 me-n1"></i></a>
        </div>
        <a class="btn btn-primary btn-sm d-block w-100" href="checkout-details.php">
            <i class="ci-card me-2 fs-base align-middle"></i>Checkout
        </a>
    ';
}

$data = array(
    'cart_details' => $output,
    'total_price' => '₦' . number_format($total_price, 2),
    'total_item' => $total_item
);

echo json_encode($data);
?>