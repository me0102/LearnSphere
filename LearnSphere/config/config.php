<?php
// Configuration de la base de données
define('DB_HOST', 'localhost');
define('DB_NAME', 'elearning_db');
define('DB_USER', 'root');
define('DB_PASS', '');

// Configuration de la sécurité
define('SECRET_KEY', 'votre_cle_secrete_ici');
define('CSRF_TOKEN_NAME', 'csrf_token');
define('SESSION_LIFETIME', 3600); // 1 heure

// Configuration des logs
define('LOG_PATH', __DIR__ . '/../logs/');
define('LOG_LEVEL', 'DEBUG'); // DEBUG, INFO, WARNING, ERROR

// Configuration des chemins
define('BASE_PATH', __DIR__ . '/..');
define('PUBLIC_PATH', BASE_PATH . '/public');
define('APP_PATH', BASE_PATH . '/app');

// Configuration des emails
define('SMTP_HOST', 'smtp.example.com');
define('SMTP_PORT', 587);
define('SMTP_USER', 'your-email@example.com');
define('SMTP_PASS', 'your-password');

// Configuration des uploads
define('UPLOAD_PATH', PUBLIC_PATH . '/uploads');
define('MAX_FILE_SIZE', 5242880); // 5MB
define('ALLOWED_FILE_TYPES', ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png']);

// Configuration des taux limites
define('LOGIN_ATTEMPTS_LIMIT', 5);
define('LOGIN_TIMEOUT', 900); // 15 minutes
?> 