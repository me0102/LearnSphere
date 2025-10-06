<?php
namespace App\Middleware;

class AuthMiddleware {
    public function handle() {
        // Vérifier si une session existe
        if (!isset($_SESSION)) {
            session_start();
        }

        // Vérifier si l'utilisateur est authentifié
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?page=login');
            exit;
        }

        // Vérifier la durée de la session (30 minutes)
        if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > 1800)) {
            session_destroy();
            header('Location: index.php?page=login');
            exit;
        }

        // Vérifier si l'IP de l'utilisateur n'a pas changé
        if (isset($_SESSION['user_ip']) && $_SESSION['user_ip'] !== $_SERVER['REMOTE_ADDR']) {
            session_destroy();
            header('Location: index.php?page=login');
            exit;
        }

        // Vérifier si le User-Agent n'a pas changé
        if (isset($_SESSION['user_agent']) && $_SESSION['user_agent'] !== $_SERVER['HTTP_USER_AGENT']) {
            session_destroy();
            header('Location: index.php?page=login');
            exit;
        }

        // Mettre à jour le timestamp de dernière activité
        $_SESSION['last_activity'] = time();
    }

    public function requireRole($role) {
        if (!isset($_SESSION['role']) || $_SESSION['role'] !== $role) {
            header('HTTP/1.1 403 Forbidden');
            include '../views/403.php';
            exit;
        }
    }
}