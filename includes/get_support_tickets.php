<?php
include_once('connect.php');
$output = '';
// fetch products
try{
    // AND MONTH(add_date) = MONTH(CURDATE()) WHERE products.stock > 0
	$stmt = $con->prepare("SELECT * FROM support_tickets WHERE user_id=:id ORDER BY id DESC");
    $stmt->bindParam(":id", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){
    
    // $img_id = ($image_row !== false) ? $image_row['product_id'] : '';
    if (strtolower($row['priority'])=="urgent") {
        $priority = '<span class="badge bg-danger m-0">Urgent</span>';
    } elseif (strtolower($row['priority'])=="high") {
        $priority = '<span class="badge bg-warning m-0">High</span>';
    }elseif (strtolower($row['priority'])=="medium") {
        $priority = '<span class="badge bg-info m-0">Medium</span>';
    } elseif (strtolower($row['priority'])=="low") {
        $priority = '<span class="badge bg-success m-0">Low</span>';
    }else {
        $priority = '<span class="badge bg-primary m-0">Unknown</span>';
    }
    if(strtolower($row['status'])=="open"){
        $status='<span class="badge bg-success m-0">Open</span>';
    }else{
        $status='<span class="badge bg-secondary m-0">Closed</span>';
    }
    
    $output .= '
    <tr> 
    <td class="py-3"><a class="nav-link-style fw-medium" href="account-single-ticket.php?id='.$row['id'].'">'.$row['subject'].'</a></td>
    <td class="py-3">'.$row['created_at'].'</td>
    <td class="py-3">'.$row['type'].'</td>
    <td class="py-3">'.$priority.'</td>
    <td class="py-3">'.$status.'</td>
  </tr>
		';
	}
	if(empty($result))
	{
		$output .= '
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
        <h3>No Ticket Submitted</h3>
      </div>
    ';
	}
}
catch(PDOException $e){
	$output .= $e->getMessage();
}

echo $output;
?>