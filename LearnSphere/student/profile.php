<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

session_start();
require_once '../config/database.php'; // Inclure la connexion à la base de données

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header('Location: ../auth/login.php'); // Rediriger vers la page de connexion si non connecté
    exit();
}

$user_id = $_SESSION['user_id'];

// Récupérer les informations de l'utilisateur
$stmt = $pdo->prepare("SELECT first_name, last_name, email, password FROM users WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupérer les données du formulaire
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $password_hash = password_hash($password, PASSWORD_BCRYPT); // Hacher le mot de passe

    // Mettre à jour les informations de l'utilisateur
    $stmt = $pdo->prepare("UPDATE users SET first_name = ?, last_name = ?, email = ?, password = ?, updated_at = NOW() WHERE id = ?");
    $stmt->execute([$first_name, $last_name, $email, $password_hash, $user_id]);

    // Message de succès
    $message = "Profil mis à jour avec succès !";
}

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mon Profil - LearnSphere</title>
    <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
<header class="header">
    <div class="container">
      <div class="logo">
        <img src="../images/logo.jpg" alt="LearnSphere Logo" />
        <h1>LearnSphere</h1>
      </div>
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

  

  <main class="profile-container">
    <section class="profile-info">
      <h2>Informations personnelles</h2>
      <?php if (isset($message)) { echo "<p>$message</p>"; } ?>
      <form method="POST" action="profile.php">
        <label for="first_name">Prénom :</label>
        <input type="text" id="first_name" name="first_name" value="<?= htmlspecialchars($user['first_name']) ?>" required />
        
        <label for="last_name">Nom :</label>
        <input type="text" id="last_name" name="last_name" value="<?= htmlspecialchars($user['last_name']) ?>" required />
        
        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="<?= htmlspecialchars($user['email']) ?>" required />
        
        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" placeholder="********" />

        <button type="submit">Mettre à jour</button>
      </form>
    </section>
  </main>

  <footer>
    <p>&copy; 2025 LearnSphere. Tous droits réservés.</p>
  </footer>
</body>
</html>
