<?php
echo "Hello, World! From PHP.\n";

$host = "mysql";
$db = "testdb";
$user = "testuser";
$pass = "testpass";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $stmt = $pdo->query("SELECT 'Hello from MySQL' AS message");
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo $row['message'] . "\n";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
