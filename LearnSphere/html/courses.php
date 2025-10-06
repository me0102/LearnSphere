<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Connexion à la base de données pour récupérer les cours et les progrès
include 'database.php';

// Récupérer les données de cours
$query = $pdo->prepare('SELECT * FROM courses');
$query->execute();
$courses = $query->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/cours_style.css">
    <title>Cours LearnSphere</title>
</head>

<body>
    <header class="header">
        <div class="container">
            <a href="index.html" class="logo">
                <img src="../images/logo.jpg" alt="LearnSphere Logo">
                <h1>LearnSphere</h1>
            </a>
            
            <nav class="main-nav">
                <ul>
                    <li><a href="index.html"><i class="fas fa-home"></i> <span>Accueil</span></a></li>
                    <li><a href="cours.html" class="active"><i class="fas fa-book"></i> <span>Mes Cours</span></a></li>
                    <li><a href="contact.html"><i class="fas fa-envelope"></i> <span>Contact</span></a></li>
                    <li><a href="index.html" class="btn-login"><i class="fas fa-sign-out-alt"></i> <span>Déconnexion</span></a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="courses-intro">
        <div class="container">
            <h2>Découvrez nos Cours E-learning</h2>
            <p>Explorez des cours interactifs, des vidéos explicatives et des quiz pour enrichir vos connaissances dans des domaines variés. Cliquez sur un cours pour commencer votre apprentissage.</p>
        </div>
    </section>

    <section class="courses-list">
        <div class="container courses-container">
            <!-- Ethical Hacking -->
            <div class="course-card">
                <img src="../images/ethical_hacking.jpg" alt="Ethical Hacking">
                <h3>Ethical Hacking</h3>
                <p>Apprenez à sécuriser les systèmes en utilisant des techniques de hacking éthique.</p>
                <div class="course-buttons">
                    <a href="../ethical_hacking/lecon_ethical_hacking.html" class="btn-lesson">Leçon</a>
                    <a href="../ethical_hacking/progression_ethical_hacking.html" class="btn-progress">Ma progression</a>
                    <a href="../ethical_hacking/test_final_ethical_hacking.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- Cryptographie -->
            <div class="course-card">
                <img src="../images/cryptographie.jpg" alt="Cryptographie">
                <h3>Cryptographie</h3>
                <p>Apprenez les bases de la cryptographie pour sécuriser les données.</p>
                <div class="course-buttons">
                    <a href="../cryptographie/lecon_cryptographie.html" class="btn-lesson">Leçon</a>
                    <a href="../cryptographie/progression_cryptographie.html" class="btn-progress">Ma progression</a>
                    <a href="../cryptographie/test_final_cryptographie.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- Linux -->
            <div class="course-card">
                <img src="../images/linux.jpg" alt="Linux">
                <h3>Linux</h3>
                <p>Apprenez à maîtriser le système d'exploitation Linux et son administration.</p>
                <div class="course-buttons">
                    <a href="../linux/lecon_linux.html" class="btn-lesson">Leçon</a>
                    <a href="../linux/progression_linux.html" class="btn-progress">Ma progression</a>
                    <a href="../linux/test_final_linux.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- Python -->
            <div class="course-card">
                <img src="../images/python.jpg" alt="Python">
                <h3>Python</h3>
                <p>Découvrez la programmation Python pour développer vos propres applications.</p>
                <div class="course-buttons">
                    <a href="../python/lecon_python.html" class="btn-lesson">Leçon</a>
                    <a href="../python/progression_python.html" class="btn-progress">Ma progression</a>
                    <a href="../python/test_final_python.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- JavaScript -->
            <div class="course-card">
                <img src="../images/javascript.jpg" alt="JavaScript">
                <h3>JavaScript</h3>
                <p>Créez des interfaces dynamiques avec JavaScript moderne.</p>
                <div class="course-buttons">
                    <a href="../javascript/lecon_javascript.html" class="btn-lesson">Leçon</a>
                    <a href="../javascript/progression_javascript.html" class="btn-progress">Ma progression</a>
                    <a href="../javascript/test_final_javascript.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- HTML -->
            <div class="course-card">
                <img src="../images/html.jpg" alt="HTML">
                <h3>HTML</h3>
                <p>Structurez et organisez vos pages web grâce à HTML5.</p>
                <div class="course-buttons">
                    <a href="../html/lecon_html.html" class="btn-lesson">Leçon</a>
                    <a href="../html/progression_html.html" class="btn-progress">Ma progression</a>
                    <a href="../html/test_final_html.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- PHP -->
            <div class="course-card">
                <img src="../images/php.jpg" alt="PHP">
                <h3>PHP</h3>
                <p>Apprenez à développer des applications back-end avec PHP.</p>
                <div class="course-buttons">
                    <a href="../php/lecon_php.html" class="btn-lesson">Leçon</a>
                    <a href="../php/progression_php.html" class="btn-progress">Ma progression</a>
                    <a href="../php/test_final_php.html" class="btn-test">Test Final</a>
                </div>
            </div>

            <!-- SQL -->
            <div class="course-card">
                <img src="../images/sql.jpg" alt="SQL">
                <h3>SQL</h3>
                <p>Interrogez et gérez des bases de données relationnelles avec SQL.</p>
                <div class="course-buttons">
                    <a href="../sql/lecon_sql.html" class="btn-lesson">Leçon</a>
                    <a href="../sql/progression_sql.html" class="btn-progress">Ma progression</a>
                    <a href="../sql/test_final_sql.html" class="btn-test">Test Final</a>
                </div>
            </div>
        </div>
    </section>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Récupérer la progression depuis le backend
            fetch("../student/get_progress.php")
                .then((response) => response.json())
                .then((data) => {
                    if (data.error) {
                        console.error("Erreur lors de la récupération des données:", data.error);
                        return;
                    }
        
                    // Mettre à jour la progression sur la page
                    data.progress.forEach((courseProgress) => {
                        const progressBar = document.querySelector(`#progress-${courseProgress.course_id}`);
                        if (progressBar) {
                            progressBar.style.width = `${courseProgress.progress}%`;
                            progressBar.textContent = `${courseProgress.progress}%`;
                        }
                    });
                })
                .catch((error) => console.error("Erreur lors de la récupération des données:", error));
        });
        
        // Fonction pour mettre à jour la progression (par exemple après une leçon terminée)
        function updateProgress(courseId, progress) {
            fetch("../student/update_progress.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: `course_id=${courseId}&progress=${progress}`
            })
            .then((response) => response.json())
            .then((data) => {
                if (data.success) {
                    console.log("Progression mise à jour !");
                } else {
                    console.error("Erreur lors de la mise à jour de la progression");
                }
            });
        }
    </script>
</body>
</html>        