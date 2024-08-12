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
            <a class="product-gallery-thumblist-item change-preview-image" href="#'.$ordinal.'" data-img="../retailers_admin/assets/img/products/'.$row['image_name'].'"><img src="../retailers_admin/assets/img/products/'.$row['image_name'].'" alt="Product thumb"></a>';
        }
    }
    echo json_encode($output);
?>