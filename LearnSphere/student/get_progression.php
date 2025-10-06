<?php
session_start();
include('database.php'); // Connexion à la base de données

if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];

    // Récupérer les chapitres terminés par l'utilisateur dans chaque cours
    $stmt = $pdo->prepare("SELECT course_id, chapter_id FROM progression WHERE user_id = ? AND is_completed = TRUE");
    $stmt->execute([$userId]);
    $completedChapters = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Convertir les résultats en un format utilisable pour JavaScript
    echo "<script>var completedChapters = " . json_encode($completedChapters) . ";</script>";
}
?>
