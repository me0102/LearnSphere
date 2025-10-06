<?php
session_start();
include_once('includes/db.php');
include_once('includes/functions.php');


error_reporting(E_ALL);
ini_set('display_errors', 1);


$course_id = $_GET['cours_id'] ?? null;  
$level = $_GET['level'] ?? null;

if (!$course_id || !$level) {
    die("Paramètres manquants dans l'URL");
}


$quiz_query = $pdo->prepare("SELECT * FROM quiz 
                            WHERE cours_id = ? AND niveau = ? 
                            LIMIT 1");
$quiz_query->execute([$course_id, $level]);
$quiz = $quiz_query->fetch(PDO::FETCH_ASSOC);

if (!$quiz) {
    die("Aucun quiz trouvé pour ce niveau");
}


$questions_query = $pdo->prepare("SELECT * FROM questions 
                                  WHERE quiz_id = ? 
                                  ORDER BY RAND() 
                                  LIMIT 20");
$questions_query->execute([$quiz['id']]);
$questions = $questions_query->fetchAll(PDO::FETCH_ASSOC);


$level_names = [
    '1' => 'Débutant',
    '2' => 'Intermédiaire',
    '3' => 'Avancé'
];
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Quiz - <?= htmlspecialchars($quiz['titre']) ?></title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;800&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="quiz-header">
            <h1><?= htmlspecialchars($quiz['title']) ?></h1>
            <div class="quiz-info">
                <span class="level-badge">Niveau <?= $level_names[$level] ?></span>
                <span class="question-count"><?= count($questions) ?> questions</span>
            </div>
        </div>

        <?php if (!empty($questions)): ?>
            <form action="submit_quiz.php" method="POST">
                <input type="hidden" name="quiz_id" value="<?= $quiz['id'] ?>">
                
                <?php foreach ($questions as $index => $question): ?>
                    <div class="question-card">
                        <div class="question-header">
                            <span class="question-number">Question <?= $index + 1 ?></span>
                        </div>
                        <p class="question-text"><?= htmlspecialchars($question['question']) ?></p>
                        
                        <div class="options-grid">
                            <?php foreach (['A' => 'option_a', 'B' => 'option_b', 'C' => 'option_c', 'D' => 'option_d'] as $letter => $field): ?>
                                <label class="option">
                                    <input type="radio" 
                                           name="question_<?= $question['id'] ?>" 
                                           value="<?= $letter ?>" 
                                           required>
                                    <span class="option-letter"><?= $letter ?>.</span>
                                    <?= htmlspecialchars($question[$field]) ?>
                                </label>
                            <?php endforeach; ?>
                        </div>
                    </div>
                <?php endforeach; ?>

                <div class="submit-btn-container">
                    <button type="submit" class="submit-btn">Soumettre le Quiz</button>
                </div>
            </form>
        <?php else: ?>
            <div class="error-message">
                Aucune question disponible pour ce quiz
            </div>
        <?php endif; ?>
    </div>
</body>
</html>
