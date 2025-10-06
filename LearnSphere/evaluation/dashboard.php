<?php
session_start();
include_once('includes/db.php');
include_once('includes/functions.php');

$user_id = (int) $_SESSION['user_id'];

try {
    // Récupérer la progression récente (max 10 derniers quiz)
    $stmt = $pdo->prepare(
        "SELECT q.title AS quiz_title, qr.score, qr.total_questions
         FROM quiz_results qr
         JOIN quiz q ON qr.quiz_id = q.id
         WHERE qr.user_id = ?
         ORDER BY qr.id DESC
         LIMIT 10"
    );
    $stmt->execute([$user_id]);
    $recentProgress = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Top 3 cours à retravailler (< 50 %)
    $toWorkStmt = $pdo->prepare(
        "SELECT 
            c.id,
            c.titre AS cours,
            ROUND(AVG(qr.score/qr.total_questions*100), 1) AS avg_pct
         FROM quiz_results qr
         JOIN quiz q ON qr.quiz_id = q.id
         JOIN cours c ON q.cours_id = c.id
         WHERE qr.user_id = ?
         GROUP BY c.id
         HAVING avg_pct < 50
         ORDER BY avg_pct ASC
         LIMIT 3"
    );
    $toWorkStmt->execute([$user_id]);
    $courseToWork = $toWorkStmt->fetchAll(PDO::FETCH_ASSOC);

    // Récupérer le quiz avec la meilleure note (en pourcentage)
    $maxQuizStmt = $pdo->prepare("
        SELECT 
            qr.score, 
            qr.total_questions, 
            q.title AS quiz_title
        FROM quiz_results qr
        JOIN quiz q ON qr.quiz_id = q.id
        WHERE qr.user_id = ? 
        ORDER BY (qr.score/qr.total_questions) DESC
        LIMIT 1
    ");
    $maxQuizStmt->execute([$user_id]);
    $maxQuizData = $maxQuizStmt->fetch(PDO::FETCH_ASSOC);

    if ($maxQuizData) {
        $maxScore     = (int) $maxQuizData['score'];
        $maxTotal     = (int) $maxQuizData['total_questions'];
        $maxPct       = $maxTotal > 0 ? round($maxScore / $maxTotal * 100) : 0;
        $maxQuizTitle = htmlspecialchars($maxQuizData['quiz_title']);
    } else {
        // Cas où l'utilisateur n'a encore passé aucun quiz
        $maxPct       = 0;
        $maxQuizTitle = '—';
    }

    // Calculer métriques globales
    $scores = array_column($recentProgress, 'score');
    $totals = array_column($recentProgress, 'total_questions');
    $average = (!empty($scores) && array_sum($totals) > 0)
        ? round(array_sum($scores) / array_sum($totals) * 100)
        : 0;
    $completed = count($recentProgress);
    
    // Identifier le quiz le plus faible parmi les récents
    $weakest = null;
    if ($completed) {
        $percentages = [];
        foreach ($recentProgress as $item) {
            $percentages[] = ($item['total_questions'] > 0)
                ? ($item['score'] / $item['total_questions'] * 100)
                : 0;
        }
        $minIndex = array_keys($percentages, min($percentages))[0];
        $weakest = $recentProgress[$minIndex]['quiz_title'];
    }

} catch (Exception $e) {
    die("Erreur lors du chargement du tableau de bord : " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de Bord</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Mon Tableau de Bord</h1>

        <!-- Analyse de Performance -->
        <div class="dashboard-grid">
            <div class="metric-card">
                <h2>Moyenne Générale</h2>
                <p class="metric-value"><?= $average ?>%</p>
            </div>
            <div class="metric-card">
                <h2>Quiz Complétés</h2>
                <p class="metric-value"><?= $completed ?></p>
            </div>
            <div class="metric-card">
                <h2>Quiz le Plus Faible</h2>
                <p class="metric-value"><?= htmlspecialchars($weakest ?? '—') ?></p>
            </div>
            <div class="metric-card">
                <h2>Meilleure Note</h2>
                <p class="metric-value"><?= $maxPct ?>%</p>
                <p class="small-text">Sur « <?= htmlspecialchars($maxQuizTitle) ?> »</p>
            </div>

        </div>

        <!-- Résultats Récents -->
        <section class="progress-section">
            <h2>Résultats Récents</h2>
            <?php if (!empty($recentProgress)): ?>
                <?php foreach ($recentProgress as $item): ?>
                    <div class="progress-card">
                        <h3><?= htmlspecialchars($item['quiz_title']) ?></h3>
                        <?php
                            $pct = ($item['total_questions'] > 0)
                                ? round($item['score'] / $item['total_questions'] * 100)
                                : 0;
                        ?>
                        <p>Score : <?= $item['score'] ?>/<?= $item['total_questions'] ?> (<?= $pct ?>%)</p>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: <?= $pct ?>%"></div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Aucun résultat trouvé. Lancez un quiz pour démarrer vos progrès !</p>
            <?php endif; ?>
        </section>

        <!-- Cours à retravailler (< 50%) -->
        <section class="to-work-section">
            <h2>Cours à retravailler </h2>
            <?php if (!empty($courseToWork)): ?>
                <ul>
                <?php foreach ($courseToWork as $cw): ?>
                    <li><?= htmlspecialchars($cw['cours']) ?> (moyenne <?= $cw['avg_pct'] ?>%)</li>
                <?php endforeach; ?>
                </ul>
            <?php else: ?>
                <p>Félicitations ! Toutes vos moyennes sont supérieures à 50 %.</p>
            <?php endif; ?>
        </section>
        <!-- Bouton Nouvelle Action -->
        <div class="btn-group">
            <a href="courses.php" class="btn">Reprendre un Quiz</a>
        </div>
        <!-- Recommandations -->
        <section class="recommendation-section">
               <ul class="recommendation-list">
                  <!-- Personalized Course Recommendations -->
                  <?php include('recommender.php'); ?>  
                </ul>            
        </section>
        
    </div>    
</body>
</html>


