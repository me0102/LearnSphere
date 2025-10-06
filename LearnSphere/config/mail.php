<?php
$pdo = require __DIR__ . '/database.php';

try {
    $stmt = $pdo->query("SELECT * FROM email_config LIMIT 1");
    $config = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($config) {
        return [
            'smtp_host' => $config['smtp_host'],
            'smtp_username' => $config['smtp_username'],
            'smtp_password' => $config['smtp_password'],
            'smtp_port' => $config['smtp_port'],
            'smtp_secure' => $config['smtp_secure'],
            'from_email' => $config['from_email'],
            'from_name' => $config['from_name']
        ];
    }
} catch (PDOException $e) {
    error_log("Erreur lors de la récupération de la configuration email : " . $e->getMessage());
}

// Configuration par défaut si aucune configuration n'est trouvée
return [
    'smtp_host' => 'smtp.gmail.com',
    'smtp_username' => '',
    'smtp_password' => '',
    'smtp_port' => 587,
    'smtp_secure' => 'tls',
    'from_email' => '',
    'from_name' => 'LearnSphere'
];