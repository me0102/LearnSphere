<?php
function generateToken() {
    return bin2hex(random_bytes(32));
}

function validateToken($token) {
    // Vérifier si le token existe et n'est pas expiré
    global $pdo;
    
    $stmt = $pdo->prepare('SELECT * FROM password_resets WHERE token = ? AND expires_at > NOW() AND used = 0');
    $stmt->execute([$token]);
    return $stmt->fetch();
}

function invalidateToken($token) {
    // Marquer le token comme utilisé
    global $pdo;
    
    $stmt = $pdo->prepare('UPDATE password_resets SET used = 1 WHERE token = ?');
    return $stmt->execute([$token]);
}