<?php
include_once('connect.php');
$output = '';

try {

    $sql =  "SELECT * FROM store_orders LEFT JOIN product_img ON store_orders.product_id=product_img.product_id  WHERE store_orders.user_id=:id AND store_orders.pay_status <= 1 GROUP BY store_orders.product_id ORDER BY store_orders.date_order DESC ";

    $stmt = $con->prepare($sql);
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach  ($result as $row ) {
        $image_preview = ($row !==   false) ? $row['image_name'] : '';
        $status='';
        switch($row['packag_status']){
            case 0:
                $status ='<span class="badge bg-danger m-0">not paid</span>';
                break;  
            case 1:
                $status ='<span class="badge bg-info m-0">In Progress</span>';
                break;  
            case 2:
                $status ='<span class="badge bg-warning m-0">Delayed</span>';
                break;  
            case 3:
                $status ='<span class="badge bg-success m-0">Delivered</span>';
                break;
        }        
        $output .='<tr class="clickable-row" data-href="./order-tracking.php?productid='.$row['product_id'].'&ordercode='.$row['order_code'].'" data-bs-toggle="modal">      
        <td class="py-3">
            <a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">
                <img src="../retailers_admin/assets/img/products/'.$image_preview.'" alt="Product" style="max-height: 50px; max-width: 50px; height:50px;width:50px; border-radius: 50%">
            </a>
        </td>
        <td class="py-3">'.$row['date_order'].'</td>    
        <td class="py-3">'.$status.'</td>
        <td class="py-3">&#8358;'.number_format($row['product_price']).'</td>
    </tr>';
    }
    if (empty($result)) {
        $output = '<tr><td class="py-3 text-center" colspan="3">No Orders placed yet!<td></tr>';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
?>