<?php
$pdo = require_once('includes/db.php'); 
include_once('includes/functions.php');

$query = $pdo->query("SELECT * FROM cours");
$cours = $query->fetchAll(PDO::FETCH_ASSOC);


?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Cours Disponibles</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;800&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Choisissez un Cours</h1>
        <div class="course-grid">
            <?php foreach ($cours as $row): ?>
                <div class="course-card">
                    <h2><b><?= htmlspecialchars($row['titre']) ?></b></h2>
                    <p><?= htmlspecialchars($row['description']) ?></p>
                    <a href="course_levels.php?cours_id=<?= $row['id'] ?>" class="btn">Voir les Niveaux</a>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</body>
</html>
