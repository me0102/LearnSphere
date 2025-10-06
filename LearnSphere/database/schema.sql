-- Création de la base de données
CREATE DATABASE IF NOT EXISTS elearning_db;
USE elearning_db;

-- Table des utilisateurs avec champs additionnels
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role ENUM('student', 'teacher', 'admin') NOT NULL DEFAULT 'student',
    profile_picture VARCHAR(255) DEFAULT NULL,
    bio TEXT,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    is_active BOOLEAN DEFAULT TRUE
ALTER TABLE users ADD COLUMN failed_attempts INT DEFAULT 0;


);

-- Table des cours
CREATE TABLE IF NOT EXISTS courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    teacher_id INT NOT NULL,
    category VARCHAR(100),
    level ENUM('beginner', 'intermediate', 'advanced') NOT NULL,
    duration INT COMMENT 'Duration in minutes',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_published BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (teacher_id) REFERENCES users(id) ON DELETE CASCADE
INSERT INTO courses (title, description, category, level, duration, is_published) VALUES
('Ethical Hacking', 'Cours complet sur les techniques de pentest', 'Cybersécurité', 'beginner', 120, TRUE),
('Cryptographie', 'Introduction aux concepts de cryptographie moderne', 'Cybersécurité', 'beginner', 90, TRUE),
('Linux', 'Maîtriser les bases de Linux', 'Systèmes', 'beginner', 100, TRUE),
('SQL', 'Manipulation de bases de données relationnelles', 'Base de données', 'beginner', 100, TRUE),
('Python', 'Programmation Python de A à Z', 'Programmation', 'beginner', 100, TRUE),
('PHP', 'Développement web avec PHP', 'Programmation', 'beginner', 100, TRUE),
('JavaScript', 'Introduction à JavaScript', 'Programmation', 'beginner', 100, TRUE),
('HTML', 'Apprendre HTML et créer des pages web', 'Développement web', 'beginner', 100, TRUE),
('Java', 'Programmation Java de base à avancé', 'Programmation', 'beginner', 120, TRUE);


);

-- Table des inscriptions aux cours
CREATE TABLE IF NOT EXISTS course_enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completion_date TIMESTAMP NULL,
    progress INT DEFAULT 0 COMMENT 'Progress percentage',
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (student_id, course_id)
);

-- Table des tentatives de connexion
CREATE TABLE IF NOT EXISTS login_attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ip VARCHAR(45) NOT NULL,
    email VARCHAR(255) NOT NULL,
    attempts INT DEFAULT 1,
    last_attempt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_ip_email (ip, email)
);

-- Table des sessions
DROP TABLE IF EXISTS `sessions`;

CREATE TABLE IF NOT EXISTS `sessions` (
    `id` VARCHAR(128) PRIMARY KEY,
    `data` MEDIUMTEXT,
    `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `user_id` INT NULL,
    `ip_address` VARCHAR(45) NOT NULL,
    `user_agent` TEXT NOT NULL,
    `payload` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_activity` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `expires_at` TIMESTAMP NULL,
    KEY `timestamp_idx` (`timestamp`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des logs de sécurité
CREATE TABLE IF NOT EXISTS security_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    ip_address VARCHAR(45) NOT NULL,
    action VARCHAR(255) NOT NULL,
    details TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Table des évaluations de cours
CREATE TABLE IF NOT EXISTS course_ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    student_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_rating (course_id, student_id)
);

-- Table des contenus de cours
CREATE TABLE IF NOT EXISTS course_contents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content_type ENUM('video', 'document', 'quiz') NOT NULL,
    content_url VARCHAR(255),
    duration INT COMMENT 'Duration in minutes for videos',
    order_index INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS password_resets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    token VARCHAR(64) NOT NULL,
    expires_at DATETIME NOT NULL,
    used TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_token (token)
);

