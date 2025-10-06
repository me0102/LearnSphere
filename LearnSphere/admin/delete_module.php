<?php
require_once('db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['moduleId'])) {
    $moduleId = $_POST['moduleId'];
    
    try {
        $pdo->beginTransaction();

        // Supprimer d'abord les cours associés
        $stmt = $pdo->prepare("DELETE FROM courses WHERE module_id = ?");
        $stmt->execute([$moduleId]);
        
        // Supprimer les quiz associés
        $stmt = $pdo->prepare("DELETE FROM quizzes WHERE module_id = ?");
        $stmt->execute([$moduleId]);
        
        // Enfin, supprimer le module
        $stmt = $pdo->prepare("DELETE FROM modules WHERE id = ?");
        $stmt->execute([$moduleId]);
        
        $pdo->commit();
        echo json_encode(['success' => true, 'message' => 'Module supprimé avec succès']);
    } catch (PDOException $e) {
        $pdo->rollBack();
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Erreur lors de la suppression du module: ' . $e->getMessage()]);
    }
} else {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'ID du module non fourni']);
}
?>