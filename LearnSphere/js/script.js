// Fichier : js/script.js

/* ================================
   Fonction de connexion (login.html)
   ================================ */
   function login(event) {
    event.preventDefault();
    const email = document.getElementById('email').value.trim().toLowerCase();
  
    // Simple simulation de rôle : si l'email contient "admin", on va vers l'espace admin
    if (email.includes('admin')) {
      window.location.href = 'admin/dashboard.html';
    } else {
      window.location.href = 'student/dashboard.html';
    }
  }
  
  /* ================================
     Gestion du Quiz (student/quiz.html)
     ================================ */
  document.addEventListener('DOMContentLoaded', () => {
    const quizForm = document.getElementById('quiz-form');
    if (!quizForm) return;  // Ne rien faire si pas sur la page quiz
  
    quizForm.addEventListener('submit', function(event) {
      event.preventDefault();
  
      let score = 0;
      // Les réponses correctes
      const answers = {
        q1: 'a',  // <img>
        q2: 'a',  // color
        q3: 'b'   // console.log()
      };
  
      // Calcul du score
      for (let key in answers) {
        const selected = document.querySelector(`input[name="${key}"]:checked`);
        if (selected && selected.value === answers[key]) {
          score++;
        }
      }
  
      // Affichage du résultat
      document.querySelector('.quiz').style.display = 'none';
      const resultSection = document.getElementById('result');
      resultSection.style.display = 'block';
      document.getElementById('score').textContent = `Vous avez obtenu ${score} sur ${Object.keys(answers).length}.`;
    });
  });
  