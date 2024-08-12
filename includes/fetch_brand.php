<?php
include_once('connect.php');
$output = '';

try {
    $stmt = $con->prepare("SELECT * FROM product_brand GROUP BY brand_name");
    $stmt->execute();
    $brandRows = $stmt->fetchAll();

    if (!empty($brandRows)) {
        $output .= '<h3 class="widget-title">Brand</h3>
        <div class="input-group input-group-sm mb-2">
          <input class="brand-widget widget-filter-search form-control rounded-end pe-5" type="text" placeholder="Search"><i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
        </div>
        <ul class="brand-list widget-list widget-filter-list list-unstyled pt-1" style="max-height: 11rem;" data-simplebar data-simplebar-auto-hide="false">';

        foreach ($brandRows as $brandRow) {
            $stmts = $con->prepare("SELECT count(*) as counts FROM products p LEFT JOIN product_brand pb ON p.brand_id=pb.brand_id WHERE pb.brand_id=:brand_id GROUP BY p.brand_id");
            $stmts->bindParam(':brand_id', $brandRow["brand_id"]);
            $stmts->execute();
            $countRow = $stmts->fetch();

            $subcategories = explode(',', $brandRow['subcategories']);
            $subcategory_count = count($subcategories);

            $output .= '
                  <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="' . $brandRow["brand_name"] . '">
                      <label class="brand-label form-check-label widget-filter-item-text" for="' . $brandRow["brand_name"] . '">' . $brandRow["brand_name"] . '</label>
                    </div><span class="fs-xs text-muted">' . ($countRow["counts"] == "" ? 0 : $countRow["counts"]) . '</span>
                  </li>';
        }

        $output .= '</ul>';

    } else {
        $output .= '<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
                        <h3>No product uploaded</h3>
                    </div>';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo json_encode($output);
// echo json_encode(array('output' => $output));
?>
