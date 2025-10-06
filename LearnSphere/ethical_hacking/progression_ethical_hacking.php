<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Progression – Ethical Hacking</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f7f9fc;
      margin: 0;
      padding: 0;
      overflow: hidden;
    }

    /* Barre de navigation */
    .navbar {
      display: flex;
      justify-content: center;
      background-color: #343a40;
      padding: 15px;
    }

    .navbar a {
      text-decoration: none;
      color: white;
      padding: 12px 20px;
      margin: 0 15px;
      border-radius: 6px;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .navbar a:hover {
      background-color: #007bff;
    }

    /* Barre de progression */
    .progress-container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      width: 60%;
      margin: 150px auto 0;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .progress-bar {
      width: 100%;
      background-color: #ddd;
      border-radius: 20px;
      overflow: hidden;
      margin-top: 20px;
    }

    .progress-fill {
      height: 30px;
      width: 0%;
      background-color: #4caf50;
      text-align: center;
      line-height: 30px;
      color: white;
      transition: width 0.5s ease-in-out;
    }

    h2 {
      color: #333;
    }

    /* Style pour la popup Assistant AI */
    .popup {
      position: fixed;
      top: 60%;
      right: -300px;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 20px;
      box-shadow: 0 4px 40px rgba(0, 0, 0, 0.2);
      display: none;
      z-index: 500;
      max-width: 400px;
      transform: translateY(-50%);
      animation: slideIn 1s ease forwards;
    }

    /* Animation de la popup glissant de la droite */
    @keyframes slideIn {
      0% {
        right: -300px;
      }
      100% {
        right: 5%;
      }
    }

    .popup.active {
      display: block;
    }

    .popup h3 {
      font-size: 1.6em;
      color: #3f4b57;
      margin-bottom: 15px;
      font-weight: 600;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .popup .emoji {
      font-size: 40px;
      margin-right: 10px;
    }

    .popup p {
      font-size: 1.1em;
      color: #666;
      line-height: 1.6;
      text-align: center;
    }

    .popup button {
      padding: 12px 30px;
      background: linear-gradient(135deg, #007bff, #00d2ff);
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
      transition: background 0.3s ease;
      display: block;
      margin: 20px auto 0;
    }

    .popup button:hover {
      background: linear-gradient(135deg, #005bb5, #009bcd);
    }

    .chapters-links a {
      display: block;
      margin: 15px 0;
      padding: 12px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-size: 16px;
      transition: background-color 0.3s ease;
      text-align: center;
    }

    .chapters-links a:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <!-- Barre de navigation -->
  <div class="navbar">
    <a href="../index.html">Accueil</a>
    <a href="../cours.html">Cours</a>
    <a href="../contact.html">Contact</a>
    <a href="../index.html">Déconnexion</a>
  </div>

  <!-- Barre de progression -->
  <div class="progress-container">
    <h2>Votre progression en Ethical Hacking</h2>
    <div class="progress-bar">
      <div id="progress-fill" class="progress-fill">0%</div>
    </div>
  </div>

  <!-- Popup Assistant AI -->
  <div id="popupAI" class="popup">
    <h3><span class="emoji">🤖</span> Assistant AI</h3>
    <p id="popupMessage"></p>
    <div id="chapters-links" class="chapters-links"></div>
    <button onclick="closePopup()">Fermer</button>
  </div>

  <script>
    fetch('../student/get_progression.php')
      .then(response => response.json())
      .then(data => {
        const percent = Math.round((data.completed / data.total) * 100);
        const progressFill = document.getElementById('progress-fill');
        progressFill.style.width = percent + '%';
        progressFill.textContent = percent + '%';
    
        if (percent === 20 || percent === 40 || percent === 60) {
          setTimeout(() => {
            const links = data.remaining.map(chap => `<a href="${chap.link}">${chap.label}</a>`).join('');
            showPopup(`📚 Vous avez complété ${percent}% du cours ! Il vous reste :`, links);
          }, 3000);
        }
      });
    </script>
</body>
</html>    