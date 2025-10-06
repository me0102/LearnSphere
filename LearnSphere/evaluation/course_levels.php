<?php
$pdo = require_once('includes/db.php'); 
include_once('includes/functions.php');

if (isset($_GET['cours_id']) && !empty($_GET['cours_id'])) {
    $cours_id = (int)$_GET['cours_id']; 
} else {
    echo "cours_id is missing or invalid!";
    exit; 
}

$cours = [];

if ($cours_id) {
    try {
        $stmt = $pdo->prepare("SELECT * FROM cours WHERE id = ?");
        $stmt->execute([$cours_id]);
        $cours = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$cours) {
            echo "No course found for ID: " . htmlspecialchars($cours_id);
            exit;
        }
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        exit;
    }
}

$level_descriptions = [
    1 => "Niveau Débutant : Maîtrisez les bases fondamentales",
    2 => "Niveau Intermédiaire : Approfondissez vos compétences",
    3 => "Niveau Avancé : Devenez un expert du sujet"
];
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Niveaux du Cours</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;800&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <?php if ($cours): ?>
            <h1><?= htmlspecialchars($cours['titre']) ?></h1>
            <div class="level-grid">
                <?php foreach ([1, 2, 3] as $level): ?>
                    <div class="level-card">
                        <h3>Niveau <?= $level ?></h3>
                        <p><?= $level_descriptions[$level] ?></p>
                        
                        <?php
                        $stmt = $pdo->prepare("SELECT id FROM quiz WHERE cours_id = ? AND niveau = ?");
                        $stmt->execute([$cours_id, $level]);
                        $quiz_exists = $stmt->rowCount() > 0;
                        ?>
                        
                        <?php if ($quiz_exists): ?>
                            <a href="quiz.php?cours_id=<?= $cours_id ?>&level=<?= $level ?>" class="btn btn-level">
                                 Commencer le Quiz
                            </a>
                        <?php else: ?>
                            <button class="btn btn-disabled" disabled>
                                Quiz en préparation
                            </button>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="error-message">
                Cours introuvable
            </div>
        <?php endif; ?>
    </div>
</body>
</html>
