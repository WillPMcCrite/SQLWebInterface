<?php
$host = 'sysmysql8.auburn.edu'; // or your host
$username = 'wpm0026'; // your database username
$password = 'MyDatabaseWeagle1'; // your database password
$database = 'wpm0026db'; // your database name



// Create connection
$conn = new mysqli($host, $username, $password, $database);
$tables = array("Books", "Customers", "OrderDetails", "Orders", "Shippers", "Subjects", "Shippers");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $sql = $_POST['sql'];

    // Check if the SQL contains a DROP statement
    if (stripos($sql, 'DROP') !== false) {
        echo "DROP statements are not allowed.";
    } else {
        if ($result = $conn->query($sql)) {
            if ($result === true) {
                // For non-select queries, check affected rows
                $affectedRows = $conn->affected_rows;
                echo $affectedRows > 0 ? "$affectedRows Row(s) affected." : "No rows affected.";
            } else {
                // Handle select queries
                $num_rows = $result->num_rows;
                echo "<p>$num_rows rows retrieved.</p>";
                echo "<table border='1'><tr>";

                // Fetch attribute names for each column
                while ($fieldinfo = $result->fetch_field()) {
                    echo "<th>{$fieldinfo->name}</th>";
                }
                echo "</tr>";

                // Output data of each row
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    foreach ($row as $data) {
                        echo "<td>$data</td>";
                    }
                    echo "</tr>";
                }
                echo "</table>";

                $result->free();
            }
        } else {
            echo "Error: " . $conn->error;
        }
    }
}

$conn->close();
?>