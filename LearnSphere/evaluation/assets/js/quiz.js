

document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function (event) {
            let score = 0;
            let totalQuestions = form.querySelectorAll('.question').length;

           
            form.querySelectorAll('.question').forEach(function (question, index) {
                const selectedAnswer = question.querySelector('input[type="radio"]:checked');
                if (selectedAnswer && selectedAnswer.value === question.dataset.correctAnswer) {
                    score++;
                }
            });

            const scoreInput = document.createElement('input');
            scoreInput.type = 'hidden';
            scoreInput.name = 'score';
            scoreInput.value = score;
            form.appendChild(scoreInput);
        });
    }
});
