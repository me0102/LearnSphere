<?php
namespace App\Mail;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Mailer {
    private $mailer;
    private $config;

    public function __construct() {
        $this->config = require __DIR__ . '/../../config/mail.php';
        $this->mailer = new PHPMailer(true);
        
        // Configure PHPMailer
        $this->mailer->isSMTP();
        $this->mailer->Host = $this->config['smtp_host'];
        $this->mailer->SMTPAuth = true;
        $this->mailer->Username = $this->config['smtp_username'];
        $this->mailer->Password = $this->config['smtp_password'];
        $this->mailer->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $this->mailer->Port = $this->config['smtp_port'];
        $this->mailer->CharSet = 'UTF-8';
    }

    public function sendPasswordReset($email, $token) {
        try {
            $this->mailer->setFrom($this->config['from_email'], $this->config['from_name']);
            $this->mailer->addAddress($email);
            $this->mailer->isHTML(true);
            
            $resetLink = 'http://' . $_SERVER['HTTP_HOST'] . '/e/auth/reset-password.php?token=' . $token;
            
            $this->mailer->Subject = 'Réinitialisation de mot de passe';
            $this->mailer->Body = "
                <h2>Réinitialisation de votre mot de passe</h2>
                <p>Vous avez demandé la réinitialisation de votre mot de passe.</p>
                <p>Cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe :</p>
                <p><a href='{$resetLink}'>{$resetLink}</a></p>
                <p>Ce lien expirera dans 1 heure.</p>
                <p>Si vous n'avez pas demandé cette réinitialisation, ignorez cet email.</p>";
            
            return $this->mailer->send();
        } catch (Exception $e) {
            error_log("Erreur d'envoi d'email: " . $e->getMessage());
            return false;
        }
    }

    // Méthode de test
    public function testConnection() {
        try {
            $this->mailer->SMTPDebug = SMTP::DEBUG_SERVER;
            return $this->mailer->smtpConnect();
        } catch (Exception $e) {
            error_log("Erreur de connexion SMTP: " . $e->getMessage());
            return false;
        }
    }
}