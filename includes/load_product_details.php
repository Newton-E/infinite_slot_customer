<?php
include_once("connect.php");
if (isset($_POST['product_id'])) {
  $output = array();
    $statement = $con->prepare("SELECT * FROM products INNER JOIN category ON products.category_id = category.categ_id INNER JOIN product_brand ON products.brand_id = product_brand.brand_id WHERE prodcode = :productid");
    $statement->execute(
      array(
        ':productid' => $_POST['product_id']
      )
    );
    $result = $statement->fetchAll();
    foreach ($result as $rows) {
      $output["productid"] = $rows["prodcode"];
      $output["categoryid"] = $rows["category_id"];
      $output["brandid"] = $rows["brand_id"];
      $output["categoryname"] = $rows["category_name"];
      $output["brand_name"] = $rows["brand_name"];
      $output["product_name"] = $rows["name"];
      $output["product_stork"] = $rows["stock"];
      $output["product_stork_alert"] = $rows["stock_alert"];
      $output["product_mprice"] = $rows["market_price"];
      $output["product_price"] = "₦ ".number_format($rows["cost_price"],2);
      $output["product_discount"] = $rows["fprice"];
      $output["tax"] = $rows["order_tax"];
      $output["pro_details"] = $rows["pro_details"];
      $output["pro_discription"] = $rows["pro_discriptions"];
      $output["pro_date"] = date('d M y', strtotime($rows["add_date"]));
    }
  echo json_encode($output);
}
?>