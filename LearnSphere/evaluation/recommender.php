<?php
// Recommandations intelligentes basées sur les performances réelles de l'utilisateur
try {
    $stmt = $pdo->prepare(
        "SELECT c.id, c.titre AS cours, 
            ROUND(AVG(qr.score / qr.total_questions * 100), 1) AS avg_pct 
         FROM quiz_results qr
         JOIN quiz q ON qr.quiz_id = q.id
         JOIN cours c ON q.cours_id = c.id
         WHERE qr.user_id = ? 
         GROUP BY c.id"
    );
    $stmt->execute([$user_id]);
    $courseScores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $recommendations = [];

    foreach ($courseScores as $course) {
        $score = $course['avg_pct'];
        $courseTitle = htmlspecialchars($course['cours']);

        if ($score < 30) {
            $advice = "🔎 Après avoir analysé tes résultats récents dans « $courseTitle », je détecte que tu rencontres des obstacles sur les fondamentaux. C’est totalement normal au début. Je te recommande de revoir les notions de base en petits modules. Mon conseil : avance lentement, mais régulièrement. Je reste à disposition pour t'aider à tout moment.";
            $recommendationType = "⚠️ Priorité à la reprise des bases";
            $color = "#FF5733";
        } elseif ($score < 50) {
            $advice = "📊 Tu avances dans « $courseTitle » et ta courbe d’apprentissage est en progression. Ce que je vois, c’est un potentiel solide mais encore sous-exploité. Je t’encourage à refaire les quiz de niveau 1 et à varier les supports d’apprentissage (vidéos, cartes mémoire, quiz). Tu es sur le bon chemin, et je reste ton guide dans cette montée en compétence.";
            $recommendationType = "🟠 Stabilité à renforcer";
            $color = "#FFBF00";
        } elseif ($score < 70) {
            $advice = "✅ Excellent travail dans « $courseTitle ». Tes résultats montrent une vraie compréhension des sujets essentiels. Pour passer au niveau supérieur, je suggère des mini-projets ou des exercices complexes pour ancrer les acquis. Tu es très proche d’une maîtrise complète, et je suis là pour t’aider à franchir le cap.";
            $recommendationType = "🟢 Niveau confirmé";
            $color = "#4CAF50";
        } else {
            $advice = "🌟 Bravo ! Ton score dans « $courseTitle » reflète une excellente maîtrise. En tant qu’assistant intelligent, je te recommande de partager tes connaissances (via des forums ou du tutorat) pour consolider ton expertise. Continue à te challenger avec des contenus avancés, tu es prêt(e) pour l’élite !";
            $recommendationType = "🏅 Expert en devenir";
            $color = "#32CD32";
        }

        $recommendations[] = [
            'course' => $courseTitle,
            'score' => $score,
            'advice' => $advice,
            'type' => $recommendationType,
            'color' => $color
        ];
    }
} catch (Exception $e) {
    die("Erreur lors de l’analyse des performances : " . $e->getMessage());
}
?>


<section class="container">
    <h2>Analyse Personnalisée de Ton Parcours</h2>
    <?php if (!empty($recommendations)): ?>
        <ul class="recommendation-list">
            <?php foreach ($recommendations as $recommendation): ?>
                <li class="recommendation-card" style="border-left: 10px solid <?= $recommendation['color'] ?>;">
                    <h3 style="color: <?= $recommendation['color'] ?>;">
                        <?= $recommendation['course'] ?> (<?= $recommendation['score'] ?>%)
                    </h3>
                    <p><strong>🧠 Analyse IA :</strong> <?= $recommendation['advice'] ?></p>
                    <p><strong>📌 Statut :</strong> <?= $recommendation['type'] ?></p>
                    <div class="motivation-bar">
                        <div class="motivation-fill" style="width: <?= $recommendation['score'] ?>%;"></div>
                    </div>
                    <br>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>🎉 D’après mes calculs, tu maintiens une régularité impressionnante sur l’ensemble des cours. Continue ainsi, explore les contenus avancés, et pense à revisiter les anciens quiz pour rester affûté(e) ! Je reste à tes côtés pour te faire progresser intelligemment.</p>
    <?php endif; ?>
</section>
