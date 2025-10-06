<?php
namespace App\Logger;

class SecurityLogger {
    private $logFile;
    
    public function __construct() {
        $logDir = __DIR__ . '/../../logs';
        if (!file_exists($logDir)) {
            mkdir($logDir, 0777, true);
        }
        $this->logFile = $logDir . '/security.logsecurity.log';
        
        // Vérifier si le fichier existe, sinon le créer
        if (!file_exists($this->logFile)) {
            touch($this->logFile);
            chmod($this->logFile, 0666);
        }
    }
    
    public function log($userId, $action, $level = 'INFO') {
        try {
            $timestamp = date('Y-m-d H:i:s');
            $logEntry = sprintf(
                "[%s] [%s] User ID: %d - %s\n",
                $timestamp,
                $level,
                $userId,
                $action
            );
            
            if (!is_writable($this->logFile)) {
                error_log("Le fichier de log n'est pas accessible en écriture : " . $this->logFile);
                return false;
            }
            
            return file_put_contents($this->logFile, $logEntry, FILE_APPEND);
        } catch (\Exception $e) {
            error_log("Erreur de journalisation : " . $e->getMessage());
            return false;
        }
    }
    
     public function getSecurityLogs() {
        try {
            if (!file_exists($this->logFile)) {
                return [];
            }
            
            $logs = [];
            $lines = file($this->logFile);
            $thirtyDaysAgo = strtotime('-30 days');
            
            foreach (array_reverse($lines) as $line) {
                if (preg_match('/\[(.*?)\] \[(.*?)\] User ID: (.*?) - (.*)/', $line, $matches)) {
                    $logDate = strtotime($matches[1]);
                    if ($logDate >= $thirtyDaysAgo) {
                        $logs[] = [
                            'date' => $matches[1],
                            'level' => $matches[2],
                            'user_id' => $matches[3],
                            'message' => $matches[4]
                        ];
                    }
                }
            }
            
            return $logs;
        } catch (\Exception $e) {
            error_log("Erreur lors de la lecture des logs de sécurité : " . $e->getMessage());
            return [];
        }
    }
}