<?php
namespace App\Controllers;

use App\Logger\AdminLogger;

class AdminController {
    private $logger;
    private $pdo;
    
    public function __construct() {
        $this->pdo = require __DIR__ . '/../../config/database.php';
        $this->logger = new AdminLogger($this->pdo);
    }
    
    public function viewLogs() {
        $logs = $this->logger->getAdminLogs();
        include __DIR__ . '/../../views/admin/logs.php';
    }
    
    public function dashboard() {
        // Log l'accès au dashboard
        $this->logger->log(
            $_SESSION['user_id'],
            'Accès au dashboard administrateur'
        );
        include __DIR__ . '/../../admin/dashboard.php';
    }
    
    public function manageUsers() {
        // Récupérer tous les utilisateurs de la base de données
        $stmt = $this->pdo->query("SELECT * FROM users ORDER BY id DESC");
        $users = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        
        $this->logger->log(
            $_SESSION['user_id'],
            'Accès à la gestion des utilisateurs'
        );
        
        // Passer les utilisateurs à la vue
        include __DIR__ . '/../../admin/users.php';
    }
    
    public function manageCourses() {
        // Récupérer tous les cours de la base de données
        $stmt = $this->pdo->query("SELECT * FROM courses ORDER BY id DESC");
        $courses = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        
        $this->logger->log(
            $_SESSION['user_id'],
            'Accès à la gestion des cours'
        );
        
        // Passer les cours à la vue
        include __DIR__ . '/../../admin/manage-courses.php';
    }
    
    public function deleteUser() {
        try {
            if (!isset($_POST['user_id'])) {
                throw new \Exception('ID utilisateur manquant');
            }
            
            $userId = $_POST['user_id'];
            
            // Vérifier si l'utilisateur existe
            $checkStmt = $this->pdo->prepare("SELECT id FROM users WHERE id = ?");
            $checkStmt->execute([$userId]);
            if (!$checkStmt->fetch()) {
                throw new \Exception('Utilisateur non trouvé');
            }
            
            // Supprimer l'utilisateur
            $stmt = $this->pdo->prepare("DELETE FROM users WHERE id = ?");
            $stmt->execute([$userId]);
            
            $this->logger->log(
                $_SESSION['user_id'],
                'Suppression de l\'utilisateur #' . $userId
            );
            
            header('Location: index.php?page=admin/users&success=deleted');
            exit;
        } catch (\Exception $e) {
            header('Location: index.php?page=admin/users&error=' . urlencode($e->getMessage()));
            exit;
        }
    }

    public function addCourse() {
        try {
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                throw new \Exception('Méthode non autorisée');
            }

            $title = trim($_POST['title'] ?? '');
            $description = trim($_POST['description'] ?? '');
            
            if (empty($title) || empty($description)) {
                throw new \Exception('Tous les champs sont obligatoires');
            }

            $stmt = $this->pdo->prepare("INSERT INTO courses (title, description) VALUES (?, ?)");
            $stmt->execute([$title, $description]);
            
            $this->logger->log(
                $_SESSION['user_id'],
                'Ajout d\'un nouveau cours: ' . $title
            );
            
            header('Location: index.php?page=admin/courses&success=Le cours a été ajouté avec succès');
            exit;
            
        } catch (\Exception $e) {
            header('Location: index.php?page=admin/courses&error=' . urlencode($e->getMessage()));
            exit;
        }
    }
}