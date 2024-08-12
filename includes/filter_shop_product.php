<?php
include_once('connect.php');
$output = '';

if (isset($_POST['criteria'])) {
    $criteria = $_POST['criteria'];

    // Define common part of the SQL query
    $commonSql = "SELECT *
                 FROM products
                 INNER JOIN category ON products.category_id = category.categ_id
                 INNER JOIN product_brand ON products.brand_id = product_brand.brand_id
                 LEFT JOIN product_img ON product_img.product_id = products.prodcode
                 WHERE products.stock > 0";

    switch ($criteria) {
        case "popular":
            $sql = $commonSql . " ORDER BY products.view_counter DESC LIMIT 80";
            break;
        case "price_low":
            $sql = $commonSql . " ORDER BY products.cost_price ASC LIMIT 80";
            break;
        case "price_high":
            $sql = $commonSql . " ORDER BY products.cost_price DESC LIMIT 80";
            break;
        case "rating":
            $sql = $commonSql . " ORDER BY RAND(), date_view ASC LIMIT 80";
            break;
        case "alphabet_az":
            $sql = $commonSql . " ORDER BY products.name ASC LIMIT 80";
            break;
        case "alphabet_za":
            $sql = $commonSql . " ORDER BY products.name DESC LIMIT 80";
            break;
        default:
            $sql = $commonSql . " ORDER BY RAND(), date_view ASC LIMIT 80";
            break;
    }

    try {
        // Prepare and execute the query
        $stmt = $con->prepare($sql);
        $stmt->execute();

        // Fetch results and generate output
        $result = $stmt->fetchAll();
        foreach ($result as $row) {
            $image_preview = ($row['image_name'] !== '') ? $row['image_name'] : '';
            // ... (rest of the code)

            $output .= '
            <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
            <div class="card product-card">' . $product_status . '
              <div class="product-card-actions d-flex align-items-center"><a class="btn-action nav-link-style me-2 btn_compare" href="#" id="' . $row['prodcode'] . '"><i class="ci-compare me-1"></i>Compare</a>
                <button class="btn-wishlist btn-sm btn_add_wishlist" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist" id="' . $row['prodcode'] . '"><i class="ci-heart"></i></button>
              </div><a class="card-img-top d-block overflow-hidden" href="shop-single.php?product='.$row['prodcode'].'"><img src="../retailers_admin/assets/img/products/' . $image_preview . '" alt="Product"></a>
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
          </div>';
        }

        // Check if there are no results
        if (empty($result)) {
            $output .= '
            <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
                <h3>No product uploaded</h3>
            </div>';
        }
    } catch (PDOException $e) {
        // Handle the exception, log, or display an error message
        $output .= 'Error: ' . $e->getMessage();
    }

    // Output the generated HTML
    echo $output;
} else {
    echo "sssss";
}
