<?php
include_once('connect.php');
$output = '';
$alreadyDisplayed = [];

// Check if there are already displayed products in the session
if (isset($_SESSION['alreadyDisplayed'])) {
  $alreadyDisplayed = $_SESSION['alreadyDisplayed'];
}
$rand = random_int(1, 50);
try {
  $prodcodes = empty($alreadyDisplayed) ? $rand : implode(',', $alreadyDisplayed);
  $sql = "SELECT * FROM products 
            INNER JOIN category ON products.category_id = category.categ_id 
            INNER JOIN product_brand ON products.brand_id = product_brand.brand_id 
            LEFT JOIN product_img ON product_img.product_id = products.prodcode 
            WHERE products.stock > 0 AND (products.prodcode NOT IN ($prodcodes))
            ORDER BY RAND(), date_view DESC, products.id DESC, add_date DESC LIMIT 20";
          
  $stmt = $con->prepare($sql);
  $stmt->execute();
  $result = $stmt->fetchAll();
  foreach ($result as $row) {
    $alreadyDisplayed[] = $row['prodcode'];
    $image_preview = ($row !== '') ? $row['image_name'] : '';
    if (date('m', strtotime($row['add_date'])) == date('m')) {
      $product_status = '<span class="badge bg-success badge-shadow">New</span>';
    } elseif (date('d', strtotime($row['date_view'])) == date('d')) {
      $product_status = '<span class="badge bg-danger badge-shadow">Sale</span>';
    } else {
      $product_status = '';
    }
    // <del class="fs-sm text-muted">38.<small>50</small></del> (striked price)
    $output .= '
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
        <div class="card product-card">' . $product_status . '
          <div class="product-card-actions d-flex align-items-center"><a class="btn-action nav-link-style me-2 btn_compare" href="#" id="' . $row['prodcode'] . '"><i class="ci-compare me-1"></i>Compare</a>
            <button class="btn-wishlist btn-sm btn_add_wishlist" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist" id="' . $row['prodcode'] . '"><i class="ci-heart"></i></button>
          </div><a class="card-img-top d-block overflow-hidden" href="shop-single-v2.html"><img src="../retailers_admin/assets/img/products/' . $image_preview . '" alt="Product"></a>
          <div class="card-body py-2"><a class="product-meta d-block fs-xs pb-1" href="#">' . $row['category_name'] . '</a>
            <h3 class="product-title fs-sm"><a href="shop-single-v2.html">' . substr($row['name'], 0, 50) . '...</a></h3>
            <div class="d-flex justify-content-between">
              <div class="product-price"><span class="text-accent">₦' . number_format($row['cost_price']) . '.<small>00</small></span></div>
              <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
              </div>
            </div>
          </div>
          <div class="card-body card-body-hidden">
            <a href="#" class="btn btn-primary btn-sm d-block w-100 mb-2 btn_add_cart" id="' . $row['prodcode'] . '"><i class="ci-cart fs-sm me-1"></i>Add to Cart</a>
            <div class="text-center"><a class="nav-link-style fs-ms btn_view" href="#" id="' . $row['prodcode'] . '"><i class="ci-eye align-middle me-1"></i>Quick view</a></div>
          </div>
        </div>
        <hr class="d-sm-none">
      </div>
		';
  }
  $_SESSION['alreadyDisplayed'] = $alreadyDisplayed;

  if (empty($result)) {
    $output .= 'no';
  }
} catch (PDOException $e) {
  $output .= $e->getMessage();
}
echo $output;
// return json_encode($output);
