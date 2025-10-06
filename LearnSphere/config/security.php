<?php
// Configuration des clés secrètes pour la sécurité de l'application
 return [
    'secret_key' => bin2hex(random_bytes(32)), // Génère une clé secrète aléatoire de 64 caractères
    'encryption_key' => base64_encode(random_bytes(32)) // Génère une clé de chiffrement aléatoire de 44 caractères
];