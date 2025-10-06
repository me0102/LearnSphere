<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $imagePath = $_FILES['image']['name'];

    // Save the uploaded file
    $targetDir = "../images/";
    $targetFile = $targetDir . basename($imagePath);
    move_uploaded_file($_FILES['image']['tmp_name'], $targetFile);

    // Insert into database
    $stmt = $pdo->prepare("INSERT INTO modules (title, description, image_path) VALUES (?, ?, ?)");
    $stmt->execute([$title, $description, $targetFile]);

    echo "Module added successfully!";
}
?>