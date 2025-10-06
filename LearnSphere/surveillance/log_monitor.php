<?php
function monitorLogs($logFile) {
    $lines = file($logFile);
    foreach ($lines as $line) {
        if (preg_match('/erreur|fail|intrusion|blocked/i', $line)) {
            // Détection d'une anomalie
            // Ici, on pourrait envoyer une alerte ou logger ailleurs
        }
    }
} 