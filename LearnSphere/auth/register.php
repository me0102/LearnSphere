<?php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/password_utils.php';

session_start();

$error = null;
$success = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';
    $first_name = htmlspecialchars(trim($_POST['first_name'] ?? ''), ENT_QUOTES, 'UTF-8');
    $last_name = htmlspecialchars(trim($_POST['last_name'] ?? ''), ENT_QUOTES, 'UTF-8');
    $role = htmlspecialchars(trim($_POST['role'] ?? 'student'), ENT_QUOTES, 'UTF-8');

    error_log("Tentative d'inscription pour: " . $email . " avec le rôle: " . $role);

    // Validation des données
    if (empty($email) || empty($password) || empty($confirm_password) || empty($first_name) || empty($last_name)) {
        $error = "Tous les champs sont obligatoires";
        error_log("Erreur: Champs manquants");
    } elseif ($password !== $confirm_password) {
        $error = "Les mots de passe ne correspondent pas";
        error_log("Erreur: Mots de passe différents");
    } elseif (strlen($password) < 8) {
        $error = "Le mot de passe doit contenir au moins 8 caractères";
        error_log("Erreur: Mot de passe trop court");
    } else {
        try {
            // Vérifier si l'email existe déjà
            $stmt = $pdo->prepare('SELECT id FROM users WHERE email = ?');
            $stmt->execute([$email]);
            if ($stmt->fetch()) {
                $error = "Cet email est déjà utilisé";
                error_log("Erreur: Email déjà utilisé");
            } else {
                // Hachage du mot de passe
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                error_log("Mot de passe haché avec succès");

                // Insertion du nouvel utilisateur
                $stmt = $pdo->prepare('INSERT INTO users (email, password, first_name, last_name, role) VALUES (?, ?, ?, ?, ?)');
                $result = $stmt->execute([$email, $hashed_password, $first_name, $last_name, $role]);
                
                if ($result) {
                    error_log("Utilisateur créé avec succès: " . $email);
                    $success = "Inscription réussie ! Vous pouvez maintenant vous connecter.";
                } else {
                    error_log("Erreur lors de l'insertion de l'utilisateur");
                    $error = "Une erreur est survenue lors de l'inscription";
                }
            }
        } catch (PDOException $e) {
            error_log("Erreur PDO: " . $e->getMessage());
            $error = "Une erreur technique est survenue";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .register-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(51, 4, 219, 0.95);
        }
        .register-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .register-header h1 {
            color:rgb(60, 13, 233);
            font-size: 2rem;
            margin-bottom: 1rem;
        }
        .register-header img {
            max-width: 150px;
            margin-bottom: 1rem;
        }
        .form-control {
            padding: 0.75rem;
            border-radius: 8px;
            border: 1px solid #dee2e6;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(18, 7, 243, 0.96);
        }
        .btn-primary {
            background-color:rgb(39, 8, 239);
            border-color:rgb(39, 9, 239);
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
        <div class="register-container">
            <div class="register-header">
                <img src="../images/logo.jpg" alt="LearnSphere Logo">
                <h1>Inscription</h1>
            </div>
            
            <?php if (isset($error)): ?>
                <div class="alert alert-danger" role="alert">
                    <?= htmlspecialchars($error) ?>
                </div>
            <?php endif; ?>

            <?php if (isset($success)): ?>
                <div class="alert alert-success" role="alert">
                    <?= htmlspecialchars($success) ?>
                </div>
                <div class="text-center mt-3">
                    <a href="login.php" class="btn btn-primary w-100">Se connecter</a>
                </div>
            <?php else: ?>
                <form method="post" class="needs-validation" novalidate>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="first_name" class="form-label">Prénom</label>
                            <input type="text" class="form-control" id="first_name" name="first_name" required>
                            <div class="invalid-feedback">
                                Veuillez entrer votre prénom
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="last_name" class="form-label">Nom</label>
                            <input type="text" class="form-control" id="last_name" name="last_name" required>
                            <div class="invalid-feedback">
                                Veuillez entrer votre nom
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Adresse email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                        <div class="invalid-feedback">
                            Veuillez entrer une adresse email valide
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
                        
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Mot de passe</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <div class="invalid-feedback">
                            Le mot de passe doit contenir au moins 8 caractères
                        </div>
                        <small class="text-muted">Le mot de passe doit contenir au moins 8 caractères</small>
                    </div>

                    <div class="mb-4">
                        <label for="confirm_password" class="form-label">Confirmer le mot de passe</label>
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                        <div class="invalid-feedback">
                            Les mots de passe ne correspondent pas
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mb-3">S'inscrire</button>
                    
                    <div class="text-center">
                    <p class="mb-1">Vous avez déjà un compte ? <a href="login.php" class="text-decoration-none">Se connecter</a></p>
                    <p class="mb-0">Si vous êtes administrateur, <a href="login.php" class="text-decoration-none fw-bold text-danger">connectez-vous ici</a>.</p>

                    </div>
                </form>
            <?php endif; ?>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validation des formulaires Bootstrap
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