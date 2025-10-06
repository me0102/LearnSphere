<?php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/Logger/AdminLogger.php';

session_start();

// Vérification de l'authentification admin
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
    header('Location: ../auth/login.php');
    exit;
}

$pdo = require __DIR__ . '/../config/database.php';
$adminLogger = new App\Logger\AdminLogger($pdo);

$message = '';
$error = '';

// Traitement du formulaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Mise à jour ou insertion des paramètres
        $stmt = $pdo->prepare("INSERT INTO email_config 
            (smtp_host, smtp_username, smtp_password, smtp_port, smtp_secure, from_email, from_name) 
            VALUES (?, ?, ?, ?, ?, ?, ?) 
            ON DUPLICATE KEY UPDATE 
            smtp_host = VALUES(smtp_host),
            smtp_username = VALUES(smtp_username),
            smtp_password = VALUES(smtp_password),
            smtp_port = VALUES(smtp_port),
            smtp_secure = VALUES(smtp_secure),
            from_email = VALUES(from_email),
            from_name = VALUES(from_name)");

        $stmt->execute([
            $_POST['smtp_host'],
            $_POST['smtp_username'],
            $_POST['smtp_password'],
            $_POST['smtp_port'],
            $_POST['smtp_secure'],
            $_POST['from_email'],
            $_POST['from_name']
        ]);

        $adminLogger->log($_SESSION['user_id'], 'Mise à jour configuration email', 'Configuration SMTP modifiée');
        $message = 'Configuration email mise à jour avec succès';
    } catch (PDOException $e) {
        $error = 'Erreur lors de la mise à jour : ' . $e->getMessage();
    }
}

// Récupération des paramètres actuels
try {
    $stmt = $pdo->query("SELECT * FROM email_config LIMIT 1");
    $config = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $error = 'Erreur lors de la récupération des paramètres : ' . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configuration Email - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Configuration Email</h2>
        
        <?php if ($message): ?>
            <div class="alert alert-success"><?= htmlspecialchars($message) ?></div>
        <?php endif; ?>
        
        <?php if ($error): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <form method="post" class="mt-4">
            <div class="mb-3">
                <label for="smtp_host" class="form-label">Serveur SMTP</label>
                <input type="text" class="form-control" id="smtp_host" name="smtp_host" 
                       value="<?= htmlspecialchars($config['smtp_host'] ?? 'smtp.gmail.com') ?>" required>
            </div>

            <div class="mb-3">
                <label for="smtp_username" class="form-label">Email</label>
                <input type="email" class="form-control" id="smtp_username" name="smtp_username"
                       value="<?= htmlspecialchars($config['smtp_username'] ?? '') ?>" required>
            </div>

            <div class="mb-3">
                <label for="smtp_password" class="form-label">Mot de passe d'application</label>
                <input type="password" class="form-control" id="smtp_password" name="smtp_password"
                       value="<?= htmlspecialchars($config['smtp_password'] ?? '') ?>" required>
            </div>

            <div class="mb-3">
                <label for="smtp_port" class="form-label">Port SMTP</label>
                <input type="number" class="form-control" id="smtp_port" name="smtp_port"
                       value="<?= htmlspecialchars($config['smtp_port'] ?? '587') ?>" required>
            </div>

            <div class="mb-3">
                <label for="smtp_secure" class="form-label">Sécurité</label>
                <select class="form-control" id="smtp_secure" name="smtp_secure">
                    <option value="tls" <?= ($config['smtp_secure'] ?? 'tls') === 'tls' ? 'selected' : '' ?>>TLS</option>
                    <option value="ssl" <?= ($config['smtp_secure'] ?? '') === 'ssl' ? 'selected' : '' ?>>SSL</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="from_email" class="form-label">Email d'envoi</label>
                <input type="email" class="form-control" id="from_email" name="from_email"
                       value="<?= htmlspecialchars($config['from_email'] ?? '') ?>" required>
            </div>

            <div class="mb-3">
                <label for="from_name" class="form-label">Nom d'affichage</label>
                <input type="text" class="form-control" id="from_name" name="from_name"
                       value="<?= htmlspecialchars($config['from_name'] ?? 'LearnSphere') ?>" required>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>