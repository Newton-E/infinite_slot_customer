<?php
include_once('connect.php');
$output = '';

try {

    $sql ="SELECT * FROM tbl_wishlist wl INNER JOIN products pro ON wl.product_id=pro.prodcode INNER JOIN product_brand pb ON pb.brand_id=pro.brand_id INNER JOIN product_img pi ON pi.product_id=pro.prodcode WHERE wl.user_id=:user_id GROUP BY pro.name";
    $stmt = $con->prepare($sql);
    $stmt->bindParam(':user_id',$_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach ($result as $row) {
  

        $output .= '
        <div class="d-sm-flex justify-content-between mt-lg-4 mb-4 pb-3 pb-sm-2 border-bottom">
        <div class="d-block d-sm-flex align-items-start text-center text-sm-start"><a class="d-block flex-shrink-0 mx-auto me-sm-4" href="shop-single-v1.html" style="width: 10rem;"><img src="img/shop/cart/'.$row['image_name'].'" alt="Product"></a>
          <div class="pt-2">
            <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">'.$row['name'].'</a></h3>
            <div class="fs-sm"><span class="text-muted me-2">Brand:</span>'.$row['brand_name'].'</div>
            <div class="fs-lg text-accent pt-2">'.$row['cost_price'].'.<small>50</small></div>
          </div>
        </div>
        <div class="pt-2 ps-sm-3 mx-auto mx-sm-0 text-center">
          <button class="btn btn-outline-danger btn-sm" type="button" id="remove_wishlist" data-prod-id="'.$row['prodcode'].'"><i class="ci-trash me-2"></i>Remove</button>
        </div>
      </div>
		';
    }
    if (empty($result)) {
        $output .= '
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
        <h3>No product added to wishlist</h3>
      </div>
    ';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
