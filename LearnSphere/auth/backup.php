<?php
// backup.php : Sauvegarde de la base de données
$db_host = 'localhost';
$db_user = 'root';
$db_pass = 'password';
$db_name = 'elearning';
$backup_file = '../backup_' . date('Ymd_His') . '.sql';

$command = "mysqldump --user={$db_user} --password={$db_pass} --host={$db_host} {$db_name} > {$backup_file}";
system($command, $result);

if ($result === 0) {
    echo json_encode(['success' => true, 'file' => $backup_file]);
} else {
    http_response_code(500);
    echo json_encode(['error' => 'Erreur lors de la sauvegarde']);
} 