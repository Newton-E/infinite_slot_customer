<?php
// Connect to your database
include_once('connect.php');
// Initialize an empty array to store specification details
$specs = array();
try {
    // Query to fetch specification details from the database
    $stmt = $con->prepare("SELECT criteria_name FROM tb_criteria ORDER BY add_date");
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Loop through the fetched results and add them to the $specs array
    foreach ($result as $row) {
        $specs[] = array(
            'criteria_name' => $row['criteria_name']
        );
    }
} catch(PDOException $e) {
    // Handle database connection error
    $error = $e->getMessage();
    // You can customize error handling based on your requirements
    // For this example, we'll simply output the error message
    echo json_encode(array('error' => $error));
    exit(); // Stop further execution
}
// Output the $specs array as JSON data
echo json_encode($specs);
?>