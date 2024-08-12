<?php
include_once("connect.php");
if (isset($_POST['product_id'])) {
    $output = array();
    $product_id = $_POST['product_id'];
    
    $statement = $con->prepare("SELECT p.*, c.category_name, pb.brand_name, (SELECT image_name FROM product_img WHERE product_id = p.prodcode ORDER BY id DESC LIMIT 1) AS product_image FROM products p INNER JOIN category c ON p.category_id = c.categ_id INNER JOIN product_brand pb ON p.brand_id = pb.brand_id WHERE p.prodcode = :productid");
    $statement->bindParam(":productid", $product_id);
    $statement->execute();
    
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    
    if ($result) {
        $output["productid"] = $result["prodcode"];
        $output["categoryid"] = $result["category_id"];
        $output["brandid"] = $result["brand_id"];
        $output["categoryname"] = $result["category_name"];
        $output["brand_name"] = $result["brand_name"];
        $output["product_name"] = $result["name"];
        $output["product_price"] = "₦ " . number_format($result["cost_price"], 2);
        $output["product_discount"] = $result["fprice"];
        $output["product_image"] = "../retailers_admin/assets/img/products/" . $result["product_image"];
    } else {
        // Product not found
        $output["error"] = "Product not found.";
    }
    
    echo json_encode($output);
}
?>

