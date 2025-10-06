<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>À propos - LearnSphere</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>
    <header class="site-header">
        <div class="logo">
            <img src="images/logo.jpg" alt="LearnSphere Logo">
        </div>
        <nav class="main-nav">
            <a href="index.php">Accueil</a>
            <a href="about.php" class="active">À propos</a>
            <a href="faq.html">FAQ</a>
            <?php if (isset($_SESSION['user_id'])): ?>
            <?php else: ?>
                <a href="auth/login.php" class="btn-small login">Connexion</a>
                <a href="auth/register.php" class="btn-small signup">Inscription</a>
            <?php endif; ?>
        </nav>
    </header>

    <main>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card shadow">
                        <div class="card-body">
                            <h1 class="text-center mb-4">À propos de LearnSphere</h1>
                            
                            <div class="about-section mb-5">
                                <h2 class="h4 text-primary mb-3">Notre Mission</h2>
                                <p>LearnSphere est une plateforme éducative innovante dédiée à l'apprentissage en ligne. Notre mission est de rendre l'éducation accessible à tous, en offrant des cours de qualité et un environnement d'apprentissage interactif.</p>
                            </div>

                            <div class="services-section mb-5">
                                <h2 class="h4 text-primary mb-3">Nos Services</h2>
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="service-card p-3 border rounded">
                                            <h3 class="h5 mb-3">Cours en Ligne</h3>
                                            <p>Accédez à une large gamme de cours en ligne, créés par des experts dans leur domaine.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="service-card p-3 border rounded">
                                            <h3 class="h5 mb-3">Suivi Personnalisé</h3>
                                            <p>Bénéficiez d'un suivi personnalisé de vos progrès et recevez des recommandations adaptées.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="features-section mb-5">
                                <h2 class="h4 text-primary mb-3">Nos Points Forts</h2>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                                        Contenus pédagogiques de qualité
                                    </li>
                                    <li class="mb-3">
                                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                                        Interface intuitive et moderne
                                    </li>
                                    <li class="mb-3">
                                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                                        Support technique réactif
                                    </li>
                                    <li class="mb-3">
                                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                                        Communauté active d'apprenants
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; <?php echo date('Y'); ?> LearnSphere. Tous droits réservés.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>