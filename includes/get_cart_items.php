<?php
include_once('connect.php');
$output = '';
$total='';
$error='';
try {

            // Fetch product details from the database using $product_id
            $stmt = $con->prepare("SELECT * FROM `store_orders`so INNER JOIN products pr ON pr.prodcode=so.product_id LEFT JOIN product_brand pb ON pr.brand_id=pb.brand_id INNER JOIN product_img pi ON pr.prodcode=pi.product_id where so.user_id=:user_id GROUP BY so.product_id");
            $stmt->bindParam(':user_id', $_SESSION['user_id']);
            $stmt->execute();
            $product = $stmt->fetchAll();
            // var_dump($product);
            if ($product) {
                foreach($product as $row){
                $product_name = $row['name'];
                $product_price = $row['cost_price'];
                $product_brand = $row['brand_name'];
                $quantity = $row['qty'];
                $image_name = $row['image_name'];
                $product_id = $row['product_id'];
                $price = number_format($product_price, 2);
                $base_amount = substr($price, 0, strpos($price,'.'));
                $point = substr($price, -2);

                // Append product details to the output
                $output .= '
                    <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
                    <input type="checkbox" data-item-id="'.$product_id.'" data-item-amount="'.$product_price.'" data-item-qty="'.$quantity.'" data-item-image="img/shop/cart/'.$image_name.'" />
              <div class="d-block d-sm-flex align-items-center text-center text-sm-start"><a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single-v1.html"><img src="img/shop/cart/'.$image_name.'" width="160" alt="Product"></a>
                <div class="pt-2">
                  <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">' . substr($product_name, 0, 50) . '...</a></h3>
                  <div class="fs-sm"><span class="text-muted me-2">Brand:</span>'.$product_brand.'</div>
                  <div class="fs-lg text-accent pt-2">₦' . $base_amount . '<small>.'.$point.'</small></div>
                </div>
              </div>
              <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                <label class="form-label" for="quantity1">Quantity</label>
                <input class="form-control" type="number" id="quantity1" min="1" data-item-id="'.$product_id.'" value="'.$quantity.'">
                <button class="btn btn-link px-0 text-danger" data-item-id="'.$product_id.'" id="remove_cart_item" type="button"><i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span></button>
              </div>
            </div>
                ';
    
                $total_price += ($quantity * $product_price);
                $total_item++;
                }
            }
        
        
        if (empty($product)) {
            // $output = '<h3>Your Cart is Empty!</h3>';
            $erro= 'empty';
        }
    
        $total = '
        <div class="py-2 px-xl-2">
        <div class="text-center mb-4 pb-3 border-bottom">
          <h2 class="h6 mb-3 pb-1">Subtotal</h2>
          <h3 class="fw-normal">'.number_format($total_price).'.<small>'.substr(number_format($total_price,2), -2).'</small></h3>
        </div>
        <div class="mb-3 mb-4">
          <label class="form-label mb-3" for="order-comments"><span class="badge bg-info fs-xs me-2">Note</span><span class="fw-medium">Additional comments</span></label>
          <textarea class="form-control" rows="6" id="order-comments"></textarea>
        </div>
        <div class="accordion" id="order-options">
          <div class="accordion-item">
            <h3 class="accordion-header"><a class="accordion-button" href="#promo-code" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="promo-code">Apply promo code</a></h3>
            <div class="accordion-collapse collapse show" id="promo-code" data-bs-parent="#order-options">
              <form class="accordion-body needs-validation" method="post" novalidate>
                <div class="mb-3">
                  <input class="form-control" type="text" placeholder="Promo code" required>
                  <div class="invalid-feedback">Please provide promo code.</div>
                </div>
                <button class="btn btn-outline-primary d-block w-100" type="submit">Apply promo code</button>
              </form>
            </div>
          </div>
          <div class="accordion-item">
            <h3 class="accordion-header"><a class="accordion-button collapsed" href="#shipping-estimates" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="shipping-estimates">Shipping estimates</a></h3>
            <div class="accordion-collapse collapse" id="shipping-estimates" data-bs-parent="#order-options">
              <div class="accordion-body">
                <form class="needs-validation" novalidate>
                  <div class="mb-3">
                    <select class="form-select" required>
                      <option value="">Choose your country</option>
                      <option value="Australia">Australia</option>
                      <option value="Belgium">Belgium</option>
                      <option value="Canada">Canada</option>
                      <option value="Finland">Finland</option>
                      <option value="Mexico">Mexico</option>
                      <option value="New Zealand">New Zealand</option>
                      <option value="Switzerland">Switzerland</option>
                      <option value="United States">United States</option>
                    </select>
                    <div class="invalid-feedback">Please choose your country!</div>
                  </div>
                  <div class="mb-3">
                    <select class="form-select" required>
                      <option value="">Choose your city</option>
                      <option value="Bern">Bern</option>
                      <option value="Brussels">Brussels</option>
                      <option value="Canberra">Canberra</option>
                      <option value="Helsinki">Helsinki</option>
                      <option value="Mexico City">Mexico City</option>
                      <option value="Ottawa">Ottawa</option>
                      <option value="Washington D.C.">Washington D.C.</option>
                      <option value="Wellington">Wellington</option>
                    </select>
                    <div class="invalid-feedback">Please choose your city!</div>
                  </div>
                  <div class="mb-3">
                    <input class="form-control" type="text" placeholder="ZIP / Postal code" required>
                    <div class="invalid-feedback">Please provide a valid zip!</div>
                  </div>
                  <button class="btn btn-outline-primary d-block w-100" type="submit">Calculate shipping</button>
                </form>
              </div>
            </div>
          </div>
        </div><a class="btn btn-primary btn-shadow d-block w-100 mt-4" href="checkout-details.html"><i class="ci-card fs-lg me-2"></i>Proceed to Checkout</a>
      </div>
        ';
        
} catch (PDOException $e) {
    // $output['error'] = $e->getMessage();
    $erro= $e->getMessage();
}

$data = array(
  'cart_details' => $output,
  'total_price' => $total,
  'error' => $erro
);
echo json_encode($data);