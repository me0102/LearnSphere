<?php
// Define the LOG_PATH constant at the beginning of the file
define('LOG_PATH', __DIR__ . '/../logs/security.logsecurity.log');

class Security {
    public static function init() {
        // Protection contre les attaques XSS
        self::sanitizeInput();
        
        // Protection CSRF
        self::initCSRF();
        
        // Sécurisation des headers
        self::secureHeaders();
        
        // Protection contre le clickjacking
        header('X-Frame-Options: SAMEORIGIN');
        
        // Protection contre le sniffing de contenu
        header('X-Content-Type-Options: nosniff');
        
        // Protection contre le XSS dans les anciens navigateurs
        header('X-XSS-Protection: 1; mode=block');
    }
    
    public static function sanitizeInput() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $_POST = array_map('htmlspecialchars', $_POST);
        }
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $_GET = array_map('htmlspecialchars', $_GET);
        }
    }
    
    public static function initCSRF() {
        if (empty($_SESSION[CSRF_TOKEN_NAME])) {
            $_SESSION[CSRF_TOKEN_NAME] = bin2hex(random_bytes(32));
        }
    }
    
    public static function secureHeaders() {
        header('Strict-Transport-Security: max-age=31536000; includeSubDomains');
        header('Content-Security-Policy: default-src \'self\'');
    }
    
    public static function validateCSRF($token) {
        return isset($_SESSION[CSRF_TOKEN_NAME]) && 
               hash_equals($_SESSION[CSRF_TOKEN_NAME], $token);
    }
    
    public static function logSecurityEvent($event, $level = 'INFO') {
        $logFile = LOG_PATH . 'security.log';
        $timestamp = date('Y-m-d H:i:s');
        $message = "[$timestamp] [$level] $event\n";
        file_put_contents($logFile, $message, FILE_APPEND);
    }

    public function encryptData($data) {
        $cipher = "AES-256-CBC";
        $key = getenv('ENCRYPTION_KEY'); // Clé à configurer dans vos variables d'environnement
        $ivlen = openssl_cipher_iv_length($cipher);
        $iv = openssl_random_pseudo_bytes($ivlen);
        $encrypted = openssl_encrypt($data, $cipher, $key, 0, $iv);
        return base64_encode($iv . $encrypted);
    }

    public function decryptData($encryptedData) {
        $cipher = "AES-256-CBC";
        $key = getenv('ENCRYPTION_KEY');
        $data = base64_decode($encryptedData);
        $ivlen = openssl_cipher_iv_length($cipher);
        $iv = substr($data, 0, $ivlen);
        $encrypted = substr($data, $ivlen);
        return openssl_decrypt($encrypted, $cipher, $key, 0, $iv);
    }
}
?>