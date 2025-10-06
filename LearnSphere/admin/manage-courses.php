<?php
require_once __DIR__ . '/../config/database.php';

// Récupérer la connexion PDO
$pdo = require __DIR__ . '/../config/database.php';

// Vérifier si l'utilisateur est connecté et est un administrateur
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
    header('Location: ../auth/login.php');
    exit;
}

// Traitement de l'ajout d'un cours
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add') {
    try {
        // Utiliser l'ID de l'administrateur connecté comme teacher_id
        $teacher_id = $_SESSION['user_id'];
        
        $stmt = $pdo->prepare('INSERT INTO courses (title, description, teacher_id, is_published) VALUES (?, ?, ?, 1)');
        $stmt->execute([
            $_POST['title'],
            $_POST['description'],
            $teacher_id
        ]);
        
        header('Location: manage-courses.php?success=1');
        exit;
    } catch (PDOException $e) {
        error_log("Erreur lors de l'ajout du cours : " . $e->getMessage());
        $error = "Erreur lors de l'ajout du cours : " . $e->getMessage();
    }
}

// Traitement de la suppression d'un cours
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'delete') {
    try {
        $stmt = $pdo->prepare('DELETE FROM courses WHERE id = ?');
        $stmt->execute([$_POST['course_id']]);
        header('Location: manage-courses.php?success=2');
        exit;
    } catch (PDOException $e) {
        error_log("Erreur lors de la suppression du cours : " . $e->getMessage());
        $error = "Erreur lors de la suppression du cours";
    }
}

