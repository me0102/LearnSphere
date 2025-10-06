<?php
namespace App\Logger;

class AdminLogger {
    private $pdo;
    
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }
    
    public function log($userId, $action, $details = null) {
        try {
            $stmt = $this->pdo->prepare('INSERT INTO admin_logs (admin_id, action, details, ip_address) VALUES (?, ?, ?, ?)');
            return $stmt->execute([
                $userId,
                $action,
                $details,
                $_SERVER['REMOTE_ADDR']
            ]);
        } catch (\PDOException $e) {
            error_log("Erreur de journalisation admin : " . $e->getMessage());
            return false;
        }
    }
    
    public function getAdminLogs() {
        try {
            $query = "SELECT al.*, u.email as user_email 
                     FROM admin_logs al 
                     LEFT JOIN users u ON al.admin_id = u.id 
                     ORDER BY al.created_at DESC 
                     LIMIT 100";
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            $logs = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            
            if (empty($logs)) {
                error_log("Aucun log administrateur trouvé dans la base de données");
            }
            
            return $logs;
        } catch (\PDOException $e) {
            error_log("Erreur lors de la récupération des logs admin : " . $e->getMessage());
            return [];
        }
    }
}