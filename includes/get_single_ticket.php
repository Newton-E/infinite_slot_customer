<?php
include_once('connect.php');
$output = '';
// fetch products
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        // AND MONTH(add_date) = MONTH(CURDATE()) WHERE products.stock > 0
        $stmt = $con->prepare("SELECT * FROM support_tickets WHERE user_id=:id AND id=:ticket_id ORDER BY id DESC");
        $stmt->bindParam(":id", $_SESSION['user_id']);
        $stmt->bindParam(":ticket_id", $id);
        $stmt->execute();
        $result = $stmt->fetch();
        if (strtolower($result['priority']) == "urgent") {
            $priority = '<span class="badge bg-danger m-0">Urgent</span>';
        } elseif (strtolower($result['priority']) == "high") {
            $priority = '<span class="badge bg-warning m-0">High</span>';
        } elseif (strtolower($result['priority']) == "medium") {
            $priority = '<span class="badge bg-info m-0">Medium</span>';
        } elseif (strtolower($result['priority']) == "low") {
            $priority = '<span class="badge bg-success m-0">Low</span>';
        } else {
            $priority = '<span class="badge bg-primary m-0">Unknown</span>';
        }
        if (strtolower($result['status']) == "open") {
            $status = '<span class="badge bg-success m-0">Open</span>';
        } else {
            $status = '<span class="badge bg-secondary m-0">Closed</span>';
        }
        $output .= '<div class="d-flex w-100 text-light text-center me-3">
            <div class="fs-ms px-3">
                <div class="fw-medium">Date Submitted</div>
                <div class="opacity-60">' . $result['created_at'] . '</div>
            </div>
            <div class="fs-ms px-3">
                <div class="fw-medium">Last Updated</div>
                <div class="opacity-60">09/30/2019</div>
            </div>
            <div class="fs-ms px-3">
                <div class="fw-medium">Type</div>
                <div class="opacity-60">' . $result['type'] . '</div>
            </div>
            <div class="fs-ms px-3">
                <div class="fw-medium">Priority</div>' . $priority . '
            </div>
            <div class="fs-ms px-3">
                <div class="fw-medium">Status</div>' . $status . '
            </div>
        </div>
        <a class="btn btn-primary btn-sm" href="account-signin.php"><i
                                class="ci-sign-out me-2"></i>Sign out</a>';
        $output_mobile = '<div class="fs-sm px-3 pb-3">
                        <div class="fw-medium">Date Submitted</div>
                        <div class="text-muted">' . $result['created_at'] . '</div>
                    </div>
                    <div class="fs-sm px-3 pb-3">
                        <div class="fw-medium">Last Updated</div>
                        <div class="text-muted">' . $result['updated_at'] . '</div>
                    </div>
                    <div class="fs-sm px-3 pb-3">
                        <div class="fw-medium">Type</div>
                        <div class="text-muted">Website problem</div>
                    </div>
                    <div class="fs-sm px-3 pb-3">
                        <div class="fw-medium">Priority</div><span class="badge bg-warning">High</span>
                    </div>
                    <div class="fs-sm px-3 pb-3">
                        <div class="fw-medium">Status</div><span class="badge bg-success">Open</span>
                    </div>';
        $output_body = '<div class="d-flex align-items-start pb-4 border-bottom"><img class="rounded-circle"
                            src="img/testimonials/03.jpg" width="50" alt="Michael Davis">
                        <div class="ps-3">
                            <h6 class="fs-md mb-2">'.$result['subject'].'</h6>
                            <p class="fs-md mb-1">'.$result['description'].'</p><span class="fs-ms text-muted"><i
                                    class="ci-time align-middle me-2"></i>Sep 30, 2019 at 11:05AM</span>
                        </div>
                    </div>';

        if (empty($result)) {
            $output .= '
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
        <h3>Ticket Not Found</h3>
      </div>
    ';
        }
    } catch (PDOException $e) {
        $error .= $e->getMessage();
    }
    $data = array(
        'header' => $output,
        'mobile' => $output_mobile,
        'body' => $output_body,
        'status'=>'yes',
        'error'=>$error
      );
    echo json_encode($data);
}
?>