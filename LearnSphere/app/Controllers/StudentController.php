<?php
namespace App\Controllers;

class StudentController {
    private $pdo;
    
    public function __construct($pdo) {
        $this->pdo = $pdo;
        
        // Vérifier si l'utilisateur est un étudiant
        if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
            header('Location: index.php?page=login');
            exit;
        }
    }
    
    public function dashboard() {
        // Récupérer les informations de l'étudiant
        $stmt = $this->pdo->prepare('SELECT * FROM users WHERE id = ?');
        $stmt->execute([$_SESSION['user_id']]);
        $student = $stmt->fetch();
        
        // Récupérer les cours de l'étudiant
        $stmt = $this->pdo->prepare('
            SELECT c.* FROM courses c
            JOIN student_courses sc ON c.id = sc.course_id
            WHERE sc.student_id = ?
        ');
        $stmt->execute([$_SESSION['user_id']]);
        $courses = $stmt->fetchAll();
        
        include __DIR__ . '/../../student/dashboard.php';
    }
    
    public function profile() {
        $stmt = $this->pdo->prepare('SELECT * FROM users WHERE id = ?');
        $stmt->execute([$_SESSION['user_id']]);
        $student = $stmt->fetch();
        
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Mise à jour du profil
            $stmt = $this->pdo->prepare('
                UPDATE users 
                SET name = ?, email = ?
                WHERE id = ?
            ');
            $stmt->execute([
                $_POST['name'],
                $_POST['email'],
                $_SESSION['user_id']
            ]);
            
            header('Location: index.php?page=student/profile&success=1');
            exit;
        }
        
        include __DIR__ . '/../../student/profile.html';
    }
    
    public function myCourses() {
        // Récupérer tous les cours de l'étudiant
        $stmt = $this->pdo->prepare('
            SELECT c.*, sc.progress, sc.last_accessed
            FROM courses c
            JOIN student_courses sc ON c.id = sc.course_id
            WHERE sc.student_id = ?
        ');
        $stmt->execute([$_SESSION['user_id']]);
        $courses = $stmt->fetchAll();
        
        include __DIR__ . '/../../student/courses.html';
    }
    
    public function progress() {
        // Récupérer la progression globale
        $stmt = $this->pdo->prepare('
            SELECT 
                c.title,
                sc.progress,
                sc.last_accessed
            FROM courses c
            JOIN student_courses sc ON c.id = sc.course_id
            WHERE sc.student_id = ?
        ');
        $stmt->execute([$_SESSION['user_id']]);
        $progress = $stmt->fetchAll();
        
        include __DIR__ . '/../../student/quiz.html';
    }
    
    public function grades() {
        // Récupérer les notes de l'étudiant
        $stmt = $this->pdo->prepare('
            SELECT 
                c.title as course_title,
                g.grade,
                g.comment,
                g.created_at
            FROM grades g
            JOIN courses c ON c.id = g.course_id
            WHERE g.student_id = ?
            ORDER BY g.created_at DESC
        ');
        $stmt->execute([$_SESSION['user_id']]);
        $grades = $stmt->fetchAll();
        
        include __DIR__ . '/../../views/student/grades.php';
    }
}