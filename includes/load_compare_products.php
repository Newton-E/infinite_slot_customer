<?php
include_once('connect.php');
$output = array();
try {
  $stmt = $con->prepare("SELECT * FROM products 
  INNER JOIN category ON products.category_id = category.categ_id 
  INNER JOIN product_brand ON products.brand_id = product_brand.brand_id 
  WHERE products.category_id = :categoryID AND products.prodcode != :productID 
  ORDER BY RAND(), id DESC, add_date DESC LIMIT 70");
  $stmt->execute(['categoryID' => $_POST['category_id'], 'productID' => $_POST['product_id']]);
  $result = $stmt->fetchAll();

    foreach ($result as $row) {
        $stmt = $con->prepare("SELECT image_name, product_id FROM product_img WHERE product_id = :productID ORDER BY id DESC LIMIT 1");
        $stmt->execute(['productID'=>$row['prodcode']]);
        $image_row = $stmt->fetch();
        $image_preview = ($image_row !== false) ? $image_row['image_name'] : '';

        $product_status = '';
        if (date('m', strtotime($row['add_date'])) == date('m')) {
            $product_status = '<span class="badge bg-success badge-shadow">New</span>';
        } elseif (date('d', strtotime($row['date_view'])) == date('d')) {
            $product_status = '<span class="badge bg-danger badge-shadow">Sale</span>';
        }

        $output[] = array(
            'product_id' => $row['prodcode'],
            'product_status' => $product_status,
            'image_preview' => $image_preview,
            'category_name' => $row['category_name'],
            'product_name' => substr($row['name'], 0, 50),
            'product_price' => '₦'.number_format($row['cost_price']).'.00',
            'product_id' => $row['prodcode']
        );
    }
} catch(PDOException $e) {
    $output['error'] = $e->getMessage();
}

echo json_encode($output);
?>