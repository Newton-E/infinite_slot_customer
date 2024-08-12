<?php
include_once('connect.php'); // Include your database connection file

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the selected items from the session
    $selectedItems = $_SESSION['selected_items'];

    // Check if there are selected items
    if (!empty($selectedItems)) {
        // Prepare and execute the SQL statement to insert selected items into the database
        $stmt = $con->prepare("INSERT INTO selected_items (item_id, item_amount, item_qty) VALUES (:item_id, :item_amount, :item_qty)");

        foreach ($selectedItems as $item) {
            $stmt->execute([
                ':item_id' => $item['itemId'],
                ':item_amount' => $item['itemAmount'],
                ':item_qty' => $item['itemQty'],
            ]);
        }

        // Clear the session data
        $_SESSION['selected_items'] = [];

        // Respond with success message
        echo json_encode(['msg' => 'Selected items stored in the database']);
    } else {
        echo json_encode(['error' => 'No selected items to store']);
    }
} else {
    // Handle the case where the request method is not POST
    echo json_encode(['error' => 'Invalid request method']);
}
?>
