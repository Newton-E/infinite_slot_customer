<?php
error_reporting(0);
include_once('connect.php');
$output = '';

try {
    // AND MONTH(add_date) = MONTH(CURDATE()) WHERE products.stock > 0
	$stmt = $con->prepare("SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id ORDER BY date_view ASC LIMIT 8");
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach ($result as $row) {
            $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
            $stmt->execute(['productID'=>$row['prodcode']]);
            $image_row = $stmt->fetch();
            $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';
       
        $output .= '
        <div class="tns-item tns-slide-cloned" aria-hidden="true" tabindex="-1">
            <div class="card product-card card-static">
                <button class="btn-wishlist btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist"><i class="ci-heart"></i></button>
                <a class="card-img-top d-block overflow-hidden" href="product-details.php?product_id=' . $row['prodcode'] . '">
                <img src="../retailers_admin/assets/img/products/'.$image_preview.'" alt="Product">
                </a>
                <div class="card-body py-2">
                    <a class="product-meta d-block fs-xs pb-1" href="#">' . substr($row['name'], 0, 50) . '</a>
                    <h3 class="product-title fs-sm"><a href="product-details.php?product_id=' . $row['prodcode'] . '">' . $row['name'] . '</a></h3>
                    <div class="d-flex justify-content-between">
                        <div class="product-price">
                            <span class="text-accent">$' . number_format($row['cost_price'], 2) . '</span>
                        </div>
                        <div class="star-rating"> // You may fetch and display the star rating here.
        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        ';
    }
    
    if (empty($result)) {
        $output .= '<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4"><h3>No products uploaded</h3></div>';
    }
    
    // Instead of encoding as JSON, directly echo the HTML content
    echo $output;
} catch (PDOException $e) {
    $output .= $e->getMessage();
    echo $output; // Output any error messages
}
?>

<!-- //     <div class="card product-card product-list">'.$product_status.'
    //     <button class="btn-wishlist btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist"><i class="ci-heart"></i></button>
    //     <div class="d-sm-flex align-items-center"><a class="product-list-thumb" href="shop-single.php?product='.$row['prodcode'].'"><img src="img/shop/catalog/'.$row['image_name'].'" alt="Product"></a>
    //       <div class="card-body py-2"><a class="product-meta d-block fs-xs pb-1" href="#">'.$row['category_name'].'</a>
    //         <h3 class="product-title fs-base"><a href="shop-single.php?product='.$row['prodcode'].'">'.substr($row['name'], 0, 50).'</a></h3>
    //         <div class="d-flex justify-content-between">
    //           <div class="product-price"><span class="text-accent">'.number_format($row['cost_price'], 2).'</span></div>
    //           <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
    //           </div>
    //         </div>
    //         <div class="card-body card-body-hidden">
    //           <button class="btn btn-primary btn-sm mb-2 btn_add_cart" type="button" id="'.$row['prodcode'].'"><i class="ci-cart fs-sm me-1"></i>Add to Cart</button>
    //           <div class="text-start"><a class="nav-link-style fs-ms" href="#quick-view" data-bs-toggle="modal"><i class="ci-eye align-middle me-1"></i>Quick view</a></div>
    //         </div>
    //       </div>
    //     </div>
    //   </div>
    //   <div class="border-top pt-3 mt-3"></div> -->