document.addEventListener('DOMContentLoaded', function() {
    // Gestion de l'accordéon FAQ
    const faqItems = document.querySelectorAll('.faq-item');
    
    faqItems.forEach(item => {
      const question = item.querySelector('.faq-question');
      
      question.addEventListener('click', () => {
        // Fermer les autres items
        faqItems.forEach(otherItem => {
          if (otherItem !== item && otherItem.classList.contains('active')) {
            otherItem.classList.remove('active');
          }
        });
        
        // Basculer l'item actuel
        item.classList.toggle('active');
      });
    });
  
    // Fonction de recherche
    const searchInput = document.querySelector('.search-box input');
    const searchBtn = document.querySelector('.search-box button');
    
    function searchFAQ() {
      const searchTerm = searchInput.value.toLowerCase();
      
      faqItems.forEach(item => {
        const question = item.querySelector('h4').textContent.toLowerCase();
        const answer = item.querySelector('p').textContent.toLowerCase();
        
        if (question.includes(searchTerm) || answer.includes(searchTerm)) {
          item.style.display = 'block';
          item.classList.add('active'); // Ouvre les résultats pertinents
        } else {
          item.style.display = 'none';
        }
      });
    }
    
    searchBtn.addEventListener('click', searchFAQ);
    searchInput.addEventListener('keyup', function(e) {
      if (e.key === 'Enter') searchFAQ();
    });
  
    // Animation au chargement
    setTimeout(() => {
      document.body.classList.add('loaded');
    }, 100);
  });