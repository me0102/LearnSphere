<?php
// Vos paramètres de connexion
$host = 'localhost';
$dbname = 'elearning_db';
$username = 'root';  // Nom d'utilisateur par défaut de XAMPP
$password = '';      // Mot de passe par défaut de XAMPP (vide)

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $pdo;
} catch(PDOException $e) {
    error_log("Erreur de connexion : " . $e->getMessage());
    die("Une erreur est survenue lors de la connexion à la base de données.");
}