<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();
require_once '../config/database.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
  echo json_encode(['success' => false, 'message' => 'Non connecté']);
  exit;
}

$data = json_decode(file_get_contents("php://input"), true);
$chapterId = $data['chapterId'] ?? '';

if (!$chapterId) {
  echo json_encode(['success' => false, 'message' => 'Chapitre non spécifié']);
  exit;
}

$userId = $_SESSION['user_id'];
$courseId = 'ethical_hacking'; // à adapter si besoin

try {
  $stmt = $pdo->prepare("INSERT INTO progression (user_id, course_id, chapter_id, is_completed, completed_at)
                         VALUES (:user_id, :course_id, :chapter_id, 1, NOW())
                         ON DUPLICATE KEY UPDATE is_completed = 1, completed_at = NOW()");
  $stmt->execute([
    'user_id' => $userId,
    'course_id' => $courseId,
    'chapter_id' => $chapterId
  ]);

  echo json_encode(['success' => true]);
} catch (PDOException $e) {
  echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
?>
