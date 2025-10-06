<?php
// Désactiver l'affichage des erreurs
error_reporting(0);
ini_set('display_errors', 0);

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/classes/DBSessionHandler.php';

// Get the database connection
$db = require __DIR__ . '/config/database.php';

// Set session save handler before any session operation
$handler = new DBSessionHandler($db);
session_set_save_handler($handler, true);

// Configure session parameters
ini_set('session.gc_probability', 1);
ini_set('session.gc_divisor', 100);
ini_set('session.gc_maxlifetime', 1440);
ini_set('session.use_strict_mode', 1);
ini_set('session.use_cookies', 1);
ini_set('session.use_only_cookies', 1);
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 0);
ini_set('session.cookie_samesite', 'Lax');
ini_set('session.cookie_lifetime', 0);

// Démarrer la session
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Vérifier si l'utilisateur est connecté
$isLoggedIn = isset($_SESSION['user_id']);
$userRole = $_SESSION['role'] ?? null;

require_once __DIR__ . '/app/Router.php';
use App\Router;

$router = new Router();
$router->dispatch();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>LearnSphere - Accueil</title>
  <link rel="stylesheet" href="../css/index_style.css" />
</head>
<body>
  <!-- En-tête -->
  <header class="header">
    <div class="container">
      <div class="logo">
        <img src="images/logo.jpg" alt="LearnSphere Logo" />
        <h1>LearnSphere</h1>
      </div>
      <nav class="main-nav" role="navigation" aria-label="Navigation principale">
        <a href="about.php" aria-current="page">À propos</a>
        
        <a href="auth/login.php" class="btn-small btn-login">Connexion</a>
        <a href="auth/register.php" class="btn-small btn-register">Inscription</a>
      </nav>
      </div>
  </header>

  <!-- Section À propos -->
  <section class="about">
    <div class="container about-container">
      <div class="about-logo">
        <img src="images/logo.jpg" alt="LearnSphere Logo" />
      </div>
      <div class="about-text">
        <h2>Bienvenue sur <span class="highlight">LearnSphere</span> 🎓</h2>
        <p>
          LearnSphere est une <strong>plateforme e-learning innovante</strong> qui vous offre des
          <strong>cours de qualité</strong>, des <strong>quiz interactifs</strong> et un
          <strong>suivi personnalisé de votre progression</strong>.
        </p>
        <p class="motivation">
          🚀 Lancez votre apprentissage dès aujourd'hui, à votre rythme et selon vos objectifs !
        </p>
        <p class="motivation">
          💡 Apprenez. Progressez. Réussissez avec <span class="highlight">LearnSphere</span> !
        </p>
        <div class="auth-links">
          <a href="auth/register.php" class="btn-start">S'inscrire gratuitement</a>
          <p class="login-text">Déjà membre ? <a href="auth/login.php">Connectez-vous</a></p>
        </div>
      </div>
    </div>
  </section>

  <!-- Pied de page -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <p>&copy; 2025 LearnSphere. Tous droits réservés.</p>
    </div>
  </footer>
</body>
</html>