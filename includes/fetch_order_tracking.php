<?php
include_once('connect.php');
$output = array();

if (isset($_SESSION['user_id'])) {
    $product_id = $_GET['product_id'];
    $order_code = $_GET['order_code'];
    try {
        $stmt = $con->prepare("SELECT * FROM store_orders WHERE (product_id= :product_id AND order_code=:order_code) AND (user_id = :userid AND pay_status=1)");
        $stmt->bindParam(':product_id', $product_id);
        $stmt->bindParam(':order_code', $order_code);
        $stmt->bindParam(':userid', $_SESSION['user_id']);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            if($row['packag_status']==0){
                $output['order_tracking_head']='<div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Shipped via:</span>UPS Ground</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Status:</span>Processing order</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Expected date:</span>October 15, 2019</div>
              </div>';
                $output["order_tracking"] = '<ul class="nav nav-tabs media-tabs nav-justified">
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-bag"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">First step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Order placed</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link active">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-settings"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Second step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Processing order</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-star"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Third step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Quality check</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-package"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Fourth step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Product dispatched</h6>
                  </div>
                </div>
              </div>
            </li>
          </ul>';
            }else if($row['packag_status']==1){
                $output['order_tracking_head']='<div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Shipped via:</span>UPS Ground</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Status:</span>Quality check</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Expected date:</span>October 15, 2019</div>
              </div>';
                $output["order_tracking"] = '<ul class="nav nav-tabs media-tabs nav-justified">
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-bag"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">First step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Order placed</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-settings"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Second step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Processing order</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link active">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-star"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Third step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Quality check</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-package"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Fourth step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Product dispatched</h6>
                  </div>
                </div>
              </div>
            </li>
          </ul>';
            }else if($row['packag_status']==2){
                $output['order_tracking_head']='<div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Shipped via:</span>UPS Ground</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Status:</span>Product Dispatched</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Expected date:</span>October 15, 2019</div>
              </div>';
                $output["order_tracking"] = '<ul class="nav nav-tabs media-tabs nav-justified">
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-bag"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">First step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Order placed</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-settings"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Second step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Processing order</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-star"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Third step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Quality check</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link active">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-package"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Fourth step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Product dispatched</h6>
                  </div>
                </div>
              </div>
            </li>
          </ul>';
            }else if($row['packag_status']==3){
                $output['order_tracking_head']='<div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Shipped via:</span>UPS Ground</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Status:</span>Order Delivered</div>
              </div>
              <div class="col-md-4 mb-2">
                <div class="bg-secondary h-100 p-4 text-center rounded-3"><span class="fw-medium text-dark me-2">Expected date:</span>October 15, 2019</div>
              </div>';
                $output["order_tracking"] = '<ul class="nav nav-tabs media-tabs nav-justified">
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-bag"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">First step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Order placed</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-settings"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Second step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Processing order</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-star"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Third step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Quality check</h6>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <div class="nav-link completed">
                <div class="d-flex align-items-center">
                  <div class="media-tab-media"><i class="ci-package"></i></div>
                  <div class="ps-3">
                    <div class="media-tab-subtitle text-muted fs-xs mb-1">Fourth step</div>
                    <h6 class="media-tab-title text-nowrap mb-0">Product dispatched</h6>
                  </div>
                </div>
              </div>
            </li>
          </ul>';
            }
            
            $output["order_number"] = $row['order_code']; // or any default value
      
        } else {
            $output["order_tracking"] = "<h3 class='text-center'>Order couldn't be fetched</h3>"; // or any default value
            // echo "empty";
        }
       
        

    }
    catch (PDOException $e) {
        $output["error"] = "There is some problem in connection: " . $e->getMessage();
    }
} else {
    $output["username"] = "Hello, Sign in";
}

echo json_encode($output);
?>