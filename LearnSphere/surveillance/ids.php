<?php
function detectIntrusion($logFile) {
    $lines = file($logFile);
    foreach ($lines as $line) {
        if (strpos($line, 'failed login') !== false || strpos($line, 'blocked') !== false) {
            // Détection d'une tentative d'intrusion
            // Ici, on pourrait envoyer une alerte ou logger ailleurs
        }
    }
} 