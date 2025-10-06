<?php
session_start();
include_once('includes/db.php');
include_once('includes/functions.php');

$user_id    = (int) $_SESSION['user_id'];
$session_id = $_GET['session_id'] ?? '';

if (empty($session_id)) {
    die("Missing session ID");
}

try {
    // 1) Récupérer le dernier résultat global pour CE session_id
    $score_stmt = $pdo->prepare("
        SELECT qr.*, q.title AS quiz_title
        FROM quiz_results qr
        JOIN quiz q ON qr.quiz_id = q.id
        WHERE qr.session_id = ? 
          AND qr.user_id = ? 
        ORDER BY qr.id DESC
        LIMIT 1
    ");
    $score_stmt->execute([$session_id, $user_id]);
    $score_result = $score_stmt->fetch(PDO::FETCH_ASSOC);

    if (!$score_result) {
        throw new Exception("No quiz results found for this session");
    }
    
    

    // 2) Détails des réponses
    $detail_stmt = $pdo->prepare("
        SELECT q.*, ua.selected_answer
        FROM user_answers ua
        JOIN questions q ON ua.question_id = q.id
        WHERE ua.session_id = ? 
          AND ua.user_id = ? 
          AND ua.quiz_id = ? 
        ORDER BY ua.question_id
    ");
    $detail_stmt->execute([ $session_id, $user_id, $score_result['quiz_id'] ]);
    $results = $detail_stmt->fetchAll(PDO::FETCH_ASSOC);

    // 3) Calcul du pourcentage
    $score    = (int)$score_result['score'];
    $total    = (int)$score_result['total_questions'];
    $percentage = ($total > 0) ? round(($score / $total) * 100) : 0;
    $quiz_title = htmlspecialchars($score_result['quiz_title']);
    


    // 4) Quick Quiz Insights (Instant Feedback)
    if ($percentage >= 90) {
        $quick_feedback = "Félicitations ! Vous avez presque tout maîtrisé, continuez sur cette voie !";
    } elseif ($percentage >= 70) {
        $quick_feedback = "Bien joué ! Vous êtes sur la bonne voie, mais un peu plus de révisions ne ferait pas de mal.";
    } elseif ($percentage >= 50) {
        $quick_feedback = "Pas mal, mais vous pouvez encore améliorer certains points. N'hésitez pas à revoir les questions où vous avez eu des difficultés.";
    } else {
        $quick_feedback = "Courage ! Un peu plus de révision et vous serez prêt à réussir ce quiz. Revoyez les sujets clés.";
    }

} catch (Exception $e) {
    die("Error retrieving results: " . $e->getMessage());
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><?= $quiz_title ?> - Résultats</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;800&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .progress-bar-container {
            width: 100%;
            background-color: #e0e0e0;
            border-radius: 20px;
            height: 25px;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .progress-bar {
            height: 100%;
            background-color: #4caf50; 
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="result-card">
            <h1><?= $quiz_title ?></h1>
            <div class="percentage"><?= $percentage ?>%</div>
            <p class="percentage">Score: <?= $score ?>/<?= $total ?></p>

            <!-- Progress Bar -->
            <?php
            if ($percentage <= 30) {
                $progressBarColor = '#f44336'; 
            } elseif ($percentage <= 60) {
                $progressBarColor = '#ff9800'; 
            } elseif ($percentage <= 90) {
                $progressBarColor = '#ffeb3b'; 
            } else {
                $progressBarColor = '#4caf50'; 
            }
            ?>

            <div class="progress-bar-container">
                <div class="progress-bar" style="width: <?= $percentage ?>%; background-color: <?= $progressBarColor ?>;"></div>
            </div>
        </div>

        <!-- Quick Quiz Insights -->
        <div class="result-card">
            <h2>Retour Instantané</h2>
            <p><b><?= $quick_feedback ?></b></p>
        </div>

        <?php if (!empty($results)): ?>
            <div class="detailed-results">
                <?php foreach ($results as $index => $row): ?>
                    <?php $is_correct = ($row['selected_answer'] === $row['reponse_correcte']); ?>
                    <div class="question-result <?= $is_correct ? 'correct' : 'incorrect' ?>">
                        <h3>Question <?= $index + 1 ?></h3>
                        <span class="badge"><?= $is_correct ? '✔️ Bonne réponse' : '❌ Mauvaise réponse' ?></span>

                        <p><?= htmlspecialchars($row['question']) ?></p>
                        <div class="answer-comparison">
                            <div class="user-answer">
                                <strong>Votre réponse :</strong> <?= htmlspecialchars($row['selected_answer']) ?>
                            </div>
                            <div class="correct-answer">
                                <strong>Bonne réponse :</strong> <?= htmlspecialchars($row['reponse_correcte']) ?>
                            </div>
                        </div>
                        <div class="explanation">
                            <strong>Explication :</strong>
                            <p><?= nl2br(htmlspecialchars($row['explication'])) ?></p>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <p>Aucune question trouvée pour cette tentative.</p>
        <?php endif; ?>

        <a href="dashboard.php" class="btn">Retour au Tableau de Bord</a>
        
    </div>
</body>
</html>

