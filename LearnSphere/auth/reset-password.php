<?php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/security/password_utils.php';

$error = null;
$success = null;
$token = $_GET['token'] ?? '';

if (empty($token)) {
    header('Location: index.php?page=login');
    exit;
}

// Vérifier la validité du token
$stmt = $pdo->prepare('SELECT email FROM password_resets WHERE token = ? AND expires_at > NOW() AND used = 0');
$stmt->execute([$token]);
$email = $stmt->fetchColumn();

if (!$email) {
    $error = "Ce lien de réinitialisation est invalide ou a expiré.";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !$error) {
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';
    
    if (strlen($password) < 8) {
        $error = "Le mot de passe doit contenir au moins 8 caractères.";
    } elseif ($password !== $confirm_password) {
        $error = "Les mots de passe ne correspondent pas.";
    } else {
        try {
            // Mettre à jour le mot de passe
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare('UPDATE users SET password = ? WHERE email = ?');
            $stmt->execute([$hashedPassword, $email]);
            
            // Marquer le token comme utilisé
            $stmt = $pdo->prepare('UPDATE password_resets SET used = 1 WHERE token = ?');
            $stmt->execute([$token]);
            
            $success = "Votre mot de passe a été réinitialisé avec succès.";
        } catch (PDOException $e) {
            error_log("Erreur de réinitialisation : " . $e->getMessage());
            $error = "Une erreur est survenue. Veuillez réessayer plus tard.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réinitialisation du mot de passe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center">Nouveau mot de passe</h3>
                        
                        <?php if ($error): ?>
                            <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
                        <?php endif; ?>
                        
                        <?php if ($success): ?>
                            <div class="alert alert-success">
                                <?= htmlspecialchars($success) ?>
                                <br>
                                <a href="index.php?page=login">Connectez-vous</a>
                            </div>
                        <?php elseif (!$error): ?>
                            <form method="post">
                                <div class="mb-3">
                                    <label for="password" class="form-label">Nouveau mot de passe :</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="confirm_password" class="form-label">Confirmer le mot de passe :</label>
                                    <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                                </div>
                                
                                <button type="submit" class="btn btn-primary w-100">Changer le mot de passe</button>
                            </form>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>