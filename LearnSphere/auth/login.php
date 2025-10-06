<?php
require_once __DIR__ . '/../app/Middleware/AuthMiddleware.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/password_utils.php';
require_once __DIR__ . '/brute_force_protection.php';
require_once __DIR__ . '/../app/Auth/Authenticator.php';

// Activation des erreurs pour le débogage
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Initialisation de la connexion PDO
try {
    $pdo = require __DIR__ . '/../config/database.php';
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    error_log('Erreur de connexion à la base de données : ' . $e->getMessage());
    die('Erreur de connexion à la base de données');
}

// Démarrer la session avant toute sortie
session_start();

// Gestion de la déconnexion
if (isset($_GET['logout'])) {
    session_destroy();
    header('Location: login.php');
    exit;
}

// Protection contre les attaques CSRF
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        $error = "Erreur de sécurité. Veuillez réessayer.";
    } else {
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        $password = $_POST['password'] ?? '';
        $role = $_POST['role'] ?? '';
        
        if (empty($role)) {
            $error = "Veuillez sélectionner un rôle";
        } else {
            // 🔒 Vérification du verrouillage du compte
            $lockout = is_account_locked($email, $pdo);
            if ($lockout !== false) {
                $error = "Trop de tentatives échouées. Veuillez réessayer dans $lockout minute(s).";
            } else {
                $authenticator = new \App\Auth\Authenticator($pdo);
                $result = $authenticator->login($email, $password, $role);
                
                if ($result['success']) {
                    // ✅ Réinitialisation des tentatives échouées
                    reset_failed_attempts($email, $pdo);

                    if (!isset($result['user_id'])) {
                        $error = "Erreur d'authentification : ID utilisateur manquant";
                        error_log("Erreur d'authentification : ID utilisateur manquant dans le résultat");
                    } else {
                        $_SESSION['user_id'] = $result['user_id'];
                        $_SESSION['user_role'] = $role;
                        $_SESSION['last_activity'] = time();
                        $_SESSION['user_ip'] = $_SERVER['REMOTE_ADDR'];
                        $_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];

                        if ($role === 'admin') {
                            $dashboard_path = __DIR__ . '/../admin/dashboard.php';
                            if (file_exists($dashboard_path)) {
                                header('Location: ../admin/dashboard.php');
                                exit();
                            } else {
                                $error = "Erreur : La page de destination n'existe pas";
                                error_log("Erreur : Le fichier dashboard admin n'existe pas : $dashboard_path");
                            }
                        } else {
                            $dashboard_path = __DIR__ . '/../student/dashboard.php';
                            if (file_exists($dashboard_path)) {
                                header('Location: ../student/dashboard.php');
                                exit();
                            } else {
                                $error = "Erreur : La page de destination n'existe pas";
                                error_log("Erreur : Le fichier dashboard étudiant n'existe pas : $dashboard_path");
                            }
                        }
                    }
                } else {
                    // ❌ Enregistrement de la tentative échouée
                    record_failed_attempt($email, $pdo);
                    $error = $result['message'];
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgb(55, 0, 252);
        }
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .login-header h1 {
            color:rgb(0, 13, 255);
            font-size: 2rem;
            margin-bottom: 1rem;
        }
        .login-header img {
            max-width: 150px;
            margin-bottom: 1rem;
        }
        .form-control {
            padding: 0.75rem;
            border-radius: 8px;
            border: 1px solid #dee2e6;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgb(32, 6, 230);
        }
        .btn-primary {
            background-color:rgb(27, 12, 236);
            border-color:rgb(20, 5, 234);
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 500;
        }
        .btn-primary:hover {
            background-color: #34495e;
            border-color: #34495e;
        }
        .alert {
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <img src="../images/logo.jpg" alt="LearnSphere Logo">
                <h1>Connexion</h1>
            </div>
            
            <?php if (isset($error)): ?>
                <div class="alert alert-danger" role="alert">
                    <?= htmlspecialchars($error) ?>
                </div>
            <?php endif; ?>

            <form method="post" class="needs-validation" novalidate>
                <input type="hidden" name="csrf_token" value="<?= $_SESSION['csrf_token'] ?>">
                
                <div class="mb-4">
                    <label for="email" class="form-label">Adresse email</label>
                    <input type="email" class="form-control" id="email" name="email" required 
                           placeholder="Entrez votre email">
                    <div class="invalid-feedback">
                        Veuillez entrer une adresse email valide
                    </div>
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label">Mot de passe</label>
                    <input type="password" class="form-control" id="password" name="password" required
                           placeholder="Entrez votre mot de passe">
                    <div class="invalid-feedback">
                        Veuillez entrer votre mot de passe
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Type de compte</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="student" value="student" checked>
                        <label class="form-check-label" for="student">
                            Étudiant
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="admin" value="admin">
                        <label class="form-check-label" for="admin">
                            Administrateur
                        </label>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 mb-3">Se connecter</button>
                
                <div class="text-center">
                    <a href="forgot-password.php" class="text-decoration-none">Mot de passe oublié ?</a>
                    <p class="mt-3 mb-0">Pas encore de compte ? <a href="register.php" class="text-decoration-none">S'inscrire</a></p>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
