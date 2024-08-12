<?php
include_once('connect.php');
$output = '';
try {
    $sql = "SELECT * FROM tb_shipping_method";
    $stmt = $con->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach ($result as $row) {
        $output .= '
        <tr class="shipping-row" data-id="'.$row['id'].'">
        <td>
          <div class="form-check mb-4">
            <input class="form-check-input shipping-price" type="radio" id="'.$row['id'].'" name="shipping-method">
            <label class="form-check-label" for="'.$row['id'].'"></label>
          </div>
        </td>
        <td class="align-middle"><span class="text-dark fw-medium">'.$row['method_name'].'</span><br><span class="text-muted">'.$row['method_discription'].'</span></td>
        <td class="align-middle">'.$row['delivery_time'].'</td>
        <td class="align-middle">₦ '.number_format($row['handling_fee'], 2).'</td>
      </tr>
    ';
    }

    if (empty($result)) {
        $output .= '
        <tr>
        <td colspan="4">No results found</td>
      </tr>
        ';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}
echo json_encode($output);
?>