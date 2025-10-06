<?php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/Logger/SecurityLogger.php';
require_once __DIR__ . '/../app/Logger/AdminLogger.php';

// Vérifier si l'utilisateur est connecté et est un administrateur
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
    header('Location: ../auth/login.php');
    exit;
}

// Initialiser les loggers
$pdo = require __DIR__ . '/../config/database.php';
$adminLogger = new App\Logger\AdminLogger($pdo);
$securityLogger = new App\Logger\SecurityLogger();

// Récupérer les logs
$adminLogs = $adminLogger->getAdminLogs();
$securityLogs = $securityLogger->getSecurityLogs();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Journaux d'activité - LearnSphere</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
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
            <a href="dashboard.php" class="nav-link"><i class="bi bi-speedometer2"></i> Tableau de bord</a>
            <a href="users.php" class="nav-link"><i class="bi bi-people"></i> Utilisateurs</a>
            <a href="manage-courses.php" class="nav-link"><i class="bi bi-book"></i> Cours</a>
            <a href="logs.php" class="nav-link active"><i class="bi bi-journal-text"></i> Journaux</a>
            <a href="../index.php" class="nav-link text-danger"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
        </nav>
    </header>

    <main class="dashboard-container py-4">
        <div class="container">
            <h1 class="mb-4">
                <i class="bi bi-journal-text me-2"></i>
                Journaux d'activité
            </h1>

            <!-- Logs administrateurs -->
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <h2 class="h5 mb-0">
                        <i class="bi bi-shield-lock me-2"></i>
                        Logs Administrateurs
                    </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Administrateur</th>
                                    <th>Action</th>
                                    <th>Détails</th>
                                    <th>IP</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($adminLogs as $log): ?>
                                <tr>
                                    <td><?= htmlspecialchars($log['created_at']) ?></td>
                                    <td><?= htmlspecialchars($log['user_email']) ?></td>
                                    <td><?= htmlspecialchars($log['action']) ?></td>
                                    <td><?= htmlspecialchars($log['details']) ?></td>
                                    <td><?= htmlspecialchars($log['ip_address']) ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Logs de sécurité -->
            <div class="card">
                <div class="card-header bg-warning">
                    <h2 class="h5 mb-0">
                        <i class="bi bi-shield-exclamation me-2"></i>
                        Logs de Sécurité
                    </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Niveau</th>
                                    <th>Utilisateur</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (empty($securityLogs)): ?>
                                    <tr>
                                        <td colspan="4" class="text-center">Aucun log de sécurité disponible</td>
                                    </tr>
                                <?php else: ?>
                                    <?php foreach ($securityLogs as $log): ?>
                                        <tr>
                                            <td><?= htmlspecialchars($log['date']) ?></td>
                                            <td>
                                                <span class="badge <?= strtolower($log['level']) === 'warning' ? 'bg-warning' : 'bg-info' ?>">
                                                    <?= htmlspecialchars($log['level']) ?>
                                                </span>
                                            </td>
                                            <td><?= htmlspecialchars($log['user_id']) ?></td>
                                            <td><?= htmlspecialchars($log['message']) ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>