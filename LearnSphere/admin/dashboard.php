<?php
session_start();

// Vérification de l'authentification et du rôle
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
    header('Location: ../auth/login.php');
    exit;
}

// Inclusion des fichiers nécessaires
require_once __DIR__ . '/../config/database.php';

?><!-- Fichier : admin/dashboard.html -->
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tableau de bord Admin - LearnSphere</title>
  <link rel="stylesheet" href="../css/style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>
    <header class="site-header">
        <div class="logo">
            <a href="../index.php">
                <img src="../images/logo.jpg" alt="LearnSphere Logo" class="img-fluid" style="max-height: 50px;">
            </a>
        </div>
        <nav class="main-nav">
            <a href="dashboard.php" class="nav-link active"><i class="bi bi-speedometer2"></i> Tableau de bord</a>
            <a href="users.php" class="nav-link"><i class="bi bi-people"></i> Utilisateurs</a>
            <a href="manage-courses.php" class="nav-link"><i class="bi bi-book"></i> Cours</a>
            <a href="logs.php" class="nav-link"><i class="bi bi-journal-text"></i> Journaux</a>
            <a href="../index.php" class="nav-link text-danger"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
        </nav>
    </header>
  <main class="dashboard-container">
    <section class="welcome-box">
      <h2>Bienvenue, Admin !</h2>
      <p>Gérez les cours, consultez les statistiques et administrez les utilisateurs.</p>
    </section>

    <section class="quick-links">
      <div class="card">
        <h3>Gérer les Cours</h3>
        <p>Ajouter, modifier ou supprimer des cours.</p>
        <a href="manage-courses.php" class="btn">Accéder</a>
      </div>

      <div class="card">
        <h3>Voir les Utilisateurs</h3>
        <p>Consulter la liste des étudiants inscrits.</p>
        <a href="users.php" class="btn">Accéder</a>
      </div>

      <div class="card">
        <h3>logs</h3>
        <p>Voir les statistiques d’utilisation .</p>
        <a href="logs.php" class="btn">Voir</a>
      </div>
    </section>
  </main>

  <footer>
    <p>&copy; 2025 LearnSphere. Tous droits réservés.</p>
  </footer>
</body>
</html>
