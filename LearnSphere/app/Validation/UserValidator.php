<?php
namespace App\Validation;

class UserValidator {
    private $errors = [];
    
    public function validate($data) {
        $this->errors = [];
        
        // Validation du nom
        if (isset($data['first_name'])) {
            if (strlen($data['first_name']) < 2 || strlen($data['first_name']) > 50) {
                $this->errors['first_name'] = "Le prénom doit contenir entre 2 et 50 caractères.";
            }
            if (!preg_match("/^[a-zA-ZÀ-ÿ\s'-]+$/u", $data['first_name'])) {
                $this->errors['first_name'] = "Le prénom contient des caractères non autorisés.";
            }
        }
        
        // Validation du prénom
        if (isset($data['last_name'])) {
            if (strlen($data['last_name']) < 2 || strlen($data['last_name']) > 50) {
                $this->errors['last_name'] = "Le nom doit contenir entre 2 et 50 caractères.";
            }
            if (!preg_match("/^[a-zA-ZÀ-ÿ\s'-]+$/u", $data['last_name'])) {
                $this->errors['last_name'] = "Le nom contient des caractères non autorisés.";
            }
        }
        
        // Validation de l'email
        if (isset($data['email'])) {
            if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
                $this->errors['email'] = "L'adresse email n'est pas valide.";
            }
            if (strlen($data['email']) > 255) {
                $this->errors['email'] = "L'adresse email est trop longue.";
            }
        }
        
        // Validation du mot de passe
        if (isset($data['password'])) {
            if (strlen($data['password']) < 8) {
                $this->errors['password'] = "Le mot de passe doit contenir au moins 8 caractères.";
            }
            if (!preg_match("/[A-Z]/", $data['password'])) {
                $this->errors['password'] = "Le mot de passe doit contenir au moins une majuscule.";
            }
            if (!preg_match("/[a-z]/", $data['password'])) {
                $this->errors['password'] = "Le mot de passe doit contenir au moins une minuscule.";
            }
            if (!preg_match("/[0-9]/", $data['password'])) {
                $this->errors['password'] = "Le mot de passe doit contenir au moins un chiffre.";
            }
            if (!preg_match("/[!@#$%^&*()\-_=+{};:,<.>]/", $data['password'])) {
                $this->errors['password'] = "Le mot de passe doit contenir au moins un caractère spécial.";
            }
        }
        
        // Validation du rôle
        if (isset($data['role'])) {
            $validRoles = ['student', 'admin', 'teacher'];
            if (!in_array($data['role'], $validRoles)) {
                $this->errors['role'] = "Le rôle spécifié n'est pas valide.";
            }
        }
        
        return empty($this->errors);
    }
    
    public function getErrors() {
        return $this->errors;
    }
    
    public function sanitize($data) {
        $clean = [];
        
        foreach ($data as $key => $value) {
            switch ($key) {
                case 'email':
                    $clean[$key] = filter_var($value, FILTER_SANITIZE_EMAIL);
                    break;
                    
                case 'first_name':
                case 'last_name':
                    $clean[$key] = htmlspecialchars(strip_tags(trim($value)), ENT_QUOTES, 'UTF-8');
                    break;
                    
                case 'role':
                    $clean[$key] = in_array($value, ['student', 'admin', 'teacher']) ? $value : 'student';
                    break;
                    
                default:
                    $clean[$key] = htmlspecialchars(strip_tags($value), ENT_QUOTES, 'UTF-8');
            }
        }
        
        return $clean;
    }
}