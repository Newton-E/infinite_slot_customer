<?php
include_once('connect.php');
$output = '';
if (isset($_POST['criteria'])) {
    $criteria = $_POST['criteria'];
    switch($criteria){
        case "popular":
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY view_counter DESC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
        case "price_low":
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY cost_price ASC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
        case "price_high":
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY cost_price DESC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
        case "rating":
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY RAND(), date_view ASC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
        case "alphabet_az":
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY name ASC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
        case "alphabet_za":
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY name DESC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
        default:
            $sql = "SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id LEFT JOIN product_img ON product_img.product_id=products.prodcode WHERE products.stock>0 ORDER BY RAND(), date_view ASC LIMIT 9";
            $stmt = $con->prepare($sql);
            exit;
    }
    try {
        
        $stmt->execute();
        $result = $stmt->fetchAll();
        foreach ($result as $row) {
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
            <div class="card product-card product-list">'.$product_status.'
            <button class="btn-wishlist btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist"><i class="ci-heart"></i></button>
            <div class="d-sm-flex align-items-center"><a class="product-list-thumb" href="shop-single-v1.html"><img src="img/shop/catalog/'.$row['image_name'].'" alt="Product"></a>
              <div class="card-body py-2"><a class="product-meta d-block fs-xs pb-1" href="#">'.$row['category_name'].'</a>
                <h3 class="product-title fs-base"><a href="shop-single-v1.html">'.substr($row['name'], 0, 50).'</a></h3>
                <div class="d-flex justify-content-between">
                  <div class="product-price"><span class="text-accent">'.number_format($row['cost_price']).'.<small>00</small></span></div>
                  <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
                  </div>
                </div>
                <div class="card-body card-body-hidden">
                  <button class="btn btn-primary btn-sm mb-2" type="button"><i class="ci-cart fs-sm me-1"></i>Add to Cart</button>
                  <div class="text-start"><a class="nav-link-style fs-ms" href="#quick-view" data-bs-toggle="modal"><i class="ci-eye align-middle me-1"></i>Quick view</a></div>
                </div>
              </div>
            </div>
          </div>
          <div class="border-top pt-3 mt-3"></div>
		';
        }

        if (empty($result)) {
            $output .= '
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
        <h3>No product uploaded</h3>
      </div>
    ';
        }
    } catch (PDOException $e) {
        $output .= $e->getMessage();
    }
    echo $output;
    // return json_encode($output);
}
