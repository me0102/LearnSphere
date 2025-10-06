<?php
session_start();
include_once('includes/db.php');
include_once('includes/functions.php');

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to submit the quiz.");
}
$user_id = (int) $_SESSION['user_id'];  
// Vérifier qu'on a bien l'ID du quiz
if (!isset($_POST['quiz_id'])) {
    die("No quiz ID provided");
}

$quiz_id       = (int) $_POST['quiz_id'];
$user_id       = (int) $_SESSION['user_id'];
// Génère un identifiant unique pour CE quiz
$submission_id = uniqid('quiz_', true);

$pdo->beginTransaction();

try {
    $score           = 0;
    $total_questions = 0;

    foreach ($_POST as $key => $value) {
        if (strpos($key, 'question_') !== 0) {
            continue;
        }

        $question_id     = (int) str_replace('question_', '', $key);
        $selected_answer = strtoupper(trim($value));

        if ($selected_answer === '' || !in_array($selected_answer, ['A','B','C','D'])) {
            continue;
        }

        // 1) Récupérer la bonne réponse de la BDD
        $stmt = $pdo->prepare("
            SELECT reponse_correcte 
            FROM questions 
            WHERE id = ? AND quiz_id = ? 
            LIMIT 1
        ");
        $stmt->execute([$question_id, $quiz_id]);
        $res = $stmt->fetchAll(PDO::FETCH_ASSOC);  

        if (!$res) {
            throw new Exception("Question $question_id not found in quiz $quiz_id");
        }

        $row = $res[0];  
        $correct_answer = strtoupper($row['reponse_correcte']);

        // 2) Calcul du score
        $is_correct = ($selected_answer === $correct_answer) ? 1 : 0;
        if ($is_correct) {
            $score++;
        }
        $total_questions++;

        // 3) Sauvegarder la réponse détaillée
        $insert = $pdo->prepare("
            INSERT INTO user_answers 
              (user_id, quiz_id, question_id, selected_answer, is_correct, session_id)
            VALUES (?, ?, ?, ?, ?, ?)
        ");
        $insert->execute([
             $user_id,
             $quiz_id,
             $question_id,
             $selected_answer,
             $is_correct,
             $submission_id  
        ]);

        if (!$insert) {
            throw new Exception("Failed to save answer for question $question_id");
        }
    }

    // 4) Sauvegarder le résultat global
    $resStmt = $pdo->prepare("
        INSERT INTO quiz_results 
          (user_id, quiz_id, score, total_questions, session_id)
        VALUES (?, ?, ?, ?, ?)
    ");
    $resStmt->execute([
         $user_id,
         $quiz_id,
         $score,
         $total_questions,
         $submission_id  
    ]);

    if (!$resStmt) {
        throw new Exception("Failed to save quiz_results");
    }

    $pdo->commit();

    
    header("Location: quiz_result.php?session_id=" . urlencode($submission_id));
    exit();

} catch (Exception $e) {
    $pdo->rollback();
    error_log("Quiz submission error: " . $e->getMessage());
    die("An error occurred: " . $e->getMessage());
}
?>
