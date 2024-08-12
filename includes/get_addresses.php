<?php
include_once('connect.php');

$output = '';
$status = '';
$number = 0;
try {
    $sql = "SELECT * FROM checkout_address WHERE user_id =:id";
    $stmt = $con->prepare($sql);
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();
    $firstIteration = true;
    foreach ($result as $row) {
        if($firstIteration){
            $output .= '
                    <tr>
                        <td class="py-3 align-middle">' . $row['address'] . '<span class="align-middle badge bg-info ms-2">Primary</span></td>
                        <td class="py-3 align-middle"><a class="nav-link-style me-2" href="#" data-bs-toggle="tooltip" title="Edit"><i class="ci-edit"></i></a>
                        <a class="nav-link-style text-danger delete-new-address" data-addressid="'.$row['id'].'" href="#" data-bs-toggle="tooltip" title="Remove">
                        <div class="ci-trash"></div></a></td>
                    </tr>
        ';
        $firstIteration=false;
        }else{
        $output .= '
        <tr>
                    <td class="py-3 align-middle">' . $row['address'] . '</td>
                    <td class="py-3 align-middle"><a class="nav-link-style me-2 btn-address-edit" href="#" data-bs-toggle="tooltip" title="Edit"><i class="ci-edit"></i></a>
                    <a class="nav-link-style text-danger delete-new-address" data-addressid="'.$row['id'].'" href="#" data-bs-toggle="tooltip" title="Remove">
                        <div class="ci-trash"></div></a></td>
                  </tr>
        ';
        }
    }
    if (empty($result)) {
        $output = '<option class="py-3" value="">No address is being added</option>';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo $output;