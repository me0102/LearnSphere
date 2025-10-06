<?php
// functions.php - Fonctions pour interagir avec la base de données


// Inclure la connexion à la base de données
include_once('db.php');


// Ajouter un cours à la base de données
function addCourse($titre) {
    global $conn;
    $titre = htmlspecialchars($titre); // Prevent XSS
    $query = "INSERT INTO cours (titre) VALUES (?)";
    $stmt = $conn->prepare($query);
    $stmt->execute([$titre]);
    return $stmt->execute();
}

// Ajouter un quiz à un cours spécifique
function addQuiz($cours_id, $niveau, $titre) {
    global $conn;
    $query = "INSERT INTO quiz (cours_id, niveau, titre) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->execute(['iss', $cours_id, $niveau, $titre]);
    return $stmt->execute();
}

// Ajouter une question à un quiz
function addQuestion($quiz_id, $question, $reponse_correcte, $explication) {
    global $conn;
    $query = "INSERT INTO questions (quiz_id, question, reponse_correcte, explication) 
              VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->execute([$quiz_id, $question, $reponse_correcte, $explication]);
    return $stmt->execute();
}

// Ajouter des choix de réponse à une question
function addChoice($question_id, $texte_option) {
    global $conn;
    $query = "INSERT INTO choix (question_id, texte_option) VALUES (?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->execute(['is', $question_id, $texte_option]);
    return $stmt->execute();
}

// Enregistrer la progression de l'utilisateur pour un quiz
function saveUserProgress($utilisateur_id, $quiz_id, $score) {
    global $conn;
    $query = "INSERT INTO progression_utilisateur (utilisateur_id, quiz_id, score) 
              VALUES (?, ?, ?)
              ON DUPLICATE KEY UPDATE score = GREATEST(score, VALUES(score))";
    $stmt = $conn->prepare($query);
    $stmt->execute([$utilisateur_id, $quiz_id, $score]);
    return $stmt->execute();
}

// Obtenir la progression des quizzes pour un utilisateur
function getUserProgress($utilisateur_id) {
    global $conn;
    $query = "SELECT title AS quiz_title, p.score 
              FROM progression_utilisateur p
              JOIN quiz q ON p.quiz_id = q.id
              WHERE p.utilisateur_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute([$utilisateur_id]);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result->fetch_all(MYSQLI_ASSOC);
}


function getSkillAnalysis($user_id) {
    global $conn;
    
    return $conn->query("
        SELECT 
            CASE 
                WHEN q.niveau = 1 THEN 'Concepts de Base'
                WHEN q.niveau = 2 THEN 'Applications Pratiques'
                ELSE 'Expertise Avancée'
            END as category,
            AVG(score) as score
        FROM progression_utilisateur p
        JOIN quiz q ON p.quiz_id = q.id
        WHERE p.utilisateur_id = $user_id
        GROUP BY q.niveau
    ")->fetchAll(PDO::FETCH_ASSOC);
}



