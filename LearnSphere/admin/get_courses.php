<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    try {
        if (isset($_GET['module_id'])) {
            $module_id = $_GET['module_id'];
            $stmt = $pdo->prepare('SELECT courses.id, courses.title, courses.video_path, courses.pdf_path, courses.image_path, modules.title AS module_title FROM courses INNER JOIN modules ON courses.module_id = modules.id WHERE courses.module_id = ? ORDER BY courses.id ASC');
            $stmt->execute([$module_id]);
        } else {
            $stmt = $pdo->prepare('SELECT courses.id, courses.title, courses.video_path, courses.pdf_path, courses.image_path, modules.title AS module_title FROM courses INNER JOIN modules ON courses.module_id = modules.id ORDER BY modules.id ASC, courses.id ASC');
            $stmt->execute();
        }
        $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($courses);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['error' => 'Invalid request method']);
}