// Récupérer tous les cours
try {
    $stmt = $pdo->query('SELECT * FROM courses ORDER BY created_at DESC');
    $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    error_log("Erreur lors de la récupération des cours : " . $e->getMessage());
    $courses = [];
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Cours - LearnSphere</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<!-- Fichier : admin/manage-modules.html -->
  <style>
    /* Add some basic styling for the add form */
    .add-module-form {
      background-color: #f9f9f9;
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 30px;
      border: 1px solid #eee;
    }
    .add-module-form h3 {
      margin-top: 0;
      margin-bottom: 15px;
      color: #333;
    }
    .add-module-form label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #555;
    }
    .add-module-form textarea,
    .add-module-form button {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box; /* Include padding in width */
      font-family: 'Poppins', sans-serif; /* Inherit font */
      font-size: 1rem; /* Match base font size */
    }
     .add-module-form textarea {
       height: 80px; /* Give textareas some height */
       resize: vertical; /* Allow vertical resizing */
     }
    .add-module-form button {
      background-color: #5cb85c; /* Green */
      color: white;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .add-module-form button:hover {
      background-color: #4cae4c;
    }
     /* Ensure table action buttons have consistent styling */
     .module-management .btn {
        padding: 5px 10px;
        text-decoration: none;
        border-radius: 4px;
        margin-right: 5px;
        cursor: pointer;
        font-size: 0.9em;
        border: none; /* Ensure buttons have no border by default */
     }
     .module-management a.btn {
         /* Using a slightly different color for edit to distinguish if needed */
         background-color: #f0ad4e; /* Orange/Yellow for edit */
         color: white;
     }
     .module-management a.btn:hover {
         background-color: #ec971f;
     }
     .module-management .delete-btn {
         background-color: #d9534f; /* Red for delete */
         color: white;
     }
      .module-management .delete-btn:hover {
         background-color: #c9302c;
      }

  </style>
</head>

    <header class="site-header">
        <div class="logo">
            <a href="../index.php">
                <img src="../images/logo.jpg" alt="LearnSphere Logo" class="img-fluid" style="max-height: 50px;">
            </a>
        </div>
        <nav class="main-nav">
            <a href="dashboard.php" class="nav-link"><i class="bi bi-speedometer2"></i> Tableau de bord</a>
            <a href="users.php" class="nav-link"><i class="bi bi-people"></i> Utilisateurs</a>
            <a href="manage-courses.php" class="nav-link active"><i class="bi bi-book"></i> Cours</a>
            <a href="logs.php" class="nav-link"><i class="bi bi-journal-text"></i> Journaux</a>
            <a href="../index.php" class="nav-link text-danger"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
        </nav>
    </header>
 

  <main class="dashboard-container">
    <section class="welcome-box">
       <!-- Text reverted -->
      <h2>Ajoutez, modifiez ou supprimez des Leçons.</h2>
      <p>Gérez facilement les leçons disponibles pour les étudiants.</p>
    </section>

    <!-- Section to Add New Module -->
    <section class="add-module-form">
       <!-- Title reverted -->
      <h3>Ajouter une nouvelle Leçon</h3>
      <div>
         <!-- Label reverted -->
        <label for="new-module-title">Titre de la Leçon :</label>
         <!-- Placeholder reverted -->
        <textarea id="new-module-title" placeholder="Entrez le titre de la nouvelle Leçon"></textarea>
      </div>
      <div>
        <label for="new-module-description">Description :</label>
         <!-- Placeholder reverted -->
        <textarea id="new-module-description" placeholder="Entrez la description de la nouvelle Leçon"></textarea>
      </div>
      <div>
        <label for="new-module-image">Image de la Leçon :</label>
        <input type="file" id="new-module-image" accept="image/*" required />
      </div>
       <!-- Button text reverted -->
      <button onclick="addModule()">Ajouter la Leçon</button>
    </section>

    <div style="text-align: center;">
      <a href="ajouter-cours.html" style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: white; text-decoration: none; border-radius: 5px; margin-right: 10px;">Ajouter un chapitre</a>
      
      <a href="ajouter-quiz.html" style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: white; text-decoration: none; border-radius: 5px;">Ajouter un quiz</a>
    </div>
    
    <!-- Section listing existing Modules -->
    <section class="module-management">
       <!-- Title reverted -->
      <h3>Liste des Leçons</h3>
      <table cellpadding="5" cellspacing="0" style="width: 100%; border-collapse: collapse; margin-top: 20px;">
        <thead>
          <tr>
            <th>ID</th>
            <!-- Header reverted -->
            <th>Titre de la Leçon</th>
            <th>Description</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody id="module-list-body">
         <!-- Nouveaux modules seront ajoutés ici par JavaScript -->
        </tbody>
      </table>
    </section>
  </main>

  <footer>
      <p>© 2025 LearnSphere. Tous droits réservés.</p>
  </footer>

    <script>
      // Counter for new module IDs (in a real app, IDs come from the backend)
      let nextModuleId = 3; // Start after the existing highest ID

      function addModule() {
        const titleInput = document.getElementById('new-module-title');
        const descriptionInput = document.getElementById('new-module-description');
        const imageInput = document.getElementById('new-module-image');

        const title = titleInput.value.trim();
        const description = descriptionInput.value.trim();
        const image = imageInput.files[0];

        // Basic validation
        if (!title || !description || !image) {
          alert('Veuillez remplir tous les champs.');
          return;
        }

        const formData = new FormData();
        formData.append('title', title);
        formData.append('description', description);
        formData.append('image', image);

        fetch('add_module.php', {
          method: 'POST',
          body: formData
        })
          .then(response => response.text())
          .then(data => {
            alert(data);
            location.reload(); // Reload the page to see the new module
          })
          .catch(error => console.error('Error:', error));
      }

      document.addEventListener('DOMContentLoaded', () => {
        fetch('get_modules.php')
          .then(response => response.json())
          .then(modules => {
            const tableBody = document.getElementById('module-list-body');
            tableBody.innerHTML = ''; // Clear existing rows

            modules.forEach(module => {
              const row = tableBody.insertRow();
              row.innerHTML = `
                <td>${module.id}</td>
                <td>${module.title}</td>
                <td>${module.description}</td>
                <td>
                  <button class="btn delete-btn" onclick="deleteModule(this, ${module.id})">Supprimer</button>
                </td>
              `;
            });
          })
          .catch(error => console.error('Error:', error));
      });

      // Renamed deleteCourse to deleteModule and updated text inside
      function deleteModule(buttonElement, moduleId) {
        if (confirm('Êtes-vous sûr de vouloir supprimer ce module ?')) {
          // Créer les données du formulaire
          const data = new URLSearchParams();
          data.append('moduleId', moduleId);

          fetch('delete_module.php', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: data
          })
          .then(response => response.json())
          .then(data => {
            if (data.success) {
              const row = buttonElement.closest('tr');
              if (row) {
                row.remove();
                alert('Module supprimé avec succès');
              }
            } else {
              alert('Erreur lors de la suppression : ' + data.message);
              console.error('Erreur:', data.message);
            }
          })
          .catch(error => {
            console.error('Error:', error);
            alert('Erreur lors de la suppression du module');
          });
        }
      }
  </script>
</body>
</html>