CREATE TABLE IF NOT EXISTS admin_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(255) NOT NULL,
    action VARCHAR(255) NOT NULL,
    details TEXT,
    ip_address VARCHAR(45) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS login_attempts (
    email VARCHAR(255) PRIMARY KEY,
    attempts INT NOT NULL,
    last_attempt DATETIME NOT NULL
ALTER TABLE login_attempts
ADD COLUMN last_failed_at DATETIME;
    
);
-- Table chapters
CREATE TABLE IF NOT EXISTS chapters (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
-- Pour Cryptographie (supposons id = 2)
INSERT INTO chapters (course_id, title, content, order_number) VALUES
-- Chapitres pour "Ethical Hacking"
(28, 'Introduction au Hacking Éthique', 'Contenu du chapitre 1', 1),
(28, 'Reconnaissance', 'Contenu du chapitre 2', 2),
(28, 'Scan de vulnérabilités', 'Contenu du chapitre 3', 3),
(28, 'Exploitation', 'Contenu du chapitre 4', 4),
(28, 'Post-Exploitation', 'Contenu du chapitre 5', 5),

-- Chapitres pour "Cryptographie"
(29, 'Historique de la cryptographie', 'Contenu du chapitre 1', 1),
(29, 'Chiffrement symétrique', 'Contenu du chapitre 2', 2),
(29, 'Chiffrement asymétrique', 'Contenu du chapitre 3', 3),
(29, 'Fonctions de hachage', 'Contenu du chapitre 4', 4),
(29, 'Applications modernes', 'Contenu du chapitre 5', 5),

-- Chapitres pour "Linux"
(30, 'Introduction à Linux', 'Contenu du chapitre 1', 1),
(30, 'Commandes de base', 'Contenu du chapitre 2', 2),
(30, 'Système de fichiers', 'Contenu du chapitre 3', 3),
(30, 'Permissions et utilisateurs', 'Contenu du chapitre 4', 4),
(30, 'Scripts shell', 'Contenu du chapitre 5', 5),

-- Chapitres pour "SQL"
(31, 'Introduction à SQL', 'Contenu du chapitre 1', 1),
(31, 'SELECT et WHERE', 'Contenu du chapitre 2', 2),
(31, 'INSERT, UPDATE, DELETE', 'Contenu du chapitre 3', 3),
(31, 'JOINS', 'Contenu du chapitre 4', 4),
(31, 'Sous-requêtes', 'Contenu du chapitre 5', 5),

-- Chapitres pour "Python"
(32, 'Introduction à Python', 'Contenu du chapitre 1', 1),
(32, 'Variables et types', 'Contenu du chapitre 2', 2),
(32, 'Conditions et boucles', 'Contenu du chapitre 3', 3),
(32, 'Fonctions', 'Contenu du chapitre 4', 4),
(32, 'POO en Python', 'Contenu du chapitre 5', 5),

-- Chapitres pour "PHP"
(33, 'Introduction à PHP', 'Contenu du chapitre 1', 1),
(33, 'Variables et structures de contrôle', 'Contenu du chapitre 2', 2),
(33, 'Formulaires et $_POST', 'Contenu du chapitre 3', 3),
(33, 'Connexion MySQL', 'Contenu du chapitre 4', 4),
(33, 'Sessions et sécurité', 'Contenu du chapitre 5', 5),

-- Chapitres pour "JavaScript"
(34, 'Introduction à JavaScript', 'Contenu du chapitre 1', 1),
(34, 'Syntaxe et variables', 'Contenu du chapitre 2', 2),
(34, 'DOM et événements', 'Contenu du chapitre 3', 3),
(34, 'Fonctions et callbacks', 'Contenu du chapitre 4', 4),
(34, 'AJAX et fetch', 'Contenu du chapitre 5', 5),

-- Chapitres pour "HTML"
(35, 'Introduction à HTML', 'Contenu du chapitre 1', 1),
(35, 'Structure de base', 'Contenu du chapitre 2', 2),
(35, 'Formulaires', 'Contenu du chapitre 3', 3),
(35, 'Liens et images', 'Contenu du chapitre 4', 4),
(35, 'HTML sémantique', 'Contenu du chapitre 5', 5),

-- Chapitres pour "Java"
(36, 'Introduction à Java', 'Contenu du chapitre 1', 1),
(36, 'Types et opérateurs', 'Contenu du chapitre 2', 2),
(36, 'POO en Java', 'Contenu du chapitre 3', 3),
(36, 'Collections', 'Contenu du chapitre 4', 4),
(36, 'Fichiers et exceptions', 'Contenu du chapitre 5', 5);

);

-- Table progression (corrigée)
CREATE TABLE IF NOT EXISTS progression (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    course_id INT UNSIGNED NOT NULL,
    chapter_id INT UNSIGNED NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    completed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, course_id, chapter_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE
);

