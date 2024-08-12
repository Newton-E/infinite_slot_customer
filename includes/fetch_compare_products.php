<?php
include_once('connect.php');
$output = '';

try {
    // Prepare initial query to get product IDs
    $stmt = $con->prepare("SELECT DISTINCT product_id, compareid FROM tbl_compare 
                           INNER JOIN products ON tbl_compare.product_id = products.prodcode 
                           INNER JOIN tb_users ON tb_users.userid = :user");
    $stmt->execute([':user' => $_SESSION['user_id']]);
    $result = $stmt->fetchAll();

    if (empty($result)) {
        $output = 'No products found for comparison.';
    } else {
        foreach ($result as $rows) {
            $compareid = htmlspecialchars($rows['compareid']);

            $output .= '
            <div class="table-responsive">
                <table class="table table-bordered table-layout-fixed fs-sm" style="min-width: 45rem;">
                    <thead>
                        <tr>
                            <td class="align-middle">
                                <select class="form-select compare-criteria" id="compare-criteria" data-filter-trigger>
                                </select>
                                <div class="form-text">* Choose criteria to filter table below.</div>
                                <div class="pt-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="differences">
                                        <label class="form-check-label" for="differences">Show differences only</label>
                                    </div>
                                </div>
                            </td>';

            // Fetch product profiles
            $stmt = $con->prepare("SELECT * FROM products 
                                   INNER JOIN category ON products.category_id = category.categ_id 
                                   INNER JOIN product_brand ON products.brand_id = product_brand.brand_id 
                                   WHERE products.prodcode = :product");
            $stmt->execute([':product' => $rows['product_id']]);
            $productResults = $stmt->fetchAll();

            foreach ($productResults as $row) {
                $img_stmt = $con->prepare("SELECT image_name FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
                $img_stmt->execute([':productID' => $row['prodcode']]);
                $image_row = $img_stmt->fetch();
                $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';

                $output .= '
                <td class="text-center px-4 pb-4">
                    <a class="btn btn-sm d-block w-100 text-danger mb-2 btn-del-compare" id="'. $compareid .'" href="#"><i class="ci-trash me-1"></i>Remove</a>
                    <a class="d-inline-block mb-3" href="shop-single.php?product=' . htmlspecialchars($row['prodcode']) . '">
                        <img src="../retailers_admin/assets/img/products/' . htmlspecialchars($image_preview) . '" width="80" alt="' . htmlspecialchars($row['name']) . '">
                    </a>
                    <h3 class="product-title fs-sm">
                        <a href="shop-single.php?product=' . htmlspecialchars($row['prodcode']) . '">' . htmlspecialchars(substr($row['name'], 0, 50)) . '...</a>
                    </h3>
                    <button class="btn btn-primary btn-sm btn-add-to-cart" id="' . htmlspecialchars($row['prodcode']) . '" type="button">Add to Cart</button>
                </td>';
            }

            // Fetch comparison products
            $stmt = $con->prepare("SELECT * FROM products 
                                   INNER JOIN category ON products.category_id = category.categ_id 
                                   INNER JOIN product_brand ON products.brand_id = product_brand.brand_id 
                                   INNER JOIN tbl_compare ON products.prodcode = tbl_compare.compared_prod_id 
                                   WHERE tbl_compare.product_id = :productid");
            $stmt->execute([':productid' => $rows['product_id']]);
            $compareResults = $stmt->fetchAll();

            foreach ($compareResults as $row) {
                $img_stmt = $con->prepare("SELECT image_name FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
                $img_stmt->execute([':productID' => $row['prodcode']]);
                $image_row = $img_stmt->fetch();
                $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';

                $output .= '
                <td class="text-center px-4 pb-4">
                    <a class="btn btn-sm d-block w-100 text-danger mb-2 btn-del-compare" id="'. $compareid .'" href="#"><i class="ci-trash me-1"></i>Remove</a>
                    <a class="d-inline-block mb-3" href="shop-single.php?product=' . htmlspecialchars($row['prodcode']) . '">
                        <img src="../retailers_admin/assets/img/products/' . htmlspecialchars($image_preview) . '" width="80" alt="' . htmlspecialchars($row['name']) . '">
                    </a>
                    <h3 class="product-title fs-sm">
                        <a href="shop-single.php?product=' . htmlspecialchars($row['prodcode']) . '">' . htmlspecialchars(substr($row['name'], 0, 50)) . '...</a>
                    </h3>
                    <button class="btn btn-primary btn-sm btn-add-to-cart" id="' . htmlspecialchars($row['prodcode']) . '" type="button">Add to Cart</button>
                </td>';
            }

            $output .= '</tr></thead>';

            // Fetch criteria
            $stmt = $con->prepare("SELECT * FROM tb_criteria");
            $stmt->execute();
            $criteriaResults = $stmt->fetchAll();

            foreach ($criteriaResults as $criteriaRow) {
                $output .= '
                <tbody id="' . htmlspecialchars($criteriaRow['criteria_name']) . '" data-filter-target>
                <tr class="bg-secondary">
                    <th class="text-uppercase text-dark">' . htmlspecialchars($criteriaRow['criteria_name']) . '</th>';

                // Fetch product criteria
                $stmt = $con->prepare("SELECT * FROM products 
                                       INNER JOIN category ON products.category_id = category.categ_id 
                                       INNER JOIN product_brand ON products.brand_id = product_brand.brand_id 
                                       WHERE products.prodcode = :product");
                $stmt->execute([':product' => $rows['product_id']]);
                $productCriteriaResults = $stmt->fetchAll();

                foreach ($productCriteriaResults as $productCriteriaRow) {
                    $output .= '
                    <td><span class="text-dark fw-medium text-dark">' . htmlspecialchars(substr($productCriteriaRow['name'], 0, 50)) . '...</span></td>';
                }

                // Fetch comparison criteria
                $stmt = $con->prepare("SELECT * FROM products 
                                       INNER JOIN category ON products.category_id = category.categ_id 
                                       INNER JOIN product_brand ON products.brand_id = product_brand.brand_id 
                                       INNER JOIN tbl_compare ON products.prodcode = tbl_compare.compared_prod_id 
                                       WHERE tbl_compare.product_id = :productid");
                $stmt->execute([':productid' => $rows['product_id']]);
                $compareCriteriaResults = $stmt->fetchAll();

                foreach ($compareCriteriaResults as $compareCriteriaRow) {
                    $output .= '
                    <td><span class="text-dark fw-medium text-dark">' . htmlspecialchars(substr($compareCriteriaRow['name'], 0, 50)) . '...</span></td>';
                }

                $output .= '</tr>';

                // Fetch specifications based on criteria
                $stmt = $con->prepare("SELECT * FROM tb_specification 
                                       INNER JOIN tb_product_specification ON tb_specification.id = tb_product_specification.spec_id 
                                       WHERE tb_product_specification.product_id = :productid 
                                       AND tb_specification.criteria_id = :criteria_id");
                $stmt->execute([
                    ':productid' => $rows['product_id'],
                    ':criteria_id' => $criteriaRow['id']
                ]);
                $specResults = $stmt->fetchAll();

                foreach ($specResults as $specRow) {
                    $output .= '
                    <tr>
                        <th class="text-dark">' . htmlspecialchars($specRow['spec_name']) . '</th>
                        <td>' . htmlspecialchars($specRow['specification_details']) . '</td>
                    </tr>';
                }
            }

            $output .= '
            <tr>
                <th></th>
                <td>
                    <button class="btn btn-primary d-block w-100 btn-add-to-cart" id="' . htmlspecialchars($rows['product_id']) . '" type="button">Add to Cart</button>
                </td>';

            foreach ($compareResults as $compareProduct) {
                $output .= '
                <td>
                    <button class="btn btn-primary d-block w-100 btn-add-to-cart" id="' . htmlspecialchars($compareProduct['prodcode']) . '" type="button">Add to Cart</button>
                </td>';
            }

            $output .= '
            </tr>
            </tbody>
            </table>
            </div>';
        }
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
?>
