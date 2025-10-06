<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    if (!isset($input['id'])) {
        echo json_encode(['error' => 'Course ID is required']);
        exit;
    }

    $courseId = $input['id'];

    try {
        $stmt = $pdo->prepare('DELETE FROM courses WHERE id = ?');
        $stmt->execute([$courseId]);

        if ($stmt->rowCount() > 0) {
            echo json_encode(['success' => 'Course deleted successfully']);
        } else {
            echo json_encode(['error' => 'Course not found or already deleted']);
        }
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['error' => 'Invalid request method']);
}