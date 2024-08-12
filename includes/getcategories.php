<?php
include_once('connect.php');
$output = '';
try {
    $sql = "SELECT * FROM category";
    $stmt = $con->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach ($result as $row) {
        $output .= '
        <div class="accordion-item">
            <h3 class="accordion-header"><a class="accordion-button collapsed" href="#'.preg_replace("/\s+/","", $row["category_name"]).'" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="'.preg_replace("/\s+/","", $row["category_name"]).'">'.$row["category_name"].'</a></h3>
            <div class="accordion-collapse collapse" id="'.preg_replace("/\s+/","", $row["category_name"]).'" data-bs-parent="#shop-categories">
                <div class="accordion-body">
                    <div class="widget widget-links widget-filter">
                        <div class="input-group input-group-sm mb-2">
                            <input class="widget-filter-search form-control rounded-end" type="text" placeholder="Search"><i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
                        </div>
                        <ul class="widget-list widget-filter-list pt-1" style="height: 12rem;" data-simplebar data-simplebar-auto-hide="false">
                            <li class="widget-list-item widget-filter-item"><a class="widget-list-link d-flex justify-content-between align-items-center" href="#"><span class="widget-filter-item-text">View all</span><span class="fs-xs text-muted ms-3">1,953</span></a></li>
                            <li class="widget-list-item widget-filter-item"><a class="widget-list-link d-flex justify-content-between align-items-center" href="#"><span class="widget-filter-item-text">Pumps &amp; High Heels</span><span class="fs-xs text-muted ms-3">247</span></a></li>
                            <li class="widget-list-item widget-filter-item"><a class="widget-list-link d-flex justify-content-between align-items-center" href="#"><span class="widget-filter-item-text">Ballerinas &amp; Flats</span><span class="fs-xs text-muted ms-3">156</span></a></li>
                            <li class="widget-list-item widget-filter-item"><a class="widget-list-link d-flex justify-content-between align-items-center" href="#"><span class="widget-filter-item-text">Smart Shoes</span><span class="fs-xs text-muted ms-3">18</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
		';
    }

    if (empty($result)) {
        $output .= '
        <div class="accordion-item">
            <h3 class="accordion-header"><a class="accordion-button collapsed" href="#shoes" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="shoes">No Categories</a></h3>
        </div>
    ';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}
echo $output;

