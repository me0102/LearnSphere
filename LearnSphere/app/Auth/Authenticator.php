<?php
namespace App\Auth;

require_once __DIR__ . '/../Security.php';

use PDO;

class Authenticator {
    // Define the constant at the class level
    private const LOGIN_ATTEMPTS_LIMIT = 5; // Maximum number of login attempts allowed
    private $db;
    
    public function __construct($pdo) {
        $this->db = $pdo;
    }
    
    public function login($email, $password, $role) {
        if ($this->isLoginBlocked()) {
            $_SESSION['login_blocked_until'] = time() + 3600;
            \Security::logSecurityEvent("Tentative de connexion bloquée - Trop de tentatives", "WARNING");
            return ['success' => false, 'message' => 'Compte temporairement bloqué. Veuillez réessayer dans 1 heure.'];
        }
        
        if (isset($_SESSION['login_blocked_until']) && time() < $_SESSION['login_blocked_until']) {
            $remaining = ceil(($_SESSION['login_blocked_until'] - time()) / 60);
            return ['success' => false, 'message' => "Compte bloqué. Réessayez dans {$remaining} minutes."];
        }
        
        $stmt = $this->db->prepare("SELECT id, password, role FROM users WHERE email = ? AND role = ?");
        $stmt->execute([$email, $role]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($user && password_verify($password, $user['password'])) {
            $this->resetLoginAttempts();
            unset($_SESSION['login_blocked_until']);
            
            return [
                'success' => true,
                'user_id' => $user['id'],  // Ajout de l'ID utilisateur dans le résultat
                'role' => $user['role']    // Ajout du rôle dans le résultat
            ];
        }
        
        $attempts = $this->getLoginAttempts() + 1;
        $remaining = self::LOGIN_ATTEMPTS_LIMIT - $attempts;
        $this->incrementLoginAttempts();
        \Security::logSecurityEvent("Échec de connexion pour l'email: $email (Tentative $attempts/5)", "WARNING");
        return ['success' => false, 'message' => "Identifiants incorrects. Il vous reste $remaining tentatives."];
    }
    
    public function logout() {
        session_destroy();
        session_start();
        \Security::initCSRF();
    }
    
    public function isAuthenticated() {
        return isset($_SESSION['user_id']) && 
               isset($_SESSION['last_activity']) && 
               (time() - $_SESSION['last_activity'] < SESSION_LIFETIME);
    }
    
    private function isLoginBlocked() {
        $ip = $_SERVER['REMOTE_ADDR'];
        $email = $_POST['email'] ?? '';
        
        $stmt = $this->db->prepare("SELECT attempts FROM login_attempts WHERE ip = ? AND email = ? AND last_attempt > DATE_SUB(NOW(), INTERVAL 1 HOUR)");
        $stmt->execute([$ip, $email]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result && $result['attempts'] >= self::LOGIN_ATTEMPTS_LIMIT;
    }
    
    private function incrementLoginAttempts() {
        $ip = $_SERVER['REMOTE_ADDR'];
        $email = $_POST['email'] ?? '';
        
        $stmt = $this->db->prepare("INSERT INTO login_attempts (ip, email, attempts, last_attempt) 
                                   VALUES (?, ?, 1, NOW()) 
                                   ON DUPLICATE KEY UPDATE 
                                   attempts = attempts + 1, 
                                   last_attempt = NOW()");
        $stmt->execute([$ip, $email]);
    }
    
    private function resetLoginAttempts() {
        $ip = $_SERVER['REMOTE_ADDR'];
        $email = $_POST['email'] ?? '';
        
        $stmt = $this->db->prepare("DELETE FROM login_attempts WHERE ip = ? AND email = ?");
        $stmt->execute([$ip, $email]);
    }

    private function getLoginAttempts() {
        $ip = $_SERVER['REMOTE_ADDR'];
        $email = $_POST['email'] ?? '';
        
        $stmt = $this->db->prepare("SELECT attempts FROM login_attempts WHERE ip = ? AND email = ? AND last_attempt > DATE_SUB(NOW(), INTERVAL 1 HOUR)");
        $stmt->execute([$ip, $email]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['attempts'] : 0;
    }
}
?>