<?php
namespace App;

class Router {
    private $routes = [
        'home' => 'HomeController@index',
        'login' => 'AuthController@login',
        'register' => 'AuthController@register',
        'logout' => 'AuthController@logout',
        'forgot-password' => 'AuthController@forgotPassword',
        'reset-password' => 'AuthController@resetPassword',
        'admin/logs' => 'AdminController@viewLogs',
        'admin/dashboard' => 'AdminController@dashboard',
        'admin/users' => 'AdminController@manageUsers',
        'admin/courses' => 'AdminController@manageCourses',
        'admin/add_course' => 'AdminController@addCourse',
        'admin/delete_user' => 'AdminController@deleteUser',  // Added comma here
        
        // Routes étudiants
        'student/dashboard' => 'StudentController@dashboard',
        'student/profile' => 'StudentController@profile',
        'student/courses' => 'StudentController@myCourses',
        'student/progress' => 'StudentController@progress',
        'student/grades' => 'StudentController@grades'
    ];
    
    public function dispatch() {
        $page = $_GET['page'] ?? 'home';
        
        if (!isset($this->routes[$page])) {
            header('HTTP/1.0 404 Not Found');
            include __DIR__ . '/../views/404.php';
            return;
        }
        
        list($controller, $method) = explode('@', $this->routes[$page]);
        $controllerClass = "App\\Controllers\\{$controller}";
        
        if (!class_exists($controllerClass)) {
            throw new \Exception("Controller not found: {$controller}");
        }
        
        // Créer l'instance du contrôleur avec la connexion PDO
        $pdo = require __DIR__ . '/../config/database.php';
        $instance = new $controllerClass($pdo);
        
        if (!method_exists($instance, $method)) {
            throw new \Exception("Method not found: {$method}");
        }
        
        // Vérification des permissions pour les routes admin et étudiants
        if (strpos($page, 'admin/') === 0) {
            $this->requireAdmin();
        } elseif (strpos($page, 'student/') === 0) {
            $this->requireStudent();
        }
        
        call_user_func([$instance, $method]);
    }
    
    private function requireAdmin() {
        if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
            header('Location: index.php?page=login');
            exit;
        }
    }
    
    private function requireStudent() {
        if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
            header('Location: index.php?page=login');
            exit;
        }
    }
}
