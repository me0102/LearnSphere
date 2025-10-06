<?php

define('MAX_FAILED_ATTEMPTS', 5); // max tentatives
define('LOCKOUT_DURATION', 15);   // en minutes

/**
 * Enregistre une tentative échouée pour un utilisateur
 */
function record_failed_attempt($email, $pdo) {
    $stmt = $pdo->prepare("SELECT failed_attempts, last_failed_at FROM login_attempts WHERE email = ?");
    $stmt->execute([$email]);
    $entry = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($entry) {
        $stmt = $pdo->prepare("UPDATE login_attempts SET failed_attempts = failed_attempts + 1, last_failed_at = NOW() WHERE email = ?");
        $stmt->execute([$email]);
    } else {
        $stmt = $pdo->prepare("INSERT INTO login_attempts (email, failed_attempts, last_failed_at) VALUES (?, 1, NOW())");
        $stmt->execute([$email]);
    }
}

/**
 * Réinitialise les tentatives après un login réussi
 */
function reset_failed_attempts($email, $pdo) {
    $stmt = $pdo->prepare("DELETE FROM login_attempts WHERE email = ?");
    $stmt->execute([$email]);
}

/**
 * Vérifie si le compte est bloqué
 * Retourne false si non bloqué, ou le nombre de minutes restantes si bloqué
 */
function is_account_locked($email, $pdo) {
    $stmt = $pdo->prepare("SELECT failed_attempts, last_failed_at FROM login_attempts WHERE email = ?");
    $stmt->execute([$email]);
    $entry = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($entry && $entry['failed_attempts'] >= MAX_FAILED_ATTEMPTS) {
        $last_failed = strtotime($entry['last_failed_at']);
        $now = time();
        $diff_minutes = ($now - $last_failed) / 60;

        if ($diff_minutes < LOCKOUT_DURATION) {
            return ceil(LOCKOUT_DURATION - $diff_minutes);
        } else {
            reset_failed_attempts($email, $pdo);
        }
    }
    return false;
}
