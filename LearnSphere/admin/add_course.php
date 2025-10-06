<?php
include 'db.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'] ?? null;
    $module_id = $_POST['module_id'] ?? null;
    $videoPath = $_FILES['video']['name'] ?? null;
    $pdfPath = $_FILES['pdf']['name'] ?? null;
    $imagePath = $_FILES['image']['name'] ?? null;

    if (!$title || !$module_id || !$videoPath || !$pdfPath || !$imagePath) {
        echo json_encode(['error' => 'Tous les champs sont obligatoires.']);
        exit;
    }

    // Validate module_id
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM modules WHERE id = ?");
    $stmt->execute([$module_id]);
    if ($stmt->fetchColumn() == 0) {
        echo json_encode(['error' => 'Module invalide.']);
        exit;
    }

    // Save the uploaded files
    $targetDir = "../videos/";
    if (!is_dir($targetDir)) mkdir($targetDir, 0777, true);
    $targetVideo = $targetDir . basename($videoPath);
    if (!move_uploaded_file($_FILES['video']['tmp_name'], $targetVideo)) {
        echo json_encode(['error' => 'Impossible de télécharger la vidéo.']);
        exit;
    }

    $targetDirPdf = "../pdfs/";
    if (!is_dir($targetDirPdf)) mkdir($targetDirPdf, 0777, true);
    $targetPdf = $targetDirPdf . basename($pdfPath);
    if (!move_uploaded_file($_FILES['pdf']['tmp_name'], $targetPdf)) {
        echo json_encode(['error' => 'Impossible de télécharger le PDF.']);
        exit;
    }

    // Save the uploaded image
    $targetDirImage = "../images/";
    if (!is_dir($targetDirImage)) mkdir($targetDirImage, 0777, true);
    $targetImage = $targetDirImage . basename($imagePath);
    if (!move_uploaded_file($_FILES['image']['tmp_name'], $targetImage)) {
        echo json_encode(['error' => 'Impossible de télécharger l\'image.']);
        exit;
    }

    // Insert into database
    try {
        $stmt = $pdo->prepare("INSERT INTO courses (module_id, title, video_path, pdf_path, image_path) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$module_id, $title, $targetVideo, $targetPdf, $targetImage]);
        echo json_encode(['success' => 'Cours ajouté avec succès !']);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Erreur : ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['error' => 'Méthode de requête invalide.']);
}
?>