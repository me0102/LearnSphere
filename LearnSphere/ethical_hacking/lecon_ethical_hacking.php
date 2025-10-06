<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Leçon – Ethical Hacking</title>
  <link rel="stylesheet" href="../css/lecon.css">
</head>


<body>
  <!-- Header avec logo et menu -->
  <header class="header">
    <div class="container">
      <div class="logo">
        <img src="../images/logo.jpg" alt="LearnSphere Logo">
        <h1>LearnSphere</h1>
      </div>
      <nav class="main-nav">
        <a href="../student/dashboard.php">Accueil</a>
        <a href="../cours.html">Cours</a>
        <a href="../index.html">Déconnexion</a>
      </nav>
    </div>
  </header>
  <div class="course-meta">
    <span class="duration">⏱️ 15 heures</span>
    <span class="level">🧠 Intermédiaire</span>
    <span class="rating">⭐ 4.8/5</span>
  </div>

  <!-- Section d'introduction -->
  <section class="introduction">
    <div class="container">
      <h2>Leçon : Ethical Hacking</h2>
      <p>Apprenez à sécuriser les systèmes en utilisant des techniques de hacking éthique et des outils de cybersécurité. Explorez des chapitres riches et interactifs.</p>
    </div>
  </section>

  <!-- Chapitres avec PDFs et Vidéos -->
  <section class="chapters">
    <div class="container">
      <h3>Nos Chapitres</h3>
      
      <!-- Chapitre 1 -->
      <div class="chapter">
        <div class="chapter-logo">
          <img src="../images/chapter1_logo.jpg" alt="Chapitre 1">
        </div>
        <div class="chapter-details">
          <h4>Chapitre 1 : Introduction à l’Ethical Hacking</h4>
          <a href="../pdfs/ethical_hacking_chap1.pdf" target="_blank">Voir cours</a>
          <br />
          <a href="../videos/ethical_hacking_vid1.mp4" target="_blank">Regarder la vidéo</a>
          <button class="complete-btn" onclick="markCompleted(this, 'ethical_chap1')">Marquer comme terminé</button>
        </div>
      </div>

      <!-- Chapitre 2 -->
      <div class="chapter">
        <div class="chapter-logo">
          <img src="../images/chapter2_logo.jpg" alt="Chapitre 2">
        </div>
        <div class="chapter-details">
          <h4>Chapitre 2 : Techniques d’exploration</h4>
          <a href="../pdfs/ethical_hacking_chap2.pdf" target="_blank">Voir cours</a>
          <br />
          <a href="../videos/ethical_hacking_vid2.mp4" target="_blank">Regarder la vidéo</a>
          <button class="complete-btn" onclick="markCompleted(this, 'ethical_chap2')">Marquer comme terminé</button>
        </div>
      </div>

      <!-- Chapitre 3 -->
      <div class="chapter">
        <div class="chapter-logo">
          <img src="../images/chapter3_logo.jpg" alt="Chapitre 3">
        </div>
        <div class="chapter-details">
          <h4>Chapitre 3 : Outils et Méthodes</h4>
          <a href="../pdfs/ethical_hacking_chap3.pdf" target="_blank">Voir cours</a>
          <br />
          <a href="../videos/ethical_hacking_vid3.mp4" target="_blank">Regarder la vidéo</a>
          <button class="complete-btn" onclick="markCompleted(this, 'ethical_chap3')">Marquer comme terminé</button>
        </div>
      </div>

      <!-- Chapitre 4 -->
      <div class="chapter">
        <div class="chapter-logo">
          <img src="../images/chapter4_logo.jpg" alt="Chapitre 4">
        </div>
        <div class="chapter-details">
          <h4>Chapitre 4 : Sécurisation des Réseaux</h4>
          <a href="../pdfs/ethical_hacking_chap4.pdf" target="_blank">Voir cours</a>
          <br />
          <a href="../videos/ethical_hacking_vid4.mp4" target="_blank">Regarder la vidéo</a>
          <button class="complete-btn" onclick="markCompleted(this, 'ethical_chap4')">Marquer comme terminé</button>
        </div>
      </div>

      <!-- Chapitre 5 -->
      <div class="chapter">
        <div class="chapter-logo">
          <img src="../images/chapter5_logo.jpg" alt="Chapitre 5">
        </div>
        <div class="chapter-details">
          <h4>Chapitre 5 : Attaques et Défenses</h4>
          <a href="../pdfs/ethical_hacking_chap5.pdf" target="_blank">Voir cours</a>
          <br />
          <a href="../videos/ethical_hacking_vid5.mp4" target="_blank">Regarder la vidéo</a>
          <button class="complete-btn" onclick="markCompleted(this, 'ethical_chap5')">Marquer comme terminé</button>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <p>&copy; 2025 LearnSphere. Tous droits réservés.</p>
    </div>
  </footer>
  <script>
    function markCompleted(button, chapterId) {
      fetch('../student/mark_chapter_complete.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ chapterId: chapterId })
      }).then(response => response.json())
        .then(data => {
          if (data.success) {
            button.textContent = "Terminé";
            button.style.backgroundColor = "#4caf50";
            button.style.color = "white";
            button.disabled = true;
          } else {
            alert("Erreur lors de l'enregistrement : " + data.message);
          }
        });
    }
    </script>
    
</body>
</html>

