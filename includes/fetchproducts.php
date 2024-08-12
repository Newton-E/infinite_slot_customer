<?php
include_once('connect.php');
$output = '';
try{
    // AND MONTH(add_date) = MONTH(CURDATE()) WHERE products.stock > 0
	$stmt = $con->prepare("SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id ORDER BY RAND(), id DESC, add_date DESC LIMIT 70");
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){

    $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
    $stmt->execute(['productID'=>$row['prodcode']]);
    $image_row = $stmt->fetch();
    $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';
    // $img_id = ($image_row !== false) ? $image_row['product_id'] : '';
    if (date('m', strtotime($row['add_date'])) == date('m')) {
        $product_status = '<span class="badge bg-success badge-shadow">New</span>';
    } elseif (date('d', strtotime($row['date_view'])) == date('d')) {
        $product_status = '<span class="badge bg-danger badge-shadow">Sale</span>';
    } else {
        $product_status = '';
    }
    
    $output .= '
    <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
    <div class="card product-card">'.$product_status.'
      <div class="product-card-actions d-flex align-items-center"><a class="btn-action nav-link-style me-2 btn_compare" href="#" id="'.$row['prodcode'].'"><i class="ci-compare me-1"></i>Compare</a>
        <button class="btn-wishlist btn-sm btn_add_wishlist" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist" id="'.$row['prodcode'].'"><i class="ci-heart"></i></button>
      </div><a class="card-img-top d-block overflow-hidden" href="shop-single.php?product='.$row['prodcode'].'"><img src="../retailers_admin/assets/img/products/'.$image_preview.'" alt="Product"></a>
      <div class="card-body py-2"><a class="product-meta d-block fs-xs pb-1" href="#">'.$row['category_name'].'</a>
        <h3 class="product-title fs-sm"><a href="shop-single.php?product='.$row['prodcode'].'">'.substr($row['name'], 0, 50).'...</a></h3>
        <div class="d-flex justify-content-between">
          <div class="product-price"><span class="text-accent">₦'.number_format($row['cost_price']).'.<small>00</small></span></div>
          <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
          </div>
        </div>
      </div>
      <div class="card-body card-body-hidden">
        <a href="#" class="btn btn-primary btn-sm d-block w-100 mb-2 btn_add_cart_qty" id="'.$row['prodcode'].'"><i class="ci-cart fs-sm me-1"></i>Add to Cart</a>
        <div class="text-center"><a class="nav-link-style fs-ms btn_view" href="#" id="'.$row['prodcode'].'"><i class="ci-eye align-middle me-1"></i>Quick view</a></div>
      </div>
    </div>
    <hr class="d-sm-none">
  </div>
		';

	}
	if(empty($result))
	{
		$output .= '
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
        <h3>No product uploaded</h3>
      </div>
    ';
	}
}
catch(PDOException $e){
	$output .= $e->getMessage();
}

echo json_encode($output);
?>