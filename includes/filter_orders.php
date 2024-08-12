<?php
session_start();
include_once('connect.php');
$value = $_POST['value'];
$output = '';
$status = '';
$number = 0;

try {
    switch ($value) {
        case 0:
            $status = '<span class="badge bg-danger m-0">Cancelled</span>';
            $number = 0;
            break;
        case 1:
            $status = '<span class="badge bg-info m-0">In Progress</span>';
            $number = 1;
            break;
        case 2:
            $status = '<span class="badge bg-warning m-0">Delayed</span>';
            $number = 2;
            break;
        case 3:
            $status = '<span class="badge bg-success m-0">Delivered</span>';
            $number = 3;
            break;
        case 4:
            $status = '<span class="badge bg-success m-0">Canceled</span>';
            $number = 4;
            break;
        case 5:
            $status = '<span class="badge bg-success m-0">Paid</span>';
            $number = 4;
            break;
        default:
            $status = '<span class="badge bg-primary m-0">Unpaid</span>';
            break;
    }
    if($number==0){
        
    }
    $sql = "SELECT * FROM store_orders  WHERE user_id=:id AND packag_status=:status ORDER BY date_order ASC";

    $stmt = $con->prepare($sql);
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->bindParam(":status", $number);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach ($result as $row) {
        $output .= '<tr>
        <td class="py-3"><a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">' . $row['order_code'] . '</a></td>
        <td class="py-3">' . $row['date_order'] . '</td>
        <td class="py-3">' . $status . '</td>
        <td class="py-3">&#8358;' . number_format($row['product_price']) . '</td>
      </tr>';
    }
    if (empty($result)) {
        $output = '<tr><td class="py-3 text-center" colspan="3">No Orders found with the given search criteria!<td></tr>';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;
