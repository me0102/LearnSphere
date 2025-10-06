
USE elearnig_db;

CREATE TABLE cours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB;

CREATE TABLE quiz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cours_id INT,
    niveau ENUM('1','2','3'),
    titre VARCHAR(255),
    FOREIGN KEY (cours_id) REFERENCES cours(id)
) ENGINE=InnoDB;

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT,
    question TEXT,
    option_a TEXT,
    option_b TEXT,
    option_c TEXT,
    option_d TEXT,
    reponse_correcte CHAR(1),
    explication TEXT,
    FOREIGN KEY (quiz_id) REFERENCES quiz(id)
) ENGINE=InnoDB;

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
    ALTER TABLE users ADD COLUMN failed_attempts INT DEFAULT 0;)

CREATE TABLE progression_utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    quiz_id INT,
    score INT,
    date_complete DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quiz(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS recommandations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    cours_id INT,
    message TEXT,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (cours_id) REFERENCES cours(id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS quiz_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score INT NOT NULL,
    total_questions INT NOT NULL,
    date_taken DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quiz(id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS user_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    question_id INT NOT NULL,
    selected_answer CHAR(1) NOT NULL,
    is_correct BOOLEAN NOT NULL,
    session_id VARCHAR(128) NOT NULL,
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quiz(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

ALTER TABLE quiz_results ADD COLUMN session_id VARCHAR(128) NOT NULL AFTER total_questions;
ALTER TABLE quiz ADD COLUMN total_questions INT DEFAULT 20;
ALTER TABLE progression_utilisateur MODIFY score DECIMAL(5,2);

