<?php
require_once __DIR__ . '/../config/database.php';

// Activation des erreurs pour le débogage
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Vérification de la connexion PDO
try {
    $pdo = require __DIR__ . '/../config/database.php';
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    error_log('Erreur de connexion à la base de données : ' . $e->getMessage());
    die('Erreur de connexion à la base de données');
}

class DBSessionHandler implements SessionHandlerInterface {
    private $pdo;
    
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }
    
    public function open($path, $name): bool {
        return true;
    }
    
    public function close(): bool {
        return true;
    }
    
    public function read($id): string|false {
        try {
            $stmt = $this->pdo->prepare('SELECT payload FROM sessions WHERE id = ? AND expires_at > NOW()');
            $stmt->execute([$id]);
            return $stmt->fetchColumn() ?: '';
        } catch (PDOException $e) {
            error_log('Erreur de lecture de session : ' . $e->getMessage());
            return '';
        }
    }
    
    public function write($id, $data): bool {
        try {
            // Pour les sessions non authentifiées
            if (!isset($_SESSION['user_id'])) {
                $stmt = $this->pdo->prepare('REPLACE INTO sessions 
                                        (id, data, timestamp, ip_address, user_agent, expires_at) 
                                        VALUES (?, ?, UNIX_TIMESTAMP(), ?, ?, DATE_ADD(NOW(), INTERVAL 1 HOUR))');
                return $stmt->execute([
                    $id,
                    $data,
                    $_SERVER['REMOTE_ADDR'] ?? 'unknown',
                    $_SERVER['HTTP_USER_AGENT'] ?? 'unknown'
                ]);
            }
            
            // Pour les sessions authentifiées
            $stmt = $this->pdo->prepare('REPLACE INTO sessions 
                                    (id, data, timestamp, user_id, ip_address, user_agent, expires_at) 
                                    VALUES (?, ?, UNIX_TIMESTAMP(), ?, ?, ?, DATE_ADD(NOW(), INTERVAL 1 HOUR))');
            return $stmt->execute([
                $id,
                $data,
                $_SESSION['user_id'],
                $_SERVER['REMOTE_ADDR'] ?? 'unknown',
                $_SERVER['HTTP_USER_AGENT'] ?? 'unknown'
            ]);
        } catch (PDOException $e) {
            error_log('Erreur d\'écriture de session : ' . $e->getMessage());
            return false;
        }
    }
    
    public function destroy($id): bool {
        try {
            $this->pdo->prepare('DELETE FROM sessions WHERE id = ?')->execute([$id]);
            return true;
        } catch (PDOException $e) {
            error_log('Erreur de suppression de session : ' . $e->getMessage());
            return false;
        }
    }
    
    public function gc($maxlifetime): int|false {
        try {
            $stmt = $this->pdo->prepare('DELETE FROM sessions WHERE expires_at < NOW()');
            $stmt->execute();
            return $stmt->rowCount();
        } catch (PDOException $e) {
            error_log('Erreur de nettoyage des sessions : ' . $e->getMessage());
            return false;
        }
    }
}

// Initialisation
$pdo = require __DIR__ . '/../config/database.php';
$handler = new DBSessionHandler($pdo);

if (session_status() === PHP_SESSION_NONE) {
    session_set_save_handler($handler, true);
    ini_set('session.cookie_httponly', 1);
    ini_set('session.cookie_secure', 1);
    ini_set('session.use_strict_mode', 1);
    session_start();
}

function regenerateSession() {
    if (!isset($_SESSION['regenerated'])) {
        session_regenerate_id(true);
        $_SESSION['regenerated'] = true;
    }
}
regenerateSession();