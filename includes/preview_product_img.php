<?php
include_once('connect.php');
if(isset($_POST["img_id"]))
{
    $output = '';
    $statement = $con->prepare(
            "SELECT * FROM product_img 
            WHERE product_id = '".$_POST["img_id"]."' 
            ORDER BY id DESC"
        );
        $statement->execute();
        $result = $statement->fetchAll();
        $ordinalNumbers = array("first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth");
        $active = [];
        for ($i = 0; $i < count($result); $i++) {
            $active[$i] = "efghijklmnopqrstuvwxyzABCDEFGH"[$i];
        }
        foreach($result as $key => $row)
        {
            $ordinalIndex = $key % count($ordinalNumbers);
            $ordinal = $ordinalNumbers[$ordinalIndex];

            $output .= '
            <div class="product-gallery-preview-item activ'.$active[$key].'" id="'.$ordinal.'">
            <img class="image-zoom pre_'.$ordinal.'" id="main-quickview-image" src="../retailers_admin/assets/img/products/'.$row['image_name'].'" data-zoom="../retailers_admin/assets/img/products/'.$row['image_name'].'" alt="Product image">
            <div class="image-zoom-pane"></div>
          </div>';
        }
    }
    echo json_encode($output);
?>