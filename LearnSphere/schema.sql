-- Create the database
CREATE DATABASE IF NOT EXISTS e_learning_platform;

-- Use the database
USE e_learning_platform;

-- Create the modules table
CREATE TABLE IF NOT EXISTS modules (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Create the courses table
CREATE TABLE IF NOT EXISTS courses (
    id INT NOT NULL AUTO_INCREMENT,
    module_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    video_path VARCHAR(255) NOT NULL,
    pdf_path VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (module_id) REFERENCES modules(id) ON DELETE CASCADE
);

-- Create the quizzes table
CREATE TABLE IF NOT EXISTS quizzes (
    id INT NOT NULL AUTO_INCREMENT,
    module_id INT NOT NULL,
    questions TEXT NOT NULL,
    correct_answers TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (module_id) REFERENCES modules(id) ON DELETE CASCADE
);

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student') NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS lessons (
    id INT NOT NULL AUTO_INCREMENT,          -- Identifiant unique pour chaque leçon
    course_id INT NOT NULL,                  -- Lien vers le cours auquel cette leçon appartient
    title VARCHAR(255) NOT NULL,             -- Titre de la leçon
    content TEXT,                            -- Contenu détaillé de la leçon
    video_path VARCHAR(255) NOT NULL,        -- Lien vers la vidéo de la leçon
    pdf_path VARCHAR(255) NOT NULL,          -- Lien vers le PDF de la leçon
    image_path VARCHAR(255) NOT NULL,        -- Lien vers l'image associée à la leçon
    PRIMARY KEY (id),                       -- Clé primaire
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE  -- Lien vers la table `courses`
);
