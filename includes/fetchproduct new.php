<link
      rel="stylesheet"
      media="screen"
      href="../vendor/simplebar/dist/simplebar.min.css"
    />
    <link
      rel="stylesheet"
      media="screen"
      href="../vendor/tiny-slider/dist/tiny-slider.css"
    />
    <link
      rel="stylesheet"
      media="screen"
      href="../vendor/drift-zoom/dist/drift-basic.min.css"
    />
    <link
      rel="stylesheet"
      media="screen"
      href="../vendor/lightgallery.js/dist/css/lightgallery.min.html"
    />
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="../css/theme.min.css" />
<?php
include_once('connect.php');
$output = '';
// fetch products
try{
    // AND MONTH(add_date) = MONTH(CURDATE()) WHERE products.stock > 0
	$sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode ORDER BY date_view ASC LIMIT 1";
    $stmt = $con->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){
    // // $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
    // // $stmt->execute(['productID'=>$row['prodcode']]);
    // // $image_row = $stmt->fetch();
    $image_preview = ($row['image_name'] !== '') ? $row['image_name'] : '';
    // $img_id = ($image_row !== false) ? $image_row['product_id'] : '';
    if (date('m', strtotime($row['add_date'])) == date('m')) {
        $product_status = '<span class="badge bg-success badge-shadow">New</span>';
    } elseif (date('d', strtotime($row['date_view'])) == date('d')) {
        $product_status = '<span class="badge bg-danger badge-shadow">Sale</span>';
    } else {
        $product_status = '';
    }
    var_dump($row);
    
    
    $output .='<div class="card product-card">
    <div class="product-card-actions d-flex align-items-center">
      <a class="btn-action nav-link-style me-2" href="#"
        ><i class="ci-compare me-1"></i>Compare</a
      >
      <button
        class="btn-wishlist btn-sm"
        type="button"
        data-bs-toggle="tooltip"
        data-bs-placement="left"
        title="Add to wishlist"
      >
        <i class="ci-heart"></i>
      </button>
    </div>
    <a
      class="card-img-top d-block overflow-hidden"
      href="shop-single-v2.html"
      ><img src="../img/shop/catalog/01.jpg" alt="Product"
    /></a>
    <div class="card-body py-2">
      <a class="product-meta d-block fs-xs pb-1" href="#"
        >'.$row['category_name'].'</a
      >
      <h3 class="product-title fs-sm">
        <a href="shop-single-v2.html"
          >'.$row['name'].'</a
        >
      </h3>
      <div class="d-flex justify-content-between">
        <div class="product-price">
          <span class="text-accent">$198.<small>00</small></span>
        </div>
        <div class="star-rating">
          <i class="star-rating-icon ci-star-filled active"></i
          ><i class="star-rating-icon ci-star-filled active"></i
          ><i class="star-rating-icon ci-star-filled active"></i
          ><i class="star-rating-icon ci-star-filled active"></i
          ><i class="star-rating-icon ci-star-filled active"></i>
        </div>
      </div>
    </div>
    <div class="card-body card-body-hidden">
      <button
        class="btn btn-primary btn-sm d-block w-100 mb-2"
        type="button"
      >
        <i class="ci-cart fs-sm me-1"></i>Add to Cart
      </button>
      <div class="text-center">
        <a
          class="nav-link-style fs-ms"
          href="#quick-view-electro"
          data-bs-toggle="modal"
          ><i class="ci-eye align-middle me-1"></i>Quick view</a
        >
      </div>
    </div>
  </div>';
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
echo $output;
// echo json_encode($output);
?>

<script src="../vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="../vendor/tiny-slider/dist/min/tiny-slider.js"></script>
    <script src="../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="../vendor/drift-zoom/dist/Drift.min.js"></script>
    <script src="../vendor/lightgallery.js/dist/js/lightgallery.min.html"></script>
    <script src="../vendor/lg-video.js/dist/lg-video.min.html"></script>
    <!-- Main theme script-->
    <script src="../js/theme.min.js"></script>