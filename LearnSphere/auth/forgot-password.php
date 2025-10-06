<?php
require_once __DIR__ . '/../vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require_once __DIR__ . '/../app/Mail/Mailer.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/security/token_manager.php';

// Initialiser la connexion PDO
$pdo = require __DIR__ . '/../config/database.php';

$error = null;
$success = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    
    try {
        // Vérifier si l'utilisateur existe et est un étudiant
        $stmt = $pdo->prepare('SELECT id, role FROM users WHERE email = ? AND role = "student"');
        $stmt->execute([$email]);
        $user = $stmt->fetch();
        
        if ($user) {
            $token = bin2hex(random_bytes(32));
            $expiry = date('Y-m-d H:i:s', strtotime('+1 hour'));
            
            // Supprimer les anciennes demandes de réinitialisation pour cet email
            $stmt = $pdo->prepare('DELETE FROM password_resets WHERE email = ?');
            $stmt->execute([$email]);
            
            // Créer une nouvelle demande de réinitialisation
            $stmt = $pdo->prepare('INSERT INTO password_resets (email, token, expires_at) VALUES (?, ?, ?)');
            $stmt->execute([$email, $token, $expiry]);
            
            $mailer = new \App\Mail\Mailer();
            if ($mailer->sendPasswordReset($email, $token)) {
                $success = "Un email de réinitialisation a été envoyé à votre adresse. Veuillez vérifier votre boîte de réception.";
            } else {
                $error = "Erreur lors de l'envoi de l'email. Veuillez réessayer plus tard.";
            }
        } else {
            // Message générique pour éviter la divulgation d'informations
            $error = "Si cette adresse email est associée à un compte étudiant, vous recevrez un email de réinitialisation.";
        }
    } catch (PDOException $e) {
        error_log("Erreur de réinitialisation de mot de passe : " . $e->getMessage());
        $error = "Une erreur est survenue. Veuillez réessayer plus tard.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mot de passe oublié</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center">Réinitialisation du mot de passe</h3>
                        
                        <?php if ($error): ?>
                            <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
                        <?php endif; ?>
                        
                        <?php if ($success): ?>
                            <div class="alert alert-success"><?= htmlspecialchars($success) ?></div>
                        <?php endif; ?>
                        
                        <form method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email :</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100">Réinitialiser le mot de passe</button>
                        </form>
                        
                        <div class="text-center mt-3">
                            <a href="../auth/login.php">Retour à la connexion</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>