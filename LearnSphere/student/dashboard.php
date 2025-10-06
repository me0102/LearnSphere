<?php
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'student') {
    header('Location: ../auth/login.php');
    exit;
}

// Gérer la déconnexion
if (isset($_GET['logout'])) {
    session_destroy();
    header('Location: ../index.php');
    exit;
}
require_once __DIR__ . '/../config/database.php';
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
  <header class="header">
    <div class="container">
      <div class="logo">
        <img src="../images/logo.jpg" alt="LearnSphere Logo" />
        <h1>LearnSphere</h1>
      </div>
      <div>
      <nav class="main-nav">
                <ul>
                    <li><a href="dashboard.php"class="active"><i class="fas fa-tachometer-alt"></i> <span>Home</span></a></li>
                    <li><a href="courses.html"><i class="fas fa-book"></i> <span>Mes Cours</span></a></li>
                    <li><a href="../evaluation/index.php"><span>Evaluation</span></a></li>
                    <li><a href="profile.php"><span>profil</span></a></li>
                    <li><a href="contact.html"><i class="fas fa-envelope"></i> <span>Contact us</span></a></li>
                    
                    <li><a href="dashboard.php?logout=1" class="btn-small"><span>Déconnexion</span></a></li>
                </ul>
      </nav>
      </div>
      <style>
        .main-nav ul {
          display: flex;
          list-style: none; /* pour enlever les puces */
          padding: 0;
          margin: 0;
          gap: 20px; /* espace entre les éléments */
        }

        .main-nav li {
          display: inline-block;
        }

        </style>

  </header>

  <section class="about">
    <div class="container about-container">
      <div class="about-logo">
        <img src="../images/logo.jpg" alt="LearnSphere Logo" />
      </div>
      <div class="about-text">
        <h2>Bienvenue sur <span class="highlight">LearnSphere</span> 🎓</h2>
        <p class="welcome-message">
          Bonjour <?php 
            if (isset($_SESSION['firstname']) && isset($_SESSION['lastname'])) {
              echo htmlspecialchars($_SESSION['firstname'] . ' ' . $_SESSION['lastname']);
            } else {
              echo "";
            }
          ?>, nous sommes ravis de vous revoir !
        </p>
        <p>
          LearnSphere est une <strong>plateforme e-learning innovante</strong> qui vous offre des
          <strong>cours de qualité</strong>, des <strong>quiz interactifs</strong> et un
          <strong>suivi personnalisé de votre progression</strong>.
        </p>
        <p class="motivation">
          🚀 Lancez votre apprentissage dès aujourd’hui, à votre rythme et selon vos objectifs !
        </p>
        <p class="motivation">
          💡 Apprenez. Progressez. Réussissez avec <span class="highlight">LearnSphere</span> !
        </p>
        <a href="courses.html" class="btn-start">Commencer maintenant</a>
      </div>
    </div>
  </section>

  <section class="courses">
    <div class="container">
      <h2>Nos Cours Populaires</h2>
      <div class="course-grid">
        <div class="course-card">
          <img src="../images/ethical_hacking.jpg" alt="Ethical Hacking">
          <h3>Ethical Hacking</h3>
          <p>Apprenez les bases du hacking éthique et de la cybersécurité.</p>
        </div>
        <div class="course-card">
          <img src="../images/cryptographie.jpg" alt="Cryptographie">
          <h3>Cryptographie</h3>
          <p>Comprenez les principes de chiffrement et la sécurité des données.</p>
        </div>
        <div class="course-card">
          <img src="../images/linux.jpg" alt="Linux">
          <h3>Linux</h3>
          <p>Maîtrisez les commandes essentielles de Linux pour l'administration système.</p>
        </div>
        <div class="course-card">
          <img src="../images/python.jpg" alt="Python">
          <h3>Python</h3>
          <p>Débutez ou perfectionnez-vous en programmation Python.</p>
        </div>
        <div class="course-card">
          <img src="../images/javascript.jpg" alt="JavaScript">
          <h3>JavaScript</h3>
          <p>Créez des interfaces dynamiques avec JavaScript moderne.</p>
        </div>
        <div class="course-card">
          <img src="../images/html.jpg" alt="HTML">
          <h3>HTML</h3>
          <p>Structurez vos pages web grâce à HTML5.</p>
        </div>
        <div class="course-card">
          <img src="../images/php.jpg" alt="PHP">
          <h3>PHP</h3>
          <p>Apprenez à développer des applications back-end avec PHP.</p>
        </div>
        <div class="course-card">
          <img src="../images/sql.jpg" alt="SQL">
          <h3>SQL</h3>
          <p>Interrogez et gérez des bases de données avec SQL.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Pied de page -->
  <footer class="footer">
    <div class="container">
      <p>&copy; 2025 LearnSphere. Tous droits réservés.</p>
    </div>
  </footer>
</body>
</html>



