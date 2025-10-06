<?php
namespace App\Controllers;

class HomeController {
    public function index() {
        // Vérifier si l'utilisateur est connecté
        if (!isset($_SESSION['user_id'])) {
            header('Location: index.php?page=login');
            exit;
        }
        
        // Charger la vue de la page d'accueil
        require_once __DIR__ . '/../../index.php';
    }
}