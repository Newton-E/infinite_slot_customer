<?php
include_once('connect.php');
$total_price = 0;
$total_item = 0;
$output = '';

if (!empty($_SESSION["user_id"])) {
    $sql = "SELECT * FROM products LEFT JOIN category ON products.category_id = category.categ_id 
    LEFT JOIN product_brand ON products.brand_id = product_brand.brand_id
    LEFT JOIN store_orders ON products.prodcode = store_orders.product_id
    WHERE store_orders.user_id = :userid AND store_orders.pay_status <= 1";
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
        <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
            <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single.php?product='.$row['prodcode'].'">
                    <img src="../retailers_admin/assets/img/products/' . $image_preview . '" width="160" alt="Product img">
                </a>
                <div class="pt-2">
                    <h3 class="product-title fs-base mb-2">
                        <a href="shop-single.php?product='.$row['prodcode'].'">' . substr($row["name"], 0, 25) . '...</a>
                    </h3>
                    <div class="fs-sm"><span class="text-muted me-2">Category:</span>' . $row["cat_slug"] . '</div>
                    <div class="fs-sm"><span class="text-muted me-2">Brand:</span>White &amp; ' . $row["brand_name"] . '</div>
                    <div class="fs-lg text-accent pt-2">₦' . number_format($row["cost_price"], 2) . '</div>
                </div>
            </div>
            <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                <label class="form-label" for="quantity1">Quantity</label>
                <input class="form-control txt_update_qty" type="number" id="'.$row['prodcode'].'" min="1" value="' . $row["qty"] . '">
                <button class="btn btn-link px-0 text-danger btn_remove_cart" type="button" id="'.$row['prodcode'].'">
                    <i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span>
                </button>
            </div>
        </div>';

        $total_price += ($row["qty"] * $row["cost_price"]);
        $total_item++;
    }

    if (empty($result)) {
        $output .= '<div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
        <h3>Your Cart is Empty!</h3>
        </div>';
    }
} else {
    $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();

    foreach ($cart as $cart_item) {
        $product_id = $cart_item['product_id'];
        $quantity = $cart_item['qty'];

        // Fetch product details from the database using $product_id
        $stmt = $con->prepare("SELECT * FROM products LEFT JOIN category ON products.category_id = category.categ_id LEFT JOIN product_brand ON products.brand_id = product_brand.brand_id WHERE products.prodcode = :product_id");
        $stmt->bindParam(':product_id', $product_id);
        $stmt->execute();
        $product = $stmt->fetch();

        if ($product) {
            $product_name = $product['name'];
            $product_price = $product['cost_price'];
            $product_category = $product['cat_slug'];
            $product_brand = $product['brand_name'];

            $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
            $stmt->execute(['productID' => $product_id]);
            $image_row = $stmt->fetch();
            $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';

            // Append product details to the output
            $output .= '
            <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
                <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                    <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single.php?product='.$product_id.'">
                        <img src="../retailers_admin/assets/img/products/' . $image_preview . '" width="160" alt="Product img">
                    </a>
                    <div class="pt-2">
                        <h3 class="product-title fs-base mb-2">
                            <a href="shop-single.php?product='.$product_id.'">' . substr($product_name, 0, 25) . '...</a>
                        </h3>
                        <div class="fs-sm"><span class="text-muted me-2">Category:</span>' . $product_category . '</div>
                        <div class="fs-sm"><span class="text-muted me-2">Brand:</span>White &amp; ' . $product_brand . '</div>
                        <div class="fs-lg text-accent pt-2">₦' . number_format($product_price, 2) .'</div>
                    </div>
                </div>
                <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                    <label class="form-label" for="quantity1">Quantity</label>
                    <input class="form-control txt_update_qty" type="number" id="quantity1_' . $product_id . '" min="1" value="' . $quantity . '">
                    <button class="btn btn-link px-0 text-danger btn_remove_cart" type="button" id="remove_'.$product_id.'">
                        <i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span>
                    </button>
                </div>
            </div>';

            $total_price += ($quantity * $product_price);
            $total_item++;
        }
    }

    if (empty($cart)) {
        $output .= '<div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
        <h3>Your Cart is Empty!</h3>
        </div>';
    }
}

$data = array(
    'cart_details' => $output,
    'total_price' => $total_price,
    'total_item' => $total_item
);

echo json_encode($data);
?>