<?php
include_once('connect.php');
$output = '';

try {
    $stmt = $con->prepare("SELECT category_name, COUNT(*) as category_count, GROUP_CONCAT(cat_slug) as subcategories 
                            FROM category 
                            GROUP BY category_name");
    $stmt->execute();
    $rows = $stmt->fetchAll();

    if (!empty($rows)) {
        $output .= '<div class="accordion" id="category-accordion">';

        foreach ($rows as $row) {
            $subcategories = explode(',', $row['subcategories']);
            $subcategory_count = count($subcategories);

            $output .= '
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading-' . $row['category_name'] . '">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-' . $row['category_name'] . '" aria-expanded="false" aria-controls="collapse-' . $row['category_name'] . '">
                        ' . $row['category_name'] . ' (' . $subcategory_count . ')
                    </button>
                </h2>
                <div id="collapse-' . $row['category_name'] . '" class="accordion-collapse collapse" aria-labelledby="heading-' . $row['category_name'] . '" data-bs-parent="#category-accordion">
                    <div class="accordion-body">
                        <div class="widget widget-links widget-filter">
                            <div class="input-group input-group-sm mb-2">
                                <input class="widget-filter-search form-control rounded-end" type="text" placeholder="Search ' . $row['category_name'] . '" data-category="' . $row['category_name'] . '">
                                <i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
                            </div>
                            <ul class="widget-list widget-filter-list pt-1" style="height: 12rem;" data-simplebar data-simplebar-auto-hide="false">
                                <li class="widget-list-item widget-filter-item">
                                    <a class="widget-list-link d-flex justify-content-between align-items-center" href="#">
                                        <span class="widget-filter-item-text">View all</span>
                                        <span class="fs-xs text-muted ms-3">' . $subcategory_count . '</span>
                                    </a>
                                </li>';

            foreach ($subcategories as $subcategory) {
                $output .= '
                <li class="widget-list-item widget-filter-item" data-category="' . $row['category_name'] . '">
                    <a class="widget-list-link d-flex justify-content-between align-items-center" href="#">
                        <span class="widget-filter-item-text">' . $subcategory . '</span>
                        <span class="fs-xs text-muted ms-3"></span>
                    </a>
                </li>';
            }

            $output .= '</ul>
                        </div>
                    </div>
                </div>
            </div>';
        }

        $output .= '</div>';
    } else {
        $output .= '<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
                        <h3>No product uploaded</h3>
                    </div>';
    }
} catch (PDOException $e) {
    $output .= $e->getMessage();
}

echo json_encode($output);
?>
