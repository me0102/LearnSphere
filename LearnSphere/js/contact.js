document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactForm');
    const notification = document.getElementById('notification');
    const closeBtn = document.getElementById('close-notification');
  
    form.addEventListener('submit', function(e) {
      e.preventDefault(); // Bloque l'envoi par défaut
      
      // 1. VALIDATION STRICTE
      const name = document.getElementById('name').value.trim();
      const email = document.getElementById('email').value.trim();
      const subject = document.getElementById('subject').value;
      const message = document.getElementById('message').value.trim();
  
      // 2. VÉRIFICATION DES CHAMPS
      if (name === '' || email === '' || subject === '' || message === '') {
        alert("Veuillez remplir tous les champs requis !");
        return; // Stop ici si formulaire invalide
      }
  
      // 3. SI TOUT EST VALIDE (alors afficher notification)
      notification.style.display = 'flex';
      document.body.style.overflow = 'hidden'; // Bloque le défilement
      
      // 4. Réinitialisation du formulaire
      form.reset();
    });
  
    // Fermer la notification
    closeBtn.addEventListener('click', function() {
      notification.style.display = 'none';
      document.body.style.overflow = 'auto'; // Rétablit le défilement
    });
  });