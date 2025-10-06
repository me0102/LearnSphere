<?php
session_start();
include('../database.php'); // Connexion à la base de données

if (isset($_POST['chapter_id']) && isset($_SESSION['user_id'])) {
    $chapterId = $_POST['chapter_id'];
    $userId = $_SESSION['user_id'];
    $courseId = $_POST['course_id']; // Récupérer l'ID du cours (si nécessaire)

    // Mettre à jour la progression dans la base de données
    $stmt = $pdo->prepare("REPLACE INTO progression (user_id, course_id, chapter_id, is_completed, completed_at) VALUES (?, ?, ?, TRUE, NOW())");
    $stmt->execute([$userId, $courseId, $chapterId]);

    echo "Progression mise à jour avec succès!";
}
?>
