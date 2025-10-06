<?php
header('Content-Type: application/json');

try {
    $conn = new PDO("mysql:host=localhost;dbname=e_learning_platform", "root", "");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch courses
    $coursesStmt = $conn->query("SELECT * FROM courses");
    $courses = $coursesStmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch modules
    $modulesStmt = $conn->query("SELECT * FROM modules");
    $modules = $modulesStmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch quizzes
    $quizzesStmt = $conn->query("SELECT * FROM quizzes");
    $quizzes = $quizzesStmt->fetchAll(PDO::FETCH_ASSOC);

    // Debugging logs
    error_log("Courses: " . json_encode($courses));
    error_log("Modules: " . json_encode($modules));
    error_log("Quizzes: " . json_encode($quizzes));

    echo json_encode([
        'courses' => $courses,
        'modules' => $modules,
        'quizzes' => $quizzes
    ]);
} catch (PDOException $e) {
    error_log("Database error: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
}
?>