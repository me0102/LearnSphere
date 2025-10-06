<?php
namespace App\Controllers;

class AuthController {
    private $db;

    public function __construct($pdo) {
        $this->db = $pdo;
    }

    public function login() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
            $password = $_POST['password'] ?? '';

            try {
                $stmt = $this->db->prepare('SELECT * FROM users WHERE email = ? LIMIT 1');
                $stmt->execute([$email]);
                $user = $stmt->fetch(\PDO::FETCH_ASSOC);

                if ($user && password_verify($password, $user['password'])) {
                    // Régénérer l'ID de session pour la sécurité
                    session_regenerate_id(true);
                    
                    // Stocker les informations de l'utilisateur en session
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['role'] = $user['role'];
                    $_SESSION['email'] = $user['email'];
                    $_SESSION['user_ip'] = $_SERVER['REMOTE_ADDR'];
                    $_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
                    
                    // Mettre à jour la dernière connexion
                    $updateStmt = $this->db->prepare('UPDATE users SET last_login = NOW() WHERE id = ?');
                    $updateStmt->execute([$user['id']]);
                    
                    // Redirection basée sur le rôle
                    if ($user['role'] === 'admin') {
                        header('Location: ../admin/dashboard.php');
                        exit;
                    } else if ($user['role'] === 'student') {
                        header('Location: ../student/dashboard.php');
                        exit;
                    } else {
                        // Rôle non reconnu
                        session_destroy();
                        return ['error' => 'Rôle utilisateur non valide'];
                    }
                } else {
                    return ['error' => 'Identifiants invalides'];
                }
            } catch (\PDOException $e) {
                error_log("Erreur de connexion : " . $e->getMessage());
                return ['error' => 'Une erreur technique est survenue'];
            }
        }
        
        return ['view' => 'auth/login'];
    }
}