<?php
class Logger {
    private static $instance = null;
    private $logFile;
    private $securityLogFile;
    
    private function __construct() {
        // Définir les chemins des fichiers de log
        $baseDir = __DIR__ . '/../logs/';
        $this->logFile = $baseDir . 'app.log';
        $this->securityLogFile = $baseDir . 'security.logsecurity.log';
        
        // Créer le dossier logs s'il n'existe pas
        if (!file_exists($baseDir)) {
            mkdir($baseDir, 0755, true);
        }
        
        // S'assurer que les fichiers de log existent
        if (!file_exists($this->logFile)) {
            touch($this->logFile);
            chmod($this->logFile, 0644);
        }
        
        if (!file_exists($this->securityLogFile)) {
            touch($this->securityLogFile);
            chmod($this->securityLogFile, 0644);
        }
    }
    
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new Logger();
        }
        return self::$instance;
    }
    
    public function log($message, $level = 'INFO', $context = [], $isSecurityLog = false) {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        
        $timestamp = date('Y-m-d H:i:s');
        $ip = $_SERVER['REMOTE_ADDR'] ?? 'unknown';
        $user = $_SESSION['user_id'] ?? 'guest';
        $url = $_SERVER['REQUEST_URI'] ?? 'unknown';
        
        $logMessage = sprintf(
            "[%s] [%s] [IP:%s] [User:%s] [URL:%s] %s",
            $timestamp,
            $level,
            $ip,
            $user,
            $url,
            $message
        );
        
        if (!empty($context)) {
            $logMessage .= " Context: " . json_encode($context, JSON_UNESCAPED_UNICODE);
        }
        
        $logMessage .= "\n";
        
        $targetFile = $isSecurityLog ? $this->securityLogFile : $this->logFile;
        
        if (!@file_put_contents($targetFile, $logMessage, FILE_APPEND)) {
            error_log("Erreur d'écriture dans le fichier de log: " . $targetFile);
        }
    }
    
    public function debug($message, $context = []) {
        $this->log($message, 'DEBUG', $context);
    }
    
    public function info($message, $context = []) {
        $this->log($message, 'INFO', $context);
    }
    
    public function warning($message, $context = []) {
        $this->log($message, 'WARNING', $context);
    }
    
    public function error($message, $context = []) {
        $this->log($message, 'ERROR', $context);
    }
    
    public function getLogs($level = null, $limit = 100) {
        $logs = file($this->logFile);
        $filteredLogs = [];
        
        foreach ($logs as $log) {
            if ($level === null || strpos($log, "[$level]") !== false) {
                $filteredLogs[] = $log;
            }
        }
        
        return array_slice(array_reverse($filteredLogs), 0, $limit);
    }
    
    // Nouvelle méthode pour les logs de sécurité
    public function security($message, $context = []) {
        $this->log($message, 'SECURITY', $context, true);
    }
}
?>