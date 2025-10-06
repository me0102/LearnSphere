<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $module_id = $_POST['module_id'] ?? null;
    $questions = $_POST['questions'] ?? null;
    
    if (!$module_id || !$questions) {
        echo "Erreur : Tous les champs sont obligatoires.";
        exit;
    }

    // Decode the questions JSON
    $questionsData = json_decode($questions, true);
    
    // Separate questions and correct answers
    $questionTexts = [];
    $correctAnswers = [];
    
    foreach ($questionsData as $q) {
        $questionTexts[] = [
            'question' => $q['question'],
            'choices' => $q['choices']
        ];
        $correctAnswers[] = $q['correctAnswer'];
    }

    try {
        $stmt = $pdo->prepare("INSERT INTO quizzes (module_id, questions, correct_answers) VALUES (?, ?, ?)");
        $stmt->execute([
            $module_id,
            json_encode($questionTexts),
            json_encode($correctAnswers)
        ]);
        echo "Quiz ajouté avec succès !";
    } catch (PDOException $e) {
        echo "Erreur : " . $e->getMessage();
    }
}
?>