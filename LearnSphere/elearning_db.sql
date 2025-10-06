-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 02:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

USE elearning_db;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `course_id`, `title`, `content`, `order_number`) VALUES
(1, 28, 'Introduction au Hacking Éthique', 'Contenu du chapitre 1', 1),
(2, 28, 'Reconnaissance', 'Contenu du chapitre 2', 2),
(3, 28, 'Scan de vulnérabilités', 'Contenu du chapitre 3', 3),
(4, 28, 'Exploitation', 'Contenu du chapitre 4', 4),
(5, 28, 'Post-Exploitation', 'Contenu du chapitre 5', 5),
(6, 29, 'Historique de la cryptographie', 'Contenu du chapitre 1', 1),
(7, 29, 'Chiffrement symétrique', 'Contenu du chapitre 2', 2),
(8, 29, 'Chiffrement asymétrique', 'Contenu du chapitre 3', 3),
(9, 29, 'Fonctions de hachage', 'Contenu du chapitre 4', 4),
(10, 29, 'Applications modernes', 'Contenu du chapitre 5', 5),
(11, 30, 'Introduction à Linux', 'Contenu du chapitre 1', 1),
(12, 30, 'Commandes de base', 'Contenu du chapitre 2', 2),
(13, 30, 'Système de fichiers', 'Contenu du chapitre 3', 3),
(14, 30, 'Permissions et utilisateurs', 'Contenu du chapitre 4', 4),
(15, 30, 'Scripts shell', 'Contenu du chapitre 5', 5),
(16, 31, 'Introduction à SQL', 'Contenu du chapitre 1', 1),
(17, 31, 'SELECT et WHERE', 'Contenu du chapitre 2', 2),
(18, 31, 'INSERT, UPDATE, DELETE', 'Contenu du chapitre 3', 3),
(19, 31, 'JOINS', 'Contenu du chapitre 4', 4),
(20, 31, 'Sous-requêtes', 'Contenu du chapitre 5', 5),
(21, 32, 'Introduction à Python', 'Contenu du chapitre 1', 1),
(22, 32, 'Variables et types', 'Contenu du chapitre 2', 2),
(23, 32, 'Conditions et boucles', 'Contenu du chapitre 3', 3),
(24, 32, 'Fonctions', 'Contenu du chapitre 4', 4),
(25, 32, 'POO en Python', 'Contenu du chapitre 5', 5),
(26, 33, 'Introduction à PHP', 'Contenu du chapitre 1', 1),
(27, 33, 'Variables et structures de contrôle', 'Contenu du chapitre 2', 2),
(28, 33, 'Formulaires et $_POST', 'Contenu du chapitre 3', 3),
(29, 33, 'Connexion MySQL', 'Contenu du chapitre 4', 4),
(30, 33, 'Sessions et sécurité', 'Contenu du chapitre 5', 5),
(31, 34, 'Introduction à JavaScript', 'Contenu du chapitre 1', 1),
(32, 34, 'Syntaxe et variables', 'Contenu du chapitre 2', 2),
(33, 34, 'DOM et événements', 'Contenu du chapitre 3', 3),
(34, 34, 'Fonctions et callbacks', 'Contenu du chapitre 4', 4),
(35, 34, 'AJAX et fetch', 'Contenu du chapitre 5', 5),
(36, 35, 'Introduction à HTML', 'Contenu du chapitre 1', 1),
(37, 35, 'Structure de base', 'Contenu du chapitre 2', 2),
(38, 35, 'Formulaires', 'Contenu du chapitre 3', 3),
(39, 35, 'Liens et images', 'Contenu du chapitre 4', 4),
(40, 35, 'HTML sémantique', 'Contenu du chapitre 5', 5),
(41, 36, 'Introduction à Java', 'Contenu du chapitre 1', 1),
(42, 36, 'Types et opérateurs', 'Contenu du chapitre 2', 2),
(43, 36, 'POO en Java', 'Contenu du chapitre 3', 3),
(44, 36, 'Collections', 'Contenu du chapitre 4', 4),
(45, 36, 'Fichiers et exceptions', 'Contenu du chapitre 5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`id`, `titre`, `description`) VALUES
(1, 'HTML', 'Langage de balisage web'),
(2, 'JavaScript', 'Langage de programmation client-side'),
(3, 'Linux', 'Système d exploitation open-source'),
(4, 'Cryptographie', 'Science du chiffrement'),
(5, 'PHP', 'Langage de script serveur'),
(6, 'Python', 'Langage de programmation généraliste'),
(7, 'SQL', 'Langage de gestion de bases de données'),
(8, 'Ethical Hacking', 'Sécurité informatique offensive');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `level` enum('beginner','intermediate','advanced') NOT NULL,
  `duration` int(11) DEFAULT NULL COMMENT 'Duration in minutes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_published` tinyint(1) DEFAULT 0,
  `slug` int(50) NOT NULL,
  `image_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `category`, `level`, `duration`, `created_at`, `updated_at`, `is_published`, `slug`, `image_path`) VALUES
(28, 'Ethical Hacking', 'Cours complet sur les techniques de pentest', 'Cybersécurité', 'beginner', 120, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(29, 'Cryptographie', 'Introduction aux concepts de cryptographie moderne', 'Cybersécurité', 'beginner', 90, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(30, 'Linux', 'Maîtriser les bases de Linux', 'Systèmes', 'beginner', 100, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(31, 'SQL', 'Manipulation de bases de données relationnelles', 'Base de données', 'beginner', 100, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(32, 'Python', 'Programmation Python de A à Z', 'Programmation', 'beginner', 100, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(33, 'PHP', 'Développement web avec PHP', 'Programmation', 'beginner', 100, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(34, 'JavaScript', 'Introduction à JavaScript', 'Programmation', 'beginner', 100, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(35, 'HTML', 'Apprendre HTML et créer des pages web', 'Développement web', 'beginner', 100, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, ''),
(36, 'Java', 'Programmation Java de base à avancé', 'Programmation', 'beginner', 120, '2025-05-10 03:08:14', '2025-05-10 03:08:14', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `course_contents`
--

CREATE TABLE `course_contents` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_type` enum('video','document','quiz') NOT NULL,
  `content_url` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL COMMENT 'Duration in minutes for videos',
  `order_index` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollments`
--

CREATE TABLE `course_enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrollment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `completion_date` timestamp NULL DEFAULT NULL,
  `progress` int(11) DEFAULT 0 COMMENT 'Progress percentage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_ratings`
--

CREATE TABLE `course_ratings` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `attempts` int(11) DEFAULT 1,
  `last_attempt` timestamp NOT NULL DEFAULT current_timestamp(),
  `failed_attempts` int(11) DEFAULT 0,
  `last_failed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip`, `email`, `attempts`, `last_attempt`, `failed_attempts`, `last_failed_at`) VALUES
(2, '::1', 'sara088@gmail.com', 2, '2025-05-09 16:01:17', 0, NULL),
(4, '::1', 'admin@gmail.com', 2, '2025-05-09 16:02:21', 0, NULL),
(6, '::1', 'sara@gmail.com', 1, '2025-05-09 16:02:51', 0, NULL),
(7, '::1', 'admin@ecole.com', 6, '2025-05-09 19:31:43', 0, NULL),
(12, '::1', 'adminadmin@ecole.com', 1, '2025-05-09 19:26:47', 0, NULL),
(14, '', 'da@gmail.com', 3, '2025-05-09 22:21:19', 0, NULL),
(15, '::1', 'ro@gmail.vom', 1, '2025-05-09 21:33:20', 1, '2025-05-09 21:33:20'),
(16, '::1', 'najis@gmail.com', 1, '2025-05-09 21:35:18', 1, '2025-05-09 21:35:19'),
(17, '::1', 'wiam@gmai.com', 1, '2025-05-11 23:36:05', 1, '2025-05-12 00:36:05'),
(19, '::1', 'admin@example.co', 1, '2025-05-20 10:41:38', 1, '2025-05-20 11:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `progression`
--

CREATE TABLE `progression` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `chapter_id` int(10) UNSIGNED NOT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `completed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progression`
--

INSERT INTO `progression` (`id`, `user_id`, `course_id`, `chapter_id`, `is_completed`, `completed_at`) VALUES
(1, 15, 0, 0, 1, '2025-05-10 02:24:20'),
(2, 16, 0, 0, 1, '2025-05-10 03:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `progression_utilisateur`
--

CREATE TABLE `progression_utilisateur` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `date_complete` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_a` text DEFAULT NULL,
  `option_b` text DEFAULT NULL,
  `option_c` text DEFAULT NULL,
  `option_d` text DEFAULT NULL,
  `reponse_correcte` char(1) DEFAULT NULL,
  `explication` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `reponse_correcte`, `explication`) VALUES
(121, 1, 'Quelle est la balise racine d\'un document HTML?', '<html>', '<head>', '<body>', '<root>', 'A', 'La balise <html> est l\'élément racine qui contient tout le document.'),
(122, 1, 'Quelle balise utilise-t-on pour créer un titre principal?', '<h1>', '<title>', '<header>', '<head>', 'A', '<h1> représente le titre le plus important de la page.'),
(123, 1, 'Quelle balise crée un lien hypertexte?', '<a>', '<link>', '<href>', '<url>', 'A', 'La balise <a> avec l\'attribut href crée des liens.'),
(124, 1, 'Quelle balise insère une image?', '<img>', '<image>', '<picture>', '<src>', 'A', '<img> avec l\'attribut src spécifie l\'image.'),
(125, 1, 'Quelle balise crée une liste non ordonnée?', '<ul>', '<ol>', '<li>', '<list>', 'A', '<ul> crée une liste à puces, <ol> une liste numérotée.'),
(126, 1, 'Quelle balise contient le contenu principal visible?', '<body>', '<main>', '<content>', '<div>', 'A', 'Le contenu visible se trouve dans <body>.'),
(127, 1, 'Quelle balise crée un paragraphe?', '<p>', '<para>', '<text>', '<pg>', 'A', 'La balise <p> définit un paragraphe.'),
(128, 1, 'Quel attribut spécifie l\'URL d\'un lien?', 'href', 'src', 'url', 'link', 'A', 'href (Hypertext REFerence) définit la destination du lien.'),
(129, 1, 'Quelle balise crée un saut de ligne?', '<br>', '<lb>', '<break>', '<newline>', 'A', '<br> crée un retour à la ligne.'),
(130, 1, 'Quelle balise définit l\'en-tête du document?', '<head>', '<header>', '<top>', '<meta>', 'A', '<head> contient les métadonnées.'),
(131, 1, 'Quelle balise crée une ligne horizontale?', '<hr>', '<line>', '<hl>', '<hrule>', 'A', '<hr> crée une ligne de séparation.'),
(132, 1, 'Quelle balise est utilisée pour les commentaires?', '<!-- -->', '<comment>', '<!comment>', '<cmt>', 'A', 'Les commentaires HTML commencent par <!-- et finissent par -->.'),
(133, 1, 'Quelle balise définit une liste d\'éléments?', '<li>', '<item>', '<list>', '<dl>', 'A', '<li> définit un élément de liste dans <ul> ou <ol>.'),
(134, 1, 'Quelle balise crée un formulaire?', '<form>', '<input>', '<submit>', '<frm>', 'A', '<form> contient les éléments d\'un formulaire.'),
(135, 1, 'Quelle balise crée un champ texte?', '<input type=\"text\">', '<textfield>', '<txt>', '<text>', 'A', 'L\'élément <input> avec type=\"text\" crée un champ de saisie.'),
(136, 1, 'Quelle balise crée un bouton?', '<button>', '<btn>', '<submit>', '<input type=\"button\">', 'A', 'Les deux méthodes sont valides mais <button> est préféré.'),
(137, 1, 'Quelle balise définit le titre de l\'onglet?', '<title>', '<h1>', '<header>', '<tab>', 'A', '<title> dans <head> définit le titre de l\'onglet.'),
(138, 1, 'Quelle balise importe une feuille de style?', '<link rel=\"stylesheet\">', '<style>', '<css>', '<import>', 'A', '<link> avec rel=\"stylesheet\" importe des CSS externes.'),
(139, 1, 'Quelle balise crée une liste déroulante?', '<select>', '<dropdown>', '<option>', '<datalist>', 'A', '<select> crée une liste déroulante avec des <option>.'),
(140, 1, 'Quel est le doctype HTML5 correct?', '<!DOCTYPE html>', '<!DOCTYPE HTML>', '<!DOCTYPE HTML5>', '<!DOCTYPE>', 'A', 'Le doctype minimal pour HTML5 est <!DOCTYPE html>.'),
(141, 2, 'Quelle balise sémantique représente le contenu principal?', '<main>', '<div>', '<content>', '<body>', 'A', '<main> identifie le contenu principal de la page.'),
(142, 2, 'Quelle balise crée un tableau?', '<table>', '<grid>', '<tab>', '<data>', 'A', '<table> crée un tableau avec <tr> pour les lignes.'),
(143, 2, 'Quelle balise définit une cellule de tableau?', '<td>', '<cell>', '<th>', '<tr>', 'A', '<td> = table data, <th> = table header.'),
(144, 2, 'Quel attribut fusionne des colonnes?', 'colspan', 'rowspan', 'merge', 'span', 'A', 'colspan fusionne horizontalement, rowspan verticalement.'),
(145, 2, 'Quelle balise crée un formulaire avec méthode POST?', '<form method=\"POST\">', '<post>', '<form type=\"POST\">', '<form action=\"POST\">', 'A', 'method=\"POST\" envoie les données via headers HTTP.'),
(146, 2, 'Quelle balise crée une zone de texte multiligne?', '<textarea>', '<input type=\"text\">', '<text>', '<multiline>', 'A', '<textarea> permet des saisies multilignes.'),
(147, 2, 'Quel type d\'input crée une case à cocher?', 'checkbox', 'radio', 'toggle', 'switch', 'A', 'checkbox permet des sélections multiples.'),
(148, 2, 'Quel attribut rend un champ obligatoire?', 'required', 'mandatory', 'validate', 'necessary', 'A', 'required force la saisie avant soumission.'),
(149, 2, 'Quelle balise groupe des éléments de formulaire?', '<fieldset>', '<group>', '<div>', '<form-group>', 'A', '<fieldset> groupe logiquement des contrôles.'),
(150, 2, 'Quelle balise ajoute une légende à un fieldset?', '<legend>', '<label>', '<caption>', '<title>', 'A', '<legend> décrit le groupe de <fieldset>.'),
(151, 2, 'Quelle balise crée une liste de définitions?', '<dl>', '<def>', '<dlist>', '<define>', 'A', '<dl> contient des termes (<dt>) et descriptions (<dd>).'),
(152, 2, 'Quelle balise représente un contenu indépendant?', '<article>', '<section>', '<div>', '<content>', 'A', '<article> est autonome (ex: blog post).'),
(153, 2, 'Quelle balise améliore l\'accessibilité des images?', '<figure>', '<pic>', '<img>', '<illustration>', 'A', '<figure> avec <figcaption> améliore l\'accessibilité.'),
(154, 2, 'Quel attribut lie un label à un input?', 'for', 'id', 'name', 'link', 'A', 'Le for du label doit correspondre à l\'id de l\'input.'),
(155, 2, 'Quelle balise crée une barre de navigation?', '<nav>', '<navbar>', '<menu>', '<navigation>', 'A', '<nav> identifie une section de navigation.'),
(156, 2, 'Quelle balise insère une vidéo?', '<video>', '<media>', '<movie>', '<vp9>', 'A', '<video> avec src ou <source> enfants.'),
(157, 2, 'Quelle balise crée un contenu latéral?', '<aside>', '<sidebar>', '<div>', '<side>', 'A', '<aside> contient du contenu tangentiel.'),
(158, 2, 'Quel élément crée un tooltip?', 'title', 'tooltip', 'hover', 'alt', 'A', 'L\'attribut title crée un tooltip au survol.'),
(159, 2, 'Quelle balise crée un pied de page sémantique?', '<footer>', '<bottom>', '<foot>', '<end>', 'A', '<footer> contient des infos de fin de page.'),
(160, 2, 'Quelle balise optimise pour les moteurs de recherche?', '<meta name=\"description\">', '<seo>', '<optimize>', '<search>', 'A', 'La meta description est utilisée dans les résultats de recherche.'),
(161, 3, 'Quel attribut améliore l\'accessibilité pour les lecteurs d\'écran?', 'aria-label', 'alt', 'title', 'access', 'A', 'aria-label fournit un texte invisible aux technologies d\'assistance.'),
(162, 3, 'Quelle meta tag permet le responsive design?', '<meta name=\"viewport\">', '<meta name=\"responsive\">', '<meta http-equiv=\"X-UA-Compatible\">', '<meta charset>', 'A', 'Le viewport contrôle l\'affichage sur mobiles.'),
(163, 3, 'Quelle technique charge des images adaptatives?', '<picture> avec <source>', '<img srcset>', 'adaptive-image', 'Media queries CSS', 'A', 'srcset et <picture> offrent le responsive images.'),
(164, 3, 'Quel attribut optimise le chargement différé?', 'loading=\"lazy\"', 'defer', 'async', 'lazy-load', 'A', 'loading=\"lazy\" retarde le chargement des images hors écran.'),
(165, 3, 'Quelle balise implémente les microdonnées?', '<div itemscope>', '<microdata>', '<data>', '<schema>', 'A', 'itemscope et itemprop structurent les microdonnées.'),
(166, 3, 'Quelle API permet le stockage local?', 'localStorage', 'sessionStorage', 'Cookies', 'Cache API', 'A', 'localStorage persiste même après fermeture du navigateur.'),
(167, 3, 'Quelle balise crée un canvas pour dessiner?', '<canvas>', '<svg>', '<draw>', '<graphics>', 'A', '<canvas> permet le dessin via JavaScript.'),
(168, 3, 'Quelle balise intègre du SVG?', '<svg>', '<canvas>', '<vector>', '<image>', 'A', '<svg> permet d\'intégrer directement des graphiques vectoriels.'),
(169, 3, 'Quelle méthode améliore les performances de rendu?', 'Utiliser le Critical CSS', 'Inline tous les CSS', 'Charger les CSS en fin de page', 'Utiliser !important', 'A', 'Le Critical CSS charge le CSS nécessaire pour le contenu visible.'),
(170, 3, 'Quel attribut précharge les ressources?', 'rel=\"preload\"', 'rel=\"prefetch\"', 'rel=\"dns-prefetch\"', 'rel=\"prerender\"', 'A', 'preload indique au navigateur de charger une ressource tôt.'),
(171, 3, 'Quel est l\'avantage de la balise <picture>?', 'Permet de charger des images en fonction de la taille de l\'écran', 'Permet de créer des images interactives', 'Permet de charger des images dynamiquement', 'Améliore l\'accessibilité des images', 'A', 'La balise <picture> est utilisée pour charger des images en fonction de la résolution et de la taille de l\'écran.'),
(172, 3, 'Comment optimiser l\'accessibilité des vidéos?', 'En ajoutant des sous-titres et des transcriptions', 'En utilisant un lecteur vidéo HTML5', 'En réduisant la taille des vidéos', 'En utilisant la balise <video> uniquement', 'A', 'Les sous-titres et les transcriptions rendent les vidéos accessibles aux personnes malentendantes.'),
(173, 3, 'Quel est le but des attributs ARIA?', 'Améliorer l\'accessibilité des éléments pour les utilisateurs de lecteurs d\'écran', 'Rendre les éléments visibles à l\'écran', 'Améliorer le référencement des sites', 'Contrôler la mise en page', 'A', 'Les attributs ARIA rendent les éléments plus accessibles aux technologies d\'assistance.'),
(174, 3, 'Quel est l\'objectif des media queries en CSS?', 'Adapter le style en fonction des caractéristiques de l\'appareil', 'Modifier l\'HTML d\'un site', 'Réduire la taille des images', 'Optimiser le code JavaScript', 'A', 'Les media queries permettent de définir des styles en fonction de la taille de l\'écran, de l\'orientation, etc.'),
(175, 3, 'Que permet l\'attribut \"async\" dans les balises <script>?', 'Charger le script de manière asynchrone', 'Exécuter le script uniquement après le chargement complet de la page', 'Exécuter le script immédiatement', 'Différer le chargement du script', 'A', 'L\'attribut async permet de charger un script sans bloquer le rendu de la page.'),
(176, 3, 'Quelle balise est utilisée pour ajouter des métadonnées de réseaux sociaux?', '<meta property=\"og:image\">', '<meta name=\"twitter:image\">', '<meta name=\"social-image\">', '<meta data=\"image\">', 'A', 'Les balises og (Open Graph) et Twitter sont utilisées pour ajouter des métadonnées pour le partage sur les réseaux sociaux.'),
(177, 3, 'Quel attribut dans <link> permet de spécifier l\'image à afficher pour un site web sur un appareil mobile?', 'rel=\"apple-touch-icon\"', 'rel=\"icon\"', 'rel=\"mobile-icon\"', 'rel=\"touch-icon\"', 'A', 'rel=\"apple-touch-icon\" définit l\'icône d\'un site pour les appareils Apple.'),
(178, 3, 'Quel attribut est utilisé pour spécifier un type MIME pour une ressource?', 'type', 'src', 'media', 'mime', 'A', 'L\'attribut type spécifie le type MIME d\'une ressource.'),
(179, 3, 'Quel est l\'avantage de l\'utilisation du \"defer\" pour les scripts?', 'Différer l\'exécution du script jusqu\'à ce que le document soit entièrement analysé', 'Exécuter le script dès que possible', 'Charger le script sans attendre', 'Ne pas bloquer l\'analyse du document', 'A', 'L\'attribut defer empêche un script de bloquer le rendu de la page.'),
(180, 3, 'Quel attribut permet d\'inclure des fichiers SVG dans le HTML?', 'src', 'href', 'use', 'embed', 'A', 'L\'élément <use> est utilisé pour inclure un fichier SVG externe dans un document HTML.'),
(181, 3, 'Quel est l\'avantage de la gestion des ressources avec \"rel=preload\"?', 'Permet de charger des ressources importantes dès le début', 'Permet de charger des ressources après le rendu', 'Permet de compresser les ressources', 'Permet de charger des images uniquement au survol', 'A', 'Preload permet de charger des ressources essentielles avant que la page ne soit complètement rendue.'),
(182, 4, 'Quel est le bon moyen de déclarer une variable en JavaScript?', 'var', 'let', 'const', 'Tous les précédents', 'D', 'Les trois mots-clés sont valides pour déclarer une variable en JavaScript.'),
(183, 4, 'Comment afficher un message dans la console?', 'console.log()', 'alert()', 'print()', 'echo()', 'A', 'console.log() est utilisé pour afficher des messages dans la console du navigateur.'),
(184, 4, 'Quel opérateur est utilisé pour l\'addition en JavaScript?', '+', '-', '*', '/', 'A', 'L\'opérateur + est utilisé pour additionner en JavaScript.'),
(185, 4, 'Quelle est la différence entre == et ===?', '== compare les valeurs, === compare les valeurs et les types', 'Aucune', '== compare les types', '=== compare uniquement les types', 'A', '== compare seulement les valeurs, tandis que === compare les valeurs et les types.'),
(186, 4, 'Comment déclarer une fonction en JavaScript?', 'function maFonction()', 'def maFonction()', 'function = maFonction()', 'maFonction() =>', 'A', 'En JavaScript, une fonction se déclare avec le mot-clé \"function\".'),
(187, 4, 'Quel type de données est retourné par la méthode prompt()?', 'String', 'Number', 'Boolean', 'Object', 'A', 'La méthode prompt() retourne une chaîne de caractères (string).'),
(188, 4, 'Que fait la méthode parseInt()?', 'Convertit une chaîne en nombre entier', 'Convertit une chaîne en nombre décimal', 'Convertit un nombre entier en chaîne', 'Rien', 'A', 'parseInt() convertit une chaîne de caractères en un nombre entier.'),
(189, 4, 'Quel est le résultat de 2 + \"2\" en JavaScript?', '\"22\"', '4', 'NaN', 'Erreur', 'A', 'Le + entre un nombre et une chaîne effectue une concaténation, donnant \"22\".'),
(190, 4, 'Quel mot-clé est utilisé pour créer une constante en JavaScript?', 'const', 'let', 'var', 'constant', 'A', 'const est utilisé pour déclarer une constante dont la valeur ne peut pas être modifiée.'),
(191, 4, 'Quel est le type de données de null?', 'Object', 'Undefined', 'Boolean', 'String', 'A', 'Null est un objet en JavaScript, bien que cela soit contre-intuitif.'),
(192, 4, 'Que fait la méthode isNaN()?', 'Vérifie si une valeur est NaN (Not a Number)', 'Vérifie si une valeur est une chaîne', 'Vérifie si une valeur est un nombre', 'Vérifie si une valeur est undefined', 'A', 'isNaN() vérifie si une valeur est NaN (Not a Number).'),
(193, 4, 'Comment créer un tableau en JavaScript?', 'let tableau = []', 'let tableau = {}', 'let tableau = ()', 'let tableau = \"\"', 'A', 'Un tableau est créé en utilisant des crochets [].'),
(194, 4, 'Quel est le résultat de typeof 42?', 'number', 'string', 'boolean', 'object', 'A', 'La fonction typeof retourne \"number\" pour le type de données 42.'),
(195, 4, 'Que retourne la méthode Math.random()?', 'Un nombre aléatoire entre 0 et 1', 'Un entier aléatoire', 'Un nombre aléatoire entre 1 et 100', 'Un nombre aléatoire entre 0 et 100', 'A', 'Math.random() génère un nombre flottant aléatoire entre 0 et 1.'),
(196, 4, 'Quelle est la méthode pour ajouter un élément à la fin d\'un tableau?', 'push()', 'pop()', 'shift()', 'unshift()', 'A', 'push() ajoute un élément à la fin d\'un tableau.'),
(197, 4, 'Quel est le résultat de 5 === \"5\"?', 'false', 'true', 'undefined', 'NaN', 'A', '=== compare à la fois les valeurs et les types, donc le résultat est false.'),
(198, 4, 'Que fait la méthode Array.prototype.slice()?', 'Crée une copie superficielle d\'un tableau', 'Trie un tableau', 'Filtre un tableau', 'Fusionne deux tableaux', 'A', 'slice() permet de créer une copie d\'une portion d\'un tableau.'),
(199, 4, 'Quelle est la méthode pour obtenir la longueur d\'un tableau?', 'length', 'size', 'count', 'width', 'A', 'La propriété length retourne la longueur d\'un tableau.'),
(200, 4, 'Quel est le résultat de 0 == false?', 'true', 'false', 'undefined', 'null', 'A', '== effectue une conversion de type, donc 0 est égal à false.'),
(201, 4, 'Que fait la méthode push() sur un tableau?', 'Ajoute un élément à la fin du tableau', 'Supprime un élément à la fin du tableau', 'Ajoute un élément au début du tableau', 'Supprime un élément au début du tableau', 'A', 'push() ajoute un élément à la fin d\'un tableau.'),
(202, 4, 'Comment peut-on arrêter l\'exécution d\'une fonction JavaScript?', 'Avec return', 'Avec break', 'Avec continue', 'Avec stop()', 'A', 'return permet de quitter une fonction et de retourner une valeur.'),
(203, 5, 'Quelle méthode permet de sélectionner un élément par son ID?', 'getElementById()', 'querySelector()', 'getElementsByClassName()', 'querySelectorAll()', 'A', 'getElementById() sélectionne un élément par son ID unique.'),
(204, 5, 'Comment créer un nouvel élément en JavaScript?', 'document.createElement()', 'document.newElement()', 'document.createNode()', 'document.createNodeElement()', 'A', 'createElement() crée un nouvel élément HTML.'),
(205, 5, 'Comment ajouter un événement à un élément?', 'element.addEventListener()', 'element.attachEvent()', 'element.onClick()', 'element.addEvent()', 'A', 'addEventListener() permet d\'ajouter des événements de manière moderne et flexible.'),
(206, 5, 'Quelle méthode permet de modifier le contenu d\'un élément?', 'innerHTML', 'textContent', 'setContent()', 'htmlContent()', 'A', 'innerHTML permet de changer le contenu HTML d\'un élément.'),
(207, 5, 'Que fait la méthode appendChild()?', 'Ajoute un élément enfant à un élément parent', 'Supprime un élément enfant', 'Déplace un élément', 'Crée un élément', 'A', 'appendChild() ajoute un nouvel enfant à un élément parent.'),
(208, 5, 'Quel est le rôle de querySelector()?', 'Sélectionner le premier élément correspondant au sélecteur CSS', 'Sélectionner tous les éléments correspondant au sélecteur CSS', 'Sélectionner un élément par son ID', 'Sélectionner un élément par sa classe', 'A', 'querySelector() sélectionne le premier élément correspondant à un sélecteur CSS.'),
(209, 5, 'Comment supprimer un élément du DOM?', 'element.remove()', 'element.delete()', 'element.removeChild()', 'element.destroy()', 'A', 'remove() supprime un élément du DOM.'),
(210, 5, 'Que fait la méthode setAttribute()?', 'Modifie un attribut d\'un élément', 'Crée un attribut d\'élément', 'Supprime un attribut', 'Change le type d\'élément', 'A', 'setAttribute() permet de définir un attribut d\'élément HTML.'),
(211, 5, 'Comment changer la couleur d\'un élément?', 'element.style.color = \"red\";', 'element.color = \"red\";', 'element.setColor(\"red\");', 'element.setStyle(\"color\", \"red\");', 'A', 'On peut modifier le style en accédant à la propriété style de l\'élément.'),
(212, 5, 'Quelle méthode permet de créer un tableau d\'éléments du DOM?', 'document.querySelectorAll()', 'document.getElementsByTagName()', 'document.getElementById()', 'document.querySelector()', 'A', 'querySelectorAll() retourne une liste de tous les éléments correspondant au sélecteur CSS.'),
(213, 5, 'Quel attribut permet de définir une classe CSS pour un élément?', 'class', 'id', 'style', 'type', 'A', 'L\'attribut class définit la ou les classes CSS d\'un élément.'),
(214, 5, 'Comment créer un événement de clic?', 'button.addEventListener(\"click\", function() {...})', 'button.onclick = function() {...}', 'button.click() = function() {...}', 'button.onClick()', 'A', 'addEventListener() est utilisé pour écouter les événements comme \"click\".'),
(215, 5, 'Comment ajouter un nouvel élément à un parent?', 'parent.appendChild(child)', 'parent.insertChild(child)', 'parent.addChild(child)', 'parent.append(child)', 'A', 'appendChild() ajoute un nouvel élément enfant à un parent dans le DOM.'),
(216, 5, 'Quel est le résultat de document.querySelectorAll(\"p\")?', 'Tous les éléments <p> de la page', 'Le premier élément <p> de la page', 'Le dernier élément <p> de la page', 'Les éléments <p> avec une classe spécifique', 'A', 'querySelectorAll() retourne tous les éléments correspondants au sélecteur CSS.'),
(217, 5, 'Comment ajouter une classe à un élément?', 'element.classList.add(\"maClasse\")', 'element.addClass(\"maClasse\")', 'element.class.add(\"maClasse\")', 'element.addClassName(\"maClasse\")', 'A', 'classList.add() permet d\'ajouter une classe à un élément.'),
(218, 5, 'Comment vérifier si un élément contient une classe?', 'element.classList.contains(\"maClasse\")', 'element.hasClass(\"maClasse\")', 'element.containsClass(\"maClasse\")', 'element.class.contains(\"maClasse\")', 'A', 'classList.contains() permet de vérifier si un élément possède une classe donnée.'),
(219, 5, 'Que fait la méthode removeChild()?', 'Supprime un enfant d\'un élément', 'Ajoute un enfant à un élément', 'Crée un enfant pour un élément', 'Modifie le texte d\'un enfant', 'A', 'removeChild() permet de supprimer un élément enfant du DOM.'),
(220, 5, 'Quelle méthode permet de vider le contenu d\'un élément?', 'element.innerHTML = \"\"', 'element.clear()', 'element.removeContent()', 'element.empty()', 'A', 'On vide le contenu d\'un élément en lui assignant une chaîne vide.'),
(221, 5, 'Quel est le rôle de textContent?', 'Modifier uniquement le texte sans affecter le HTML', 'Modifier le texte et le HTML', 'Modifier le style d\'un élément', 'Supprimer du texte', 'A', 'textContent modifie uniquement le texte d\'un élément sans changer son HTML.'),
(222, 6, 'Que fait l\'instruction async?', 'Déclare une fonction asynchrone', 'Exécute du code de manière synchrone', 'Bloque l\'exécution jusqu\'à la fin', 'Retourne une promesse', 'A', 'async permet de déclarer une fonction qui retourne toujours une promesse.'),
(223, 6, 'Quel est l\'avantage de await?', 'Attendre une promesse', 'Appeler une fonction', 'Renvoyer une promesse', 'Déclarer une promesse', 'A', 'await attend la résolution de la promesse avant de continuer l\'exécution.'),
(224, 6, 'Que renvoie une fonction async?', 'Une promesse', 'Un tableau', 'Un nombre', 'Une chaîne de caractères', 'A', 'Une fonction async renvoie toujours une promesse, même si aucune promesse n\'est utilisée explicitement.'),
(225, 6, 'Quelle est la méthode pour gérer les erreurs dans les fonctions asynchrones?', 'try/catch', 'throw', 'catch', 'finally', 'A', 'try/catch est utilisé pour capturer les erreurs dans les fonctions asynchrones.'),
(226, 6, 'Que fait Promise.all()?', 'Exécute plusieurs promesses en parallèle et attend leur résolution', 'Exécute les promesses séquentiellement', 'Renvoie une seule promesse', 'Attends que la première promesse soit résolue', 'A', 'Promise.all() attend que toutes les promesses passées soient résolues.'),
(227, 6, 'Que fait l\'opérateur await?', 'Attendre la résolution d\'une promesse', 'Résoudre une promesse', 'Créer une promesse', 'Retourner une promesse', 'A', 'await est utilisé pour attendre la résolution d\'une promesse avant de continuer l\'exécution du code.'),
(228, 6, 'Que renvoie une promesse rejetée?', 'Un objet Promise avec l\'erreur', 'Une chaîne de caractères avec l\'erreur', 'Une exception', 'Un tableau d\'erreurs', 'A', 'Une promesse rejetée renvoie un objet Promise avec l\'erreur.'),
(229, 6, 'Que fait la méthode .then() sur une promesse?', 'Exécute du code lorsque la promesse est résolue', 'Rejette la promesse', 'Crée une nouvelle promesse', 'Annule la promesse', 'A', '.then() est appelé lorsque la promesse est résolue avec succès.'),
(230, 6, 'Que fait la méthode .catch() sur une promesse?', 'Attrape une erreur si la promesse est rejetée', 'Résout la promesse', 'Annule la promesse', 'Crée une nouvelle promesse', 'A', '.catch() est utilisé pour attraper les erreurs dans les promesses rejetées.'),
(231, 6, 'Quel est l\'avantage des fonctions async/await par rapport aux promesses classiques?', 'Code plus lisible et plus facile à maintenir', 'Plus rapide', 'Moins de gestion des erreurs', 'Pas d\'avantage', 'A', 'Les fonctions async/await rendent le code plus lisible et évitent les \"callback hell\".'),
(232, 6, 'Comment fonctionne la gestion des erreurs avec async/await?', 'Avec try/catch', 'Avec Promise.all()', 'Avec finally', 'Avec then/catch', 'A', 'Les erreurs dans async/await sont gérées avec try/catch.'),
(233, 6, 'Que fait la méthode finally dans une promesse?', 'Exécute du code après la résolution ou le rejet de la promesse', 'Rejette la promesse', 'Résout la promesse', 'Annule l\'exécution de la promesse', 'A', 'finally s\'exécute toujours, qu\'il y ait une erreur ou non dans la promesse.'),
(234, 6, 'Quelle est la différence principale entre async/await et les promesses classiques?', 'async/await est plus lisible', 'async/await est plus rapide', 'Les promesses classiques ne peuvent pas gérer les erreurs', 'Aucune', 'A', 'async/await simplifie le code, notamment pour la gestion des erreurs.'),
(235, 6, 'Que fait la méthode setTimeout()?', 'Exécute une fonction après un délai spécifié', 'Exécute une fonction immédiatement', 'Exécute une fonction après un certain nombre d\'itérations', 'Annule la promesse', 'A', 'setTimeout() exécute une fonction après un certain délai spécifié.'),
(236, 6, 'Qu\'est-ce qu\'une promesse en JavaScript?', 'Un objet représentant l\'éventuelle réussite ou échec d\'une opération asynchrone', 'Un objet qui bloque l\'exécution de code', 'Un type de données pour stocker des résultats', 'Un tableau de valeurs multiples', 'A', 'Une promesse est utilisée pour gérer les opérations asynchrones.'),
(237, 6, 'Quel est le but de l\'instruction await?', 'Attendre la résolution d\'une promesse avant d\'exécuter le code suivant', 'Lancer une promesse', 'Créer une promesse', 'Annuler une promesse', 'A', 'await permet d\'attendre la résolution d\'une promesse avant d\'exécuter le code suivant.'),
(238, 6, 'Qu\'est-ce qu\'une fonction asynchrone en JavaScript?', 'Une fonction qui retourne une promesse', 'Une fonction synchrone', 'Une fonction qui bloque l\'exécution', 'Une fonction qui n\'accepte pas les paramètres', 'A', 'Une fonction async retourne toujours une promesse, même si aucune promesse explicite n\'est utilisée.'),
(239, 6, 'Comment convertir un callback en une promesse?', 'En utilisant Promise.resolve()', 'En utilisant async/await', 'En utilisant .then()', 'En utilisant setTimeout()', 'A', 'Promise.resolve() permet de convertir une fonction callback en promesse.'),
(240, 7, 'Quelle commande est utilisée pour afficher le contenu d\'un répertoire?', 'ls', 'cd', 'mkdir', 'pwd', 'A', 'La commande \"ls\" est utilisée pour lister le contenu d\'un répertoire.'),
(241, 7, 'Comment changer de répertoire en ligne de commande?', 'cd', 'ls', 'mkdir', 'mv', 'A', 'La commande \"cd\" permet de changer de répertoire.'),
(242, 7, 'Quelle commande est utilisée pour créer un nouveau répertoire?', 'mkdir', 'rmdir', 'touch', 'rm', 'A', 'La commande \"mkdir\" est utilisée pour créer un répertoire.'),
(243, 7, 'Comment afficher l\'adresse IP de la machine?', 'ifconfig', 'ipconfig', 'ping', 'hostname', 'A', 'La commande \"ifconfig\" affiche l\'adresse IP de la machine sous Linux.'),
(244, 7, 'Quel fichier contient les informations sur les utilisateurs?', '/etc/passwd', '/etc/group', '/etc/hostname', '/etc/shadow', 'A', 'Le fichier \"/etc/passwd\" contient les informations des utilisateurs.'),
(245, 7, 'Comment afficher les processus en cours?', 'ps', 'ls', 'top', 'df', 'A', 'La commande \"ps\" affiche la liste des processus en cours d\'exécution.'),
(246, 7, 'Quelle commande permet de supprimer un fichier?', 'rm', 'del', 'remove', 'delete', 'A', 'La commande \"rm\" est utilisée pour supprimer un fichier.'),
(247, 7, 'Comment afficher l\'utilisation de l\'espace disque?', 'df', 'du', 'ls', 'ps', 'A', 'La commande \"df\" affiche l\'utilisation de l\'espace disque.'),
(248, 7, 'Quelle commande permet de déplacer un fichier?', 'mv', 'cp', 'mvfile', 'move', 'A', 'La commande \"mv\" permet de déplacer ou renommer un fichier.'),
(249, 7, 'Comment afficher les informations sur la mémoire?', 'free', 'meminfo', 'top', 'df', 'A', 'La commande \"free\" permet d\'afficher les informations sur la mémoire disponible.'),
(250, 7, 'Comment afficher les fichiers cachés dans un répertoire?', 'ls -a', 'ls -l', 'ls -h', 'ls -d', 'A', 'La commande \"ls -a\" permet d\'afficher les fichiers cachés dans un répertoire.'),
(251, 7, 'Quelle commande permet de rechercher un fichier?', 'find', 'search', 'locate', 'grep', 'A', 'La commande \"find\" permet de rechercher des fichiers sur le système.'),
(252, 7, 'Comment afficher le chemin complet du répertoire actuel?', 'pwd', 'ls', 'cd', 'echo', 'A', 'La commande \"pwd\" affiche le chemin complet du répertoire actuel.'),
(253, 7, 'Quelle commande est utilisée pour afficher la date et l\'heure?', 'date', 'time', 'clock', 'datetime', 'A', 'La commande \"date\" permet d\'afficher la date et l\'heure actuelles.'),
(254, 7, 'Comment afficher les permissions d\'un fichier?', 'ls -l', 'chmod', 'stat', 'ls -a', 'A', 'La commande \"ls -l\" affiche les permissions d\'un fichier.'),
(255, 7, 'Quel fichier contient les informations de groupe?', '/etc/group', '/etc/passwd', '/etc/shadow', '/etc/sudoers', 'A', 'Le fichier \"/etc/group\" contient les informations sur les groupes.'),
(256, 7, 'Comment afficher la documentation d\'une commande?', 'man', 'info', 'help', 'docs', 'A', 'La commande \"man\" permet d\'afficher le manuel d\'une commande.'),
(257, 7, 'Comment fermer une session en ligne de commande?', 'exit', 'logout', 'shutdown', 'close', 'A', 'La commande \"exit\" permet de fermer une session dans un terminal.'),
(258, 7, 'Comment créer un fichier vide?', 'touch', 'nano', 'vim', 'cat', 'A', 'La commande \"touch\" permet de créer un fichier vide.'),
(259, 7, 'Comment compresser un fichier?', 'tar', 'zip', 'gzip', 'compress', 'A', 'La commande \"tar\" permet de compresser et archiver des fichiers sous Linux.'),
(260, 7, 'Comment rediriger la sortie d\'une commande vers un fichier?', '>', '>>', '<', '&', 'A', 'L\'opérateur \">\" permet de rediriger la sortie d\'une commande vers un fichier.'),
(261, 8, 'Comment ajouter un utilisateur sous Linux?', 'useradd', 'adduser', 'usermod', 'addnewuser', 'A', 'La commande \"useradd\" permet d\'ajouter un nouvel utilisateur sous Linux.'),
(262, 8, 'Comment changer le mot de passe d\'un utilisateur?', 'passwd', 'chpasswd', 'modpasswd', 'changepwd', 'A', 'La commande \"passwd\" permet de changer le mot de passe d\'un utilisateur.'),
(263, 8, 'Comment supprimer un utilisateur?', 'userdel', 'deluser', 'removeuser', 'delaccount', 'A', 'La commande \"userdel\" permet de supprimer un utilisateur sous Linux.'),
(264, 8, 'Comment ajouter un utilisateur à un groupe?', 'usermod -aG', 'groupadd', 'addgroup', 'useradd -g', 'A', 'La commande \"usermod -aG\" permet d\'ajouter un utilisateur à un groupe.'),
(265, 8, 'Comment afficher les groupes d\'un utilisateur?', 'groups', 'usergroups', 'id', 'whoami', 'A', 'La commande \"groups\" affiche les groupes d\'un utilisateur.'),
(266, 8, 'Quelle commande permet de modifier les informations d\'un utilisateur?', 'usermod', 'groupmod', 'passwd', 'chuser', 'A', 'La commande \"usermod\" permet de modifier les informations d\'un utilisateur.'),
(267, 8, 'Comment voir les utilisateurs connectés?', 'w', 'who', 'users', 'last', 'A', 'La commande \"w\" affiche les utilisateurs connectés et leur activité.'),
(268, 8, 'Comment changer le shell par défaut d\'un utilisateur?', 'chsh', 'shellmod', 'userchange', 'shellset', 'A', 'La commande \"chsh\" permet de changer le shell par défaut d\'un utilisateur.'),
(269, 8, 'Comment ajouter un groupe sous Linux?', 'groupadd', 'addgroup', 'groupnew', 'addnewgroup', 'A', 'La commande \"groupadd\" permet de créer un nouveau groupe.'),
(270, 8, 'Comment attribuer un mot de passe à un groupe?', 'Il n\'est pas possible d\'attribuer un mot de passe à un groupe', 'grouppasswd', 'gpasswd', 'addgroup passwd', 'A', 'Il n\'est pas possible d\'attribuer un mot de passe à un groupe.'),
(271, 8, 'Quelle commande permet d\'afficher les informations d\'un utilisateur?', 'id', 'userinfo', 'whois', 'finger', 'A', 'La commande \"id\" affiche les informations d\'un utilisateur, comme son UID et ses groupes.'),
(272, 8, 'Comment créer un répertoire personnel pour un utilisateur?', 'useradd -m', 'adduser -home', 'mkdir -u', 'createuserdir', 'A', 'La commande \"useradd -m\" crée un répertoire personnel pour l\'utilisateur.'),
(273, 8, 'Comment afficher les derniers utilisateurs connectés?', 'last', 'who', 'w', 'uptime', 'A', 'La commande \"last\" affiche les derniers utilisateurs connectés.'),
(274, 8, 'Comment verrouiller le compte d\'un utilisateur?', 'passwd -l', 'usermod -L', 'chsh -L', 'lockuser', 'A', 'La commande \"passwd -l\" permet de verrouiller le compte d\'un utilisateur.'),
(275, 8, 'Comment déverrouiller le compte d\'un utilisateur?', 'passwd -u', 'usermod -U', 'chpasswd -u', 'unlockuser', 'A', 'La commande \"passwd -u\" permet de déverrouiller le compte d\'un utilisateur.'),
(276, 8, 'Comment modifier le groupe principal d\'un utilisateur?', 'usermod -g', 'groupmod -u', 'usermod -G', 'groupchange -p', 'A', 'La commande \"usermod -g\" permet de changer le groupe principal d\'un utilisateur.'),
(277, 8, 'Comment supprimer un groupe?', 'groupdel', 'delgroup', 'removegroup', 'deletegroup', 'A', 'La commande \"groupdel\" permet de supprimer un groupe.'),
(278, 8, 'Comment attribuer un mot de passe à un groupe?', 'gpasswd', 'groupmod -p', 'groupadd -p', 'groupadd passwd', 'A', 'La commande \"gpasswd\" permet de gérer les mots de passe des groupes.'),
(279, 8, 'Comment modifier le shell par défaut d\'un utilisateur?', 'chsh', 'usermod', 'userchange', 'modshell', 'A', 'La commande \"chsh\" permet de changer le shell par défaut d\'un utilisateur.'),
(280, 9, 'Quel est l\'interpréteur de commandes par défaut sous Linux?', 'Bash', 'Sh', 'Zsh', 'Fish', 'A', 'Bash est l\'interpréteur de commandes par défaut sous la plupart des distributions Linux.'),
(281, 9, 'Quel est le rôle de la commande \"chmod\"?', 'Changer les permissions d\'un fichier', 'Modifier le contenu d\'un fichier', 'Changer le propriétaire d\'un fichier', 'Afficher les permissions d\'un fichier', 'A', 'La commande \"chmod\" est utilisée pour modifier les permissions d\'un fichier ou d\'un répertoire.'),
(282, 9, 'Quel est le résultat de \"echo $?\" après l\'exécution d\'une commande réussie?', '0', '1', 'Erreur', 'True', 'A', 'La variable $? contient le code de retour de la dernière commande exécutée. \"0\" indique une réussite.'),
(283, 9, 'Comment déclarer une variable dans un script shell?', 'nom_variable=valeur', 'set nom_variable=valeur', 'declare nom_variable=value', 'variable = valeur', 'A', 'En bash, une variable est déclarée avec \"nom_variable=valeur\".'),
(284, 9, 'Quel caractère est utilisé pour commenter une ligne dans un script shell?', '#', '//', ';', '$', 'A', 'Le caractère \"#\" est utilisé pour commenter des lignes dans un script shell.'),
(285, 9, 'Quelle commande permet de définir un alias pour une commande?', 'alias', 'define', 'set', 'create', 'A', 'La commande \"alias\" permet de définir un alias pour une commande.'),
(286, 9, 'Comment exécuter un script shell?', './nom_script.sh', 'sh nom_script.sh', 'bash nom_script.sh', 'run nom_script.sh', 'A', 'Pour exécuter un script shell, on utilise \"./nom_script.sh\".'),
(287, 9, 'Comment afficher le contenu d\'un fichier dans un script?', 'cat', 'echo', 'read', 'type', 'A', 'La commande \"cat\" permet d\'afficher le contenu d\'un fichier.'),
(288, 9, 'Quel est le rôle de la commande \"grep\"?', 'Rechercher une chaîne dans un fichier', 'Afficher les fichiers', 'Afficher les processus', 'Lire un fichier', 'A', 'La commande \"grep\" permet de rechercher une chaîne de caractères dans un fichier.'),
(289, 9, 'Comment créer un script exécutable?', 'chmod +x nom_script.sh', 'chmod -r nom_script.sh', 'chown +x nom_script.sh', 'chmod execute nom_script.sh', 'A', 'La commande \"chmod +x\" rend un fichier exécutable.'),
(290, 9, 'Comment tester si un fichier existe dans un script shell?', '[ -e fichier ]', '[ -f fichier ]', '[ -d fichier ]', '[ -r fichier ]', 'A', 'La commande \"[ -e fichier ]\" teste si un fichier existe.'),
(291, 9, 'Quel est le rôle de la commande \"awk\"?', 'Manipuler le texte ligne par ligne', 'Afficher les fichiers', 'Comparer les fichiers', 'Copier un fichier', 'A', 'La commande \"awk\" est utilisée pour traiter et manipuler du texte ligne par ligne dans des fichiers ou des flux.'),
(292, 9, 'Quel est le rôle de la commande \"sed\"?', 'Modifier un fichier en ligne', 'Afficher un fichier', 'Compresser un fichier', 'Afficher les processus', 'A', 'La commande \"sed\" est utilisée pour effectuer des modifications sur un fichier ou un flux de texte en ligne.'),
(293, 9, 'Comment exécuter une commande en arrière-plan?', 'commande &', 'commande background', 'bg commande', 'run -b commande', 'A', 'En ajoutant \"&\" à la fin d\'une commande, elle est exécutée en arrière-plan.'),
(294, 9, 'Quel est l\'interpréteur de commande utilisé dans un script shell?', 'Bash', 'Sh', 'Zsh', 'Tcsh', 'A', 'Le script shell utilise souvent Bash, mais d\'autres interpréteurs comme Sh ou Zsh peuvent aussi être utilisés.'),
(295, 9, 'Comment vérifier la disponibilité d\'un programme dans un script?', 'which programme', 'whereis programme', 'find programme', 'locate programme', 'A', 'La commande \"which\" permet de vérifier le chemin d\'un programme installé dans le système.'),
(296, 9, 'Comment forcer l\'exécution d\'une commande même si elle échoue?', 'set -e', 'set +e', 'continue', 'exit 0', 'B', 'La commande \"set +e\" permet de forcer l\'exécution même si une commande échoue.'),
(297, 9, 'Comment afficher la date dans un format spécifique dans un script?', 'date +%d-%m-%Y', 'date \"%Y-%m-%d\"', 'show date', 'get date format', 'A', 'La commande \"date +%d-%m-%Y\" affiche la date dans le format jour-mois-année.'),
(298, 9, 'Comment arrêter l\'exécution d\'un script?', 'exit', 'stop', 'end', 'quit', 'A', 'La commande \"exit\" permet d\'arrêter l\'exécution d\'un script shell.'),
(299, 10, 'Quel est le principe de base du chiffrement symétrique?', 'Utiliser la même clé pour le chiffrement et le déchiffrement', 'Utiliser des clés différentes pour le chiffrement et le déchiffrement', 'Utiliser des clés asymétriques', 'Utiliser une fonction de hachage', 'A', 'Le chiffrement symétrique utilise la même clé pour crypter et décrypter les données.'),
(300, 10, 'Quel algorithme est un exemple de chiffrement symétrique?', 'AES', 'RSA', 'ECC', 'DSA', 'A', 'AES est un algorithme de chiffrement symétrique largement utilisé pour sécuriser les données.'),
(301, 10, 'Qu\'est-ce que le chiffrement de César?', 'Un algorithme de chiffrement par substitution', 'Un algorithme de chiffrement par permutation', 'Un algorithme de chiffrement asymétrique', 'Un algorithme de hachage', 'A', 'Le chiffrement de César est une méthode de chiffrement par substitution, où chaque lettre est remplacée par une lettre située un certain nombre de positions plus loin dans l\'alphabet.'),
(302, 10, 'Quel est l\'avantage du chiffrement symétrique?', 'Il est rapide', 'Il est plus sûr que le chiffrement asymétrique', 'Il utilise des clés longues', 'Il permet de sécuriser les communications publiques', 'A', 'Le chiffrement symétrique est rapide, mais il présente un défi pour la gestion des clés.'),
(303, 10, 'Quel est un inconvénient du chiffrement symétrique?', 'La gestion des clés', 'La lenteur des algorithmes', 'L\'absence de clés secrètes', 'La complexité des algorithmes', 'A', 'L\'un des principaux inconvénients du chiffrement symétrique est la gestion des clés, car la même clé doit être partagée en toute sécurité entre l\'émetteur et le récepteur.'),
(304, 10, 'Quel algorithme est couramment utilisé pour le chiffrement des fichiers?', 'AES', 'RSA', 'ECC', 'SHA-256', 'A', 'AES est largement utilisé pour le chiffrement des fichiers grâce à sa rapidité et sa sécurité.'),
(305, 10, 'Quel type de clé est utilisé dans le chiffrement asymétrique?', 'Deux clés différentes', 'Une seule clé', 'Une clé de session', 'Une clé publique uniquement', 'A', 'Le chiffrement asymétrique utilise une paire de clés: une clé publique pour chiffrer et une clé privée pour déchiffrer.'),
(306, 10, 'Dans le chiffrement symétrique, que se passe-t-il si la clé est compromise?', 'Le chiffrement devient vulnérable', 'Le message reste sécurisé', 'Le message est déchiffré automatiquement', 'Aucune conséquence', 'A', 'Si la clé de chiffrement symétrique est compromise, les données chiffrées peuvent être déchiffrées par un attaquant.'),
(307, 10, 'Quel est l\'objectif principal du chiffrement?', 'Protéger la confidentialité des données', 'Optimiser la vitesse des communications', 'Faciliter la gestion des clés', 'Permettre une communication non sécurisée', 'A', 'Le chiffrement vise principalement à protéger la confidentialité des données en les rendant illisibles sans la clé de déchiffrement.'),
(308, 10, 'Quelle méthode est utilisée pour générer une clé dans un chiffrement symétrique?', 'Générateur de nombres pseudo-aléatoires', 'Fonction de hachage', 'Certificat numérique', 'Clé publique de RSA', 'A', 'Les clés utilisées dans le chiffrement symétrique sont souvent générées à l\'aide de générateurs de nombres pseudo-aléatoires.'),
(309, 10, 'Quel algorithme de chiffrement est utilisé dans le chiffrement de disque complet?', 'AES', 'RSA', 'ECC', 'DSA', 'A', 'AES est couramment utilisé pour le chiffrement de disque complet en raison de sa sécurité et de son efficacité.'),
(310, 10, 'Quel est l\'inconvénient de l\'algorithme DES?', 'La taille de la clé est trop petite', 'Il est trop complexe', 'Il nécessite des clés asymétriques', 'Il n\'est pas compatible avec les données modernes', 'A', 'L\'algorithme DES utilise une clé de 56 bits, qui est aujourd\'hui considérée comme insuffisante pour garantir une sécurité suffisante.'),
(311, 10, 'Le chiffrement des données en transit sur Internet est généralement assuré par?', 'TLS/SSL', 'HTTP', 'FTP', 'SMTP', 'A', 'Le protocole TLS/SSL est utilisé pour chiffrer les données en transit sur Internet, garantissant leur confidentialité et leur intégrité.'),
(312, 10, 'Comment appelle-t-on une clé secrète partagée dans un chiffrement symétrique?', 'Clé de session', 'Clé publique', 'Clé privée', 'Clé d\'authentification', 'A', 'La clé secrète partagée dans un chiffrement symétrique est appelée clé de session.'),
(313, 10, 'Pourquoi le chiffrement de flux est-il plus adapté aux applications en temps réel?', 'Il chiffre les données à la volée', 'Il est plus sécurisé', 'Il fonctionne uniquement avec des clés longues', 'Il est plus facile à implémenter', 'A', 'Le chiffrement de flux chiffre les données à la volée, ce qui le rend particulièrement adapté aux applications en temps réel, comme la voix sur IP.'),
(314, 10, 'Quel est le mode de fonctionnement le plus sûr pour chiffrer de grandes quantités de données?', 'CBC', 'ECB', 'OFB', 'CTR', 'A', 'Le mode CBC (Cipher Block Chaining) est souvent utilisé pour sécuriser de grandes quantités de données, car il ajoute de l\'aléa avec un vecteur d\'initialisation (IV).'),
(315, 10, 'Le chiffrement asymétrique est également appelé?', 'Chiffrement à clé publique', 'Chiffrement par substitution', 'Chiffrement de flux', 'Chiffrement de bloc', 'A', 'Le chiffrement asymétrique est aussi appelé chiffrement à clé publique, car il utilise une clé publique pour chiffrer et une clé privée pour déchiffrer.'),
(316, 10, 'Le chiffrement RSA est un exemple de?', 'Chiffrement asymétrique', 'Chiffrement symétrique', 'Chiffrement de flux', 'Chiffrement de bloc', 'A', 'Le chiffrement RSA est un algorithme asymétrique, utilisant une paire de clés publique/privée pour sécuriser les données.'),
(317, 10, 'Dans un chiffrement symétrique, qui connaît la clé de chiffrement?', 'L\'émetteur et le récepteur', 'L\'émetteur uniquement', 'Le récepteur uniquement', 'L\'autorité de certification', 'A', 'Dans un chiffrement symétrique, la clé de chiffrement est partagée entre l\'émetteur et le récepteur.'),
(318, 10, 'Quel est un autre nom pour le chiffrement par substitution?', 'Chiffrement de César', 'Chiffrement AES', 'Chiffrement RSA', 'Chiffrement 3DES', 'A', 'Le chiffrement de César est un exemple classique de chiffrement par substitution.'),
(319, 10, 'Quelle est la méthode de chiffrement qui consiste à appliquer une permutation des données?', 'Chiffrement par permutation', 'Chiffrement par substitution', 'Chiffrement par bloc', 'Chiffrement de flux', 'A', 'Le chiffrement par permutation consiste à réorganiser les données pour en masquer la structure originale.'),
(320, 11, 'Quel algorithme de chiffrement est considéré comme le plus sécurisé parmi les algorithmes symétriques?', 'AES', 'DES', '3DES', 'RC4', 'A', 'AES est considéré comme l\'algorithme de chiffrement symétrique le plus sécurisé en raison de sa clé longue et de son efficacité.'),
(321, 11, 'Quel est le rôle du mode de fonctionnement dans un algorithme de chiffrement symétrique?', 'Déterminer comment les blocs de texte clair sont combinés avec la clé', 'Optimiser la gestion des clés', 'Augmenter la longueur de la clé', 'Effectuer des calculs de hachage', 'A', 'Le mode de fonctionnement définit la manière dont le texte clair est combiné avec la clé de chiffrement pour protéger les données.'),
(322, 11, 'Quel mode de chiffrement est souvent utilisé pour protéger des données en streaming?', 'CTR (Counter)', 'ECB (Electronic Codebook)', 'CBC (Cipher Block Chaining)', 'OFB (Output Feedback)', 'A', 'Le mode CTR (Counter) est souvent utilisé pour protéger des données en streaming, car il permet de chiffrer indépendamment chaque bloc.'),
(323, 11, 'Quel est l\'inconvénient du mode ECB?', 'Il ne masque pas bien les motifs répétitifs dans les données', 'Il est trop lent', 'Il nécessite des clés longues', 'Il est trop sécurisé', 'A', 'Le mode ECB (Electronic Codebook) ne masque pas bien les motifs répétitifs dans les données, ce qui peut permettre à un attaquant de déduire des informations sur le texte clair.'),
(324, 11, 'Le chiffrement AES utilise quelle taille de clé?', '128, 192 ou 256 bits', '128 bits uniquement', '64 bits', '512 bits', 'A', 'AES utilise des tailles de clé de 128, 192 ou 256 bits pour offrir un bon équilibre entre sécurité et performance.'),
(325, 11, 'Le chiffrement 3DES est un algorithme basé sur...', 'Le chiffrement DES répété trois fois', 'Le chiffrement RSA répété trois fois', 'Le chiffrement AES répété trois fois', 'Le chiffrement par substitution', 'A', 'Le chiffrement 3DES applique l\'algorithme DES trois fois pour renforcer la sécurité par rapport au DES simple.'),
(326, 11, 'Le chiffrement symétrique nécessite...', 'Un échange sécurisé de clés', 'Deux clés privées', 'Une clé publique', 'Un certificat numérique', 'A', 'Le chiffrement symétrique nécessite un échange sécurisé de la clé entre les parties avant que la communication ne puisse commencer.'),
(327, 11, 'Quel est l\'inconvénient principal du chiffrement symétrique?', 'La gestion des clés', 'La lenteur', 'Le manque de confidentialité', 'La faible sécurité', 'A', 'L\'inconvénient principal du chiffrement symétrique est la gestion des clés, qui doit être effectuée de manière sécurisée.'),
(328, 11, 'Quel est le principal objectif du mode de chiffrement CBC?', 'Masquer les motifs répétitifs dans les données', 'Accélérer le processus de chiffrement', 'Faciliter la gestion des clés', 'Réduire la taille du message', 'A', 'Le mode CBC (Cipher Block Chaining) permet de masquer les motifs répétitifs dans les données en ajoutant un vecteur d\'initialisation (IV) à chaque bloc.'),
(329, 11, 'Dans quel cas le chiffrement 3DES est-il recommandé?', 'Lorsque la rétrocompatibilité avec DES est nécessaire', 'Lorsque des clés plus longues sont nécessaires', 'Lorsque des performances maximales sont nécessaires', 'Lorsque l\'algorithme AES ne peut pas être utilisé', 'A', 'Le chiffrement 3DES est recommandé lorsque la rétrocompatibilité avec DES est nécessaire, bien qu\'il soit moins sécurisé que AES.'),
(330, 11, 'Quel algorithme a été largement utilisé avant le passage à AES?', 'DES', 'RSA', 'SHA-256', 'ECC', 'A', 'Le DES a été largement utilisé avant que le AES ne devienne la norme de facto pour le chiffrement symétrique.'),
(331, 11, 'Quel mode de chiffrement assure une meilleure sécurité pour de grandes quantités de données?', 'CBC', 'ECB', 'OFB', 'CTR', 'A', 'Le mode CBC (Cipher Block Chaining) est recommandé pour de grandes quantités de données car il est plus sécurisé que d\'autres modes comme ECB.'),
(332, 11, 'Quel algorithme est un exemple d\'algorithme de chiffrement de flux?', 'RC4', 'AES', '3DES', 'RSA', 'A', 'RC4 est un exemple d\'algorithme de chiffrement de flux qui chiffre les données bit par bit, idéal pour des applications en temps réel.'),
(333, 11, 'Le chiffrement AES peut-il être utilisé pour sécuriser les communications sans fil?', 'Oui, il est largement utilisé pour sécuriser les communications sans fil', 'Non, il est trop lent pour cela', 'Non, il ne peut pas être utilisé dans des réseaux sans fil', 'Oui, mais uniquement pour les communications avec des clés publiques', 'A', 'AES est couramment utilisé pour sécuriser les communications sans fil grâce à sa vitesse et sa sécurité.'),
(334, 11, 'Lequel des modes de chiffrement suivants utilise un vecteur d\'initialisation (IV) pour améliorer la sécurité?', 'CBC', 'ECB', 'OFB', 'CTR', 'A', 'Le mode CBC (Cipher Block Chaining) utilise un vecteur d\'initialisation (IV) pour ajouter de l\'aléa et renforcer la sécurité du chiffrement.'),
(335, 11, 'Quel algorithme de chiffrement symétrique est connu pour sa rapidité?', 'RC4', 'AES', '3DES', 'RSA', 'A', 'RC4 est connu pour sa rapidité en tant qu\'algorithme de chiffrement symétrique, bien qu\'il ne soit plus recommandé en raison de failles de sécurité.'),
(336, 11, 'Le chiffrement de flux est généralement préféré lorsque...', 'Les données doivent être chiffrées en continu', 'Les clés sont courtes', 'Les clés sont longues', 'Les données sont en petits blocs', 'A', 'Le chiffrement de flux est préféré pour les données qui doivent être chiffrées en continu, comme dans les communications en temps réel.'),
(337, 11, 'Que permet de réaliser un algorithme de chiffrement symétrique?', 'Confidentialité des données', 'Authentification des utilisateurs', 'Validation des certificats', 'Signature des messages', 'A', 'Un algorithme de chiffrement symétrique permet de garantir la confidentialité des données en les rendant illisibles sans la clé appropriée.');
INSERT INTO `questions` (`id`, `quiz_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `reponse_correcte`, `explication`) VALUES
(338, 11, 'Que signifie \"block cipher\" (chiffrement par bloc)?', 'Un algorithme qui chiffre les données par blocs', 'Un algorithme qui chiffre bit par bit', 'Un algorithme qui chiffre uniquement des textes courts', 'Un algorithme qui n\'utilise pas de clés secrètes', 'A', 'Le chiffrement par bloc chiffre les données en blocs de taille fixe, généralement 128 bits.'),
(339, 11, 'Quel est le but principal du chiffrement asymétrique?', 'Échanger des clés secrètes en toute sécurité', 'Chiffrer des données à haute vitesse', 'Optimiser la gestion des clés symétriques', 'Authentifier les utilisateurs', 'A', 'Le chiffrement asymétrique est principalement utilisé pour échanger des clés secrètes en toute sécurité.'),
(340, 11, 'Les algorithmes de chiffrement symétriques utilisent généralement quelle structure?', 'La clé partagée', 'Deux clés publiques', 'Deux clés privées', 'Des fonctions de hachage', 'A', 'Les algorithmes de chiffrement symétriques utilisent généralement une clé partagée pour chiffrer et déchiffrer les données.'),
(341, 12, 'Qu\'est-ce que PKI?', 'Infrastructure à clé publique', 'Protocole de communication', 'Base de données sécurisée', 'Système de stockage de clés privées', 'A', 'PKI est un système qui gère l\'utilisation des clés publiques et privées pour assurer la sécurité des communications électroniques.'),
(342, 12, 'Quelle est la fonction d\'un certificat numérique?', 'Lier une clé publique à une entité', 'Créer une clé privée', 'Générer une clé de session', 'Chiffrer des données', 'A', 'Un certificat numérique lie une clé publique à une entité, comme une organisation ou un utilisateur, pour garantir l\'authenticité.'),
(343, 12, 'Qu\'est-ce qu\'une autorité de certification (CA)?', 'Un organisme qui émet des certificats numériques', 'Un utilisateur qui signe des messages', 'Un algorithme de chiffrement', 'Un protocole de communication sécurisé', 'A', 'Une autorité de certification (CA) émet des certificats numériques pour vérifier l\'identité des utilisateurs et des organisations.'),
(344, 12, 'Quel est le rôle d\'une clé privée dans une infrastructure PKI?', 'Elle est utilisée pour déchiffrer les messages', 'Elle est utilisée pour chiffrer les messages', 'Elle est partagée entre plusieurs utilisateurs', 'Elle est utilisée pour générer des certificats numériques', 'A', 'La clé privée est utilisée pour déchiffrer les messages ou pour signer numériquement des documents.'),
(345, 12, 'Comment appelle-t-on le processus de vérification de la signature d\'un certificat numérique?', 'Validation de la chaîne de certification', 'Vérification par hachage', 'Signature inverse', 'Chiffrement de certificat', 'A', 'La validation de la chaîne de certification permet de vérifier que le certificat numérique a été émis par une autorité de certification de confiance.'),
(346, 12, 'Quelle est la principale différence entre un certificat SSL et un certificat TLS?', 'Il n\'y a pas de différence, ce sont les mêmes', 'TLS est plus sécurisé que SSL', 'SSL est plus sécurisé que TLS', 'TLS est un certificat pour le chiffrement de fichier', 'A', 'TLS (Transport Layer Security) est une version plus sécurisée du protocole SSL.'),
(347, 12, 'Qu\'est-ce que la gestion des clés dans une PKI?', 'Le processus de stockage, distribution et révocation des clés', 'La création de certificats numériques', 'Le chiffrement des données', 'La génération de clés de session', 'A', 'La gestion des clés dans une PKI implique le stockage, la distribution et la révocation des clés publiques et privées.'),
(348, 12, 'Qu\'est-ce qu\'une chaîne de certification?', 'Une hiérarchie de certificats', 'Une clé privée partagée', 'Un certificat de signature', 'Un algorithme de hachage', 'A', 'Une chaîne de certification est une hiérarchie de certificats qui permet de vérifier l\'authenticité d\'un certificat numérique.'),
(349, 12, 'Le certificat numérique contient généralement...', 'La clé publique et des informations sur l\'entité', 'La clé privée et la clé publique', 'Les informations personnelles d\'un utilisateur', 'Des clés de session', 'A', 'Le certificat numérique contient la clé publique et des informations sur l\'entité à laquelle il est associé, comme le nom et l\'organisation.'),
(350, 12, 'Qu\'est-ce qu\'une attaque par interception dans le cadre d\'une PKI?', 'L\'interception des certificats numériques', 'L\'attaque d\'un certificat privé', 'La falsification d\'un certificat', 'Le piratage de l\'autorité de certification', 'A', 'Une attaque par interception consiste à intercepter des certificats numériques ou des clés publiques pour usurper l\'identité de l\'entité cible.'),
(351, 12, 'Qu\'est-ce qu\'un certificat auto-signé?', 'Un certificat qui est signé par l\'entité elle-même', 'Un certificat émis par une autorité de certification', 'Un certificat expiré', 'Un certificat de session', 'A', 'Un certificat auto-signé est signé par l\'entité elle-même, ce qui peut ne pas être aussi fiable qu\'un certificat émis par une autorité de certification.'),
(352, 12, 'Quel est le but principal d\'un protocole d\'authentification dans PKI?', 'Vérifier l\'identité de l\'entité', 'Créer des certificats numériques', 'Chiffrer les messages', 'Assurer la confidentialité des données', 'A', 'L\'objectif principal d\'un protocole d\'authentification est de vérifier l\'identité de l\'entité avant d\'autoriser l\'accès ou les transactions.'),
(353, 12, 'Quel est un exemple d\'utilisation des certificats numériques?', 'Échanger des informations sécurisées sur Internet', 'Générer des clés de chiffrement', 'Créer des utilisateurs sur un système', 'Transférer des clés privées', 'A', 'Les certificats numériques sont couramment utilisés pour échanger des informations sécurisées sur Internet, comme lors de l\'établissement d\'une connexion HTTPS.'),
(354, 12, 'Qu\'est-ce que la révocation d\'un certificat numérique?', 'Annuler la validité d\'un certificat', 'Signer un certificat', 'Créer un certificat de session', 'Renouveler un certificat', 'A', 'La révocation d\'un certificat numérique signifie annuler sa validité, généralement en cas de compromission de la clé privée associée.'),
(355, 12, 'Qu\'est-ce qu\'un certificat de signature de code?', 'Un certificat utilisé pour signer numériquement des logiciels', 'Un certificat utilisé pour générer des clés privées', 'Un certificat utilisé pour signer des documents électroniques', 'Un certificat utilisé pour envoyer des messages chiffrés', 'A', 'Un certificat de signature de code est utilisé pour signer numériquement des logiciels et garantir qu\'ils n\'ont pas été modifiés après leur publication.'),
(356, 12, 'Qu\'est-ce qu\'un certificat X.509?', 'Un format standard pour les certificats numériques', 'Un certificat qui vérifie les données par hachage', 'Un certificat pour les sessions HTTPS', 'Un certificat temporaire', 'A', 'X.509 est un format standard pour les certificats numériques, largement utilisé dans les infrastructures PKI pour garantir la sécurité des échanges.'),
(357, 12, 'Un certificat numérique permet...', 'D\'authentifier une entité et de garantir la confidentialité', 'De créer des clés de chiffrement', 'De modifier des données', 'De connecter deux entités sans sécurité', 'A', 'Un certificat numérique permet d\'authentifier une entité et de garantir la confidentialité des échanges en assurant la validité de la clé publique.'),
(358, 12, 'Pourquoi un certificat de signature est-il nécessaire pour signer des documents?', 'Pour prouver l\'identité du signataire', 'Pour crypter les documents', 'Pour générer des clés privées', 'Pour sécuriser les clés publiques', 'A', 'Un certificat de signature est nécessaire pour prouver l\'identité du signataire et garantir que le document n\'a pas été modifié après la signature.'),
(359, 13, 'Comment démarre un script PHP ?', '<?php', '<script>', '<?=', '<php>', 'A', 'Un script PHP commence généralement par <?php pour indiquer le début du code PHP.'),
(360, 13, 'Quelle est la bonne syntaxe pour afficher \"Bonjour\" ?', 'echo Bonjour;', 'print(\"Bonjour\");', 'echo \"Bonjour\";', 'printf Bonjour;', 'C', 'La syntaxe correcte est echo \"Bonjour\";'),
(361, 13, 'Comment déclare-t-on une variable en PHP ?', 'int $x = 5;', '$x = 5;', 'let x = 5;', 'x := 5;', 'B', 'En PHP, une variable commence par un signe dollar ($).'),
(362, 13, 'Quel est l\'opérateur de concaténation en PHP ?', '+', '.', '&&', '&', 'B', 'L\'opérateur \".\" est utilisé pour concaténer deux chaînes en PHP.'),
(363, 13, 'Quel type de commentaire est valide ?', '// Ceci est un commentaire', '<!-- Commentaire -->', '# Commentaire', '/* Commentaire */', 'D', 'PHP accepte les commentaires de style C (/* */), // et #.'),
(364, 13, 'Quelle fonction sert à vérifier le type d\'une variable ?', 'checktype()', 'type_of()', 'gettype()', 'typeof()', 'C', 'gettype() retourne le type de la variable.'),
(365, 13, 'Quelle est la sortie de: echo 5 + \"5\";', '10', '55', 'Erreur', '\"55\"', 'A', 'PHP convertit \"5\" en entier pour effectuer l\'addition.'),
(366, 13, 'Quelle est la bonne extension pour un fichier PHP ?', '.php', '.html', '.js', '.txt', 'A', 'Les fichiers PHP doivent avoir l\'extension .php pour être interprétés correctement.'),
(367, 13, 'Comment écrire une condition en PHP ?', 'if $x == 1 then', 'if ($x == 1) {}', 'if x = 1 then', 'if $x = 1:', 'B', 'La syntaxe correcte est if ($x == 1) avec des accolades.'),
(368, 13, 'Quelle est la fonction utilisée pour afficher des informations sur une variable ?', 'echo()', 'debug()', 'print()', 'var_dump()', 'D', 'var_dump() fournit le type et la valeur de la variable.'),
(369, 13, 'Quel est le rôle de la fonction isset() ?', 'Créer une variable', 'Vérifie si une variable est définie', 'Supprime une variable', 'Affiche une variable', 'B', 'isset() vérifie si une variable existe et n\'est pas nulle.'),
(370, 13, 'Comment ajouter un commentaire sur une seule ligne ?', '// commentaire', '/* commentaire */', '<!-- commentaire -->', '/ commentaire', 'A', 'Le commentaire sur une ligne se fait avec // ou # en PHP.'),
(371, 13, 'Quelle instruction sert à inclure un fichier en PHP ?', 'require()', 'include()', 'import()', 'load()', 'B', 'include() est utilisée pour inclure le contenu d\'un fichier externe.'),
(372, 13, 'Quelle est la syntaxe correcte pour créer une fonction ?', 'function maFonction[]', 'function: maFonction()', 'function maFonction() {}', 'fonction maFonction()', 'C', 'La bonne syntaxe est function nom() { }'),
(373, 13, 'Quelle fonction retourne le nombre de caractères d\'une chaîne ?', 'count()', 'strlen()', 'size()', 'length()', 'B', 'strlen() retourne la longueur d\'une chaîne en PHP.'),
(374, 13, 'Comment déclarer un tableau vide ?', 'array[];', 'array = [];', '$tab = array();', 'table = new array();', 'C', 'La bonne manière est $tab = array();'),
(375, 13, 'Comment accéder au 1er élément d\'un tableau $arr ?', '$arr(0)', '$arr[1]', '$arr[0]', 'arr[0]', 'C', 'Les index de tableaux commencent à 0 en PHP.'),
(376, 13, 'Que signifie === en PHP ?', 'Comparaison de types uniquement', 'Comparaison stricte', 'Attribution', 'Concaténation', 'B', '=== compare valeur ET type.'),
(377, 13, 'Comment termine-t-on une instruction PHP ?', 'Point', 'Virgule', 'Point-virgule', 'Slash', 'C', 'Chaque ligne PHP se termine par un point-virgule.'),
(378, 13, 'Quelle fonction permet d\'interrompre l\'exécution d\'un script ?', 'exit()', 'break()', 'stop()', 'halt()', 'A', 'exit() arrête l\'exécution du script immédiatement.'),
(398, 14, 'Que signifie l’acronyme POO en PHP ?', 'Programmation Orientée Objet', 'Programmation Orientée Ordinateur', 'Programmation Orientée Opération', 'Programme Objet Orienté', 'A', 'POO signifie Programmation Orientée Objet.'),
(399, 14, 'Quel mot-clé sert à définir une nouvelle classe ?', 'define', 'object', 'class', 'module', 'C', 'Le mot-clé « class » est utilisé pour définir une classe en PHP.'),
(400, 14, 'Comment instancier un objet de la classe MaClasse ?', '$obj = new MaClasse();', '$obj = MaClasse->new();', 'new MaClasse $obj;', '$obj = MaClasse();', 'A', 'On utilise « new » suivi du nom de la classe pour instancier un objet.'),
(401, 14, 'Quel mot-clé rend une propriété strictement accessible dans sa classe uniquement ?', 'public', 'protected', 'private', 'static', 'C', 'private empêche tout accès hors de la classe elle-même.'),
(402, 14, 'Quelle méthode magique est appelée à la création d’un objet ?', '__construct()', '__init()', '__create()', '__start()', 'A', '__construct() est le constructeur magique en PHP.'),
(403, 14, 'Quel niveau de visibilité permet à la fois l’accès interne et à partir des sous-classes ?', 'private', 'public', 'static', 'protected', 'D', 'protected autorise l’accès dans la classe et ses enfants.'),
(404, 14, 'Quel mot-clé indique qu’une méthode appartient à la classe et non à l’instance ?', 'final', 'static', 'public', 'abstract', 'B', 'static définit une méthode accessible sans instancier la classe.'),
(405, 14, 'Quelle syntaxe permet à une classe Enfant d’hériter de Parent ?', 'class Enfant super Parent', 'class Enfant extends Parent', 'class Enfant inherits Parent', 'class Enfant < Parent', 'B', 'On hérite en utilisant « extends ».'),
(406, 14, 'Quel mot-clé interdit à une classe d’être étendue ?', 'sealed', 'final', 'private', 'abstract', 'B', 'final empêche toute extension de la classe.'),
(407, 14, 'Comment appelle-t-on l’opérateur qui vérifie si $obj est instance de MaClasse ?', '$obj instanceof MaClasse', '$obj is MaClasse', 'instanceof($obj, MaClasse)', 'isInstance($obj, MaClasse)', 'A', 'instanceof vérifie l’appartenance à une classe.'),
(408, 14, 'Quelle déclaration définit une interface en PHP ?', 'interface MonInterface {}', 'abstract interface {}', 'class MonInterface {}', 'trait MonInterface {}', 'A', 'On utilise le mot-clé « interface ».'),
(409, 14, 'Comment une classe implémente-t-elle une interface ?', 'class C implements I {}', 'class C extends I {}', 'class C uses I {}', 'class C interface I {}', 'A', 'implements lie la classe à l’interface.'),
(410, 14, 'Qu’est-ce qu’un trait ?', 'Une classe abstraite', 'Un modèle de classe', 'Un ensemble de méthodes réutilisables', 'Une interface spécialisée', 'C', 'Un trait permet de partager du code entre classes.'),
(411, 14, 'Quel mot-clé crée une méthode abstraite dans une classe abstraite ?', 'virtual', 'abstract', 'interface', 'define', 'B', 'abstract déclare une méthode sans corps.'),
(412, 14, 'Quelle méthode magique permet de gérer l’appel d’une méthode inexistante ?', '__call()', '__invoke()', '__get()', '__autoload()', 'A', '__call() intercepte les appels de méthodes non définies.'),
(413, 14, 'Que fait le mot-clé parent::methode() ?', 'Appelle une méthode statique', 'Appelle une méthode finale', 'Appelle la méthode de la classe parente', 'Appelle le constructeur parent', 'C', 'parent::methode() invoque la version héritée.'),
(414, 14, 'Qu’est-ce que le polymorphisme ?', 'Fusion de classes', 'Multiplication d’objets', 'Objets traités comme instances d’une même interface', 'Création de méthodes anonymes', 'C', 'Le polymorphisme permet de traiter différents objets via une même interface ou classe mère.'),
(415, 14, 'Pourquoi utiliser l’injection de dépendances ?', 'Réduire la vitesse d’exécution', 'Simplifier l’accès aux variables globales', 'Favoriser la testabilité et la réutilisation', 'Empêcher l’héritage', 'C', 'Elle simplifie la maintenance et les tests unitaires.'),
(416, 14, 'Que permet la méthode __destruct() ?', 'Initialiser des propriétés', 'Détruire la classe', 'Exécuter du code à la destruction de l’objet', 'Vider la mémoire', 'C', '__destruct() s’exécute juste avant la destruction de l’objet.'),
(417, 14, 'Quel pattern garantit qu’une classe n’a qu’une seule instance ?', 'Factory', 'Singleton', 'Observer', 'Builder', 'B', 'Singleton restreint la création de plusieurs instances.'),
(418, 15, 'Qu’est-ce qu’une injection SQL (SQLi) ?', 'Exécution de scripts côté client', 'Insertion de requêtes malveillantes dans une base de données', 'Vol de session utilisateur', 'Inclusion de fichiers', 'B', 'Les attaquants injectent des requêtes pour manipuler la base.'),
(419, 15, 'Pourquoi utiliser des requêtes préparées (prepared statements) ?', 'Pour améliorer le rendu HTML', 'Pour sécuriser contre les injections SQL', 'Pour compresser les données', 'Pour optimiser le CSS', 'B', 'Elles séparent la logique de la requête des données.'),
(420, 15, 'Qu’est-ce qu’une faille Cross-Site Scripting (XSS) ?', 'Injection de code dans une base de données', 'Vol d’identifiants de session', 'Injection de scripts dans le navigateur client', 'Modification de fichiers sur le serveur', 'C', 'XSS permet l’exécution de JS malveillant côté client.'),
(421, 15, 'Quelle fonction empêche l’exécution de balises HTML malveillantes ?', 'strip_tags()', 'htmlspecialchars()', 'htmlentities()', 'clean_html()', 'B', 'htmlspecialchars() échappe les caractères spéciaux HTML.'),
(422, 15, 'Quelle méthode permet de hacher un mot de passe en PHP ?', 'md5()', 'sha1()', 'password_hash()', 'crypt()', 'C', 'password_hash() utilise bcrypt (ou Argon2) par défaut.'),
(423, 15, 'Comment vérifier un mot de passe haché ?', 'password_verify()', 'hash_check()', 'verify_pass()', 'check_password()', 'A', 'password_verify() compare le mot de passe et son hash.'),
(424, 15, 'Que fait session_regenerate_id() ?', 'Régénère l’ID de session pour se prémunir du vol', 'Crée une nouvelle session', 'Définit une session persistante', 'Réinitialise les variables de session', 'A', 'Elle prévient le hijacking de session en changeant l’ID.'),
(425, 15, 'Pourquoi toujours valider les données utilisateur ?', 'Pour réduire la taille des requêtes', 'Pour éviter les injections et XSS', 'Pour améliorer l’UX', 'Pour augmenter la vitesse', 'B', 'La validation empêche de nombreuses failles courantes.'),
(426, 15, 'Quel en-tête HTTP renforce la sécurité du contenu chargé ?', 'X-Powered-By', 'Content-Type', 'X-Content-Type-Options: nosniff', 'Server', 'C', '« nosniff » interdit au navigateur de deviner le type MIME.'),
(427, 15, 'Qu’est-ce que le Cross-Site Request Forgery (CSRF) ?', 'Attaque qui vole les cookies', 'Attaque qui envoie des requêtes malveillantes au nom de l’utilisateur', 'Attaque qui injecte du code dans le serveur', 'Attaque qui modifie le DNS', 'B', 'CSRF exploite la confiance du site dans le navigateur authentifié.'),
(428, 15, 'Comment se prémunir du CSRF ?', 'En filtrant les entrées', 'En validant les cookies', 'En générant et vérifiant un token unique', 'En utilisant HTTPS uniquement', 'C', 'Les tokens CSRF lient une session à un formulaire.'),
(429, 15, 'Quel protocole chiffre les échanges entre client et serveur ?', 'FTP', 'SMTP', 'HTTPS', 'TCP', 'C', 'HTTPS utilise TLS/SSL pour chiffrer le trafic.'),
(430, 15, 'Pourquoi utiliser OPcache ?', 'Pour minifier le PHP', 'Pour mettre en cache les scripts compilés et gagner en performance', 'Pour charger les images plus vite', 'Pour sécuriser le code', 'B', 'OPcache stocke les OPCodes en mémoire et évite la recompilation.'),
(431, 15, 'Que fait la fonction filter_var() avec FILTER_SANITIZE_STRING ?', 'Hache la chaîne', 'Échappe les caractères dangereux', 'Supprime les balises HTML', 'Encode en Base64', 'C', 'Elle retire les balises HTML et script.'),
(432, 15, 'Quel en-tête HTTP empêche le clickjacking ?', 'X-Frame-Options: DENY', 'X-XSS-Protection', 'Strict-Transport-Security', 'Content-Security-Policy', 'A', 'X-Frame-Options empêche d’afficher la page dans un iframe.'),
(433, 15, 'Que fait htmlspecialchars_decode() ?', 'Décode les entités HTML en caractères normaux', 'Réencode les entités', 'Supprime les balises', 'Hache les données', 'A', 'Elle convertit &amp;lt; en « < », etc.'),
(434, 15, 'Comment limiter le nombre de requêtes par seconde ?', 'Avec set_time_limit()', 'Avec rate_limiting middleware', 'Avec max_execution_time', 'Avec session.gc_maxlifetime', 'B', 'Un middleware ou une couche proxy peut implémenter du rate-limiting.'),
(435, 15, 'Quel outil PHP permet de profiler et déboguer le code ?', 'Xdebug', 'phpUnit', 'Composer', 'Phar', 'A', 'Xdebug offre profiling et debugging intégrés.'),
(436, 15, 'Pourquoi toujours valider le type de variable ?', 'Pour accélérer l’exécution', 'Pour réduire la mémoire', 'Pour éviter les erreurs et les injections', 'Pour faciliter l’UX', 'C', 'Cela empêche l’utilisation de données malformées ou malveillantes.'),
(437, 15, 'Quelle directive php.ini active l’OPcache ?', 'opcache.enable=1', 'opcache.active=1', 'opcache.on=1', 'enable_opcache=1', 'A', 'Il faut définir opcache.enable à 1 pour activer OPcache.'),
(438, 15, 'Que met en cache OPcache ?', 'Les images', 'Le HTML généré', 'Les scripts PHP compilés en opcodes', 'Les sessions', 'C', 'OPcache stocke les OPCodes (bytecode) des scripts PHP en mémoire.'),
(439, 17, 'Quelle bibliothèque est principalement utilisée pour les tableaux multi-dimensionnels et le calcul scientifique ?', 'Pandas', 'NumPy', 'Matplotlib', 'Scikit-learn', 'B', 'NumPy fournit des tableaux N-dimensionnels et des fonctions mathématiques rapides.'),
(440, 17, 'Comment importe-t-on NumPy avec l’alias courant ?', 'import numpy', 'import numpy as np', 'from numpy import *', 'import np as numpy', 'B', 'La convention est import numpy as np.'),
(441, 17, 'Quel objet Pandas représente une série unidimensionnelle étiquetée ?', 'DataFrame', 'Series', 'Panel', 'Index', 'B', 'Series est une structure unidimensionnelle avec étiquettes.'),
(442, 17, 'Quelle fonction NumPy crée un tableau à partir d’une liste Python ?', 'np.list()', 'np.array()', 'numpy.table()', 'array()', 'B', 'np.array() convertit une liste en ndarray.'),
(443, 17, 'Quelle méthode Pandas affiche les 5 premières lignes d’un DataFrame ?', 'df.top()', 'df.head()', 'df.sample()', 'df.first()', 'B', 'head() affiche les premières lignes.'),
(444, 17, 'Quel module trace des graphiques en 2D principalement ?', 'NumPy', 'SciPy', 'Matplotlib', 'Pillow', 'C', 'Matplotlib est la bibliothèque de tracé standard en 2D.'),
(445, 17, 'Quelle fonction SciPy calcule la transformée de Fourier ?', 'scipy.fft.fft()', 'numpy.fft()', 'scipy.signal.fft()', 'fft()', 'A', 'scipy.fft.fft() calcule la FFT.'),
(446, 17, 'Comment lit-on un fichier CSV en Pandas ?', 'pd.load_csv()', 'pd.read_csv()', 'pandas.csv()', 'read.csv()', 'B', 'pd.read_csv() est la fonction dédiée.'),
(447, 17, 'Quel objet NumPy fournit des fonctions statistiques comme mean, std, etc. ?', 'np.stats', 'np.stat', 'np.random', 'np.ndarray', 'D', 'ndarray possède des méthodes pour les calculs statistiques.'),
(448, 17, 'Quelle fonction NumPy génère des nombres aléatoires uniformes ?', 'np.random.normal()', 'np.random.randint()', 'np.random.rand()', 'np.random.random_sample()', 'C', 'np.random.rand() génère un array de floats uniformes.'),
(449, 17, 'Quel sous-module SciPy gère l’optimisation numérique ?', 'scipy.optimize', 'scipy.integrate', 'scipy.stats', 'scipy.linalg', 'A', 'scipy.optimize contient les routines d’optimisation.'),
(450, 17, 'Quel objet Pandas fusionne deux DataFrames comme en SQL ?', 'df.join()', 'pd.concat()', 'pd.merge()', 'df.union()', 'C', 'pd.merge() réalise des jointures SQL-like.'),
(451, 17, 'Quelle fonction Matplotlib crée une figure vide ?', 'plt.new()', 'matplotlib.figure()', 'plt.figure()', 'plot.figure()', 'C', 'plt.figure() crée une nouvelle figure.'),
(452, 17, 'Quel package complète NumPy pour l’algèbre linéaire avancée ?', 'numpy.linalg', 'scipy.linalg', 'pandas.linalg', 'matplotlib.linalg', 'B', 'scipy.linalg propose des routines avancées d’algèbre linéaire.'),
(453, 17, 'Quelle fonction Pandas trie un DataFrame par valeur ?', 'df.order()', 'df.sort()', 'df.sort_values()', 'df.sort_index()', 'C', 'sort_values() trie par colonnes ou par lignes.'),
(454, 17, 'Comment calcule-t-on la moyenne d’un array NumPy ?', 'np.average()', 'np.avg()', 'np.mean()', 'np.mid()', 'C', 'np.mean() calcule la moyenne arithmétique.'),
(455, 17, 'Quel module propose des distributions statistiques ?', 'scipy.stats', 'numpy.stats', 'pandas.stats', 'matplotlib.stats', 'A', 'scipy.stats fournit de nombreuses lois de probabilité.'),
(456, 17, 'Comment convertir un DataFrame Pandas en array NumPy ?', 'df.to_array()', 'df.values', 'np.array(df)', 'df.ndarray()', 'B', 'df.values renvoie un ndarray sous-jacente.'),
(457, 17, 'Quelle fonction SciPy résout une intégrale ?', 'scipy.integrate.quad()', 'scipy.integrate.solve()', 'quad()', 'integrate()', 'A', 'scipy.integrate.quad() calcule des intégrales définies.'),
(458, 17, 'Quel objet Seaborn permet de tracer des heatmaps ?', 'sns.map()', 'sns.heatmap()', 'sns.imshow()', 'sns.matrix()', 'B', 'sns.heatmap() trace les cartes de chaleur.'),
(459, 18, 'Qu’est-ce qu’un décorateur en Python ?', 'Une classe magique', 'Une fonction qui prend une fonction et en retourne une autre', 'Une boucle imbriquée', 'Un type de module', 'B', 'Les décorateurs enveloppent une fonction pour en modifier le comportement.'),
(460, 18, 'Comment applique-t-on un décorateur @mon_decorateur ?', '@mon_decorateur def f():', 'def @mon_decorateur f():', 'decorate f with mon_decorateur', 'mon_decorateur -> f', 'A', 'Le préfixe @ nomme le décorateur sur la ligne précédente.'),
(461, 18, 'Quel module fournit l’utilitaire wraps pour préserver les métadonnées ?', 'functools', 'itertools', 'collections', 'decorators', 'A', 'functools.wraps copie __name__ et __doc__.'),
(462, 18, 'Que fait @staticmethod ?', 'Rend une méthode callable au niveau de l’instance', 'Rend une méthode indépendante de self et cls', 'Rend une méthode abstraite', 'Définit une propriété', 'B', 'staticmethod ne reçoit ni self ni cls.'),
(463, 18, 'Quelle différence entre @classmethod et @staticmethod ?', '@classmethod reçoit cls en premier, @staticmethod ne reçoit rien', '@staticmethod reçoit self, @classmethod ne reçoit rien', 'Les deux sont identiques', 'classmethod définit une propriété', 'A', 'classmethod reçoit la classe en premier argument.'),
(464, 18, 'Qu’est-ce qu’une métaclasse ?', 'Une fonction décoratrice', 'Une classe dont les instances sont des classes', 'Un type de décorateur', 'Un module spécial', 'B', 'Les métaclasses fabriquent des classes elles-mêmes.'),
(465, 18, 'Quelle est la métaclasse par défaut de toute classe Python ?', 'Meta', 'type', 'object', 'ClassMeta', 'B', 'type est la métaclasse native de Python.'),
(466, 18, 'Comment spécifier une métaclasse pour une classe ?', 'class C(metaclass=Meta):', 'class C: metaclass=Meta', 'metaclass C = Meta', 'class C extends Meta:', 'A', 'La syntaxe doit utiliser l’argument metaclass.'),
(467, 18, 'Que fait la méthode __call__ d’une métaclasse ?', 'Permet d’appeler une instance comme fonction', 'Définit un décorateur', 'Crée une nouvelle classe', 'Rend la classe immuable', 'A', '__call__ permet d’instancier la classe en appelant la classe comme une fonction.'),
(468, 18, 'Quel décorateur standard facilite le caching ?', '@lru_cache', '@cache', '@memoize', '@fastcache', 'A', 'functools.lru_cache stocke les résultats récents.'),
(469, 18, 'Comment créer un décorateur avec arguments ?', 'def deco(arg): return decorator', 'def deco(f, arg):', 'def deco(arg): def wrapper(f): ... return wrapper', 'def deco(arg): f = wrapper', 'C', 'Un décorateur à arguments retourne une fonction génératrice de décorateur.'),
(470, 18, 'Quel est le but de functools.wraps ?', 'Minifier la fonction décorée', 'Preserver le nom, doc et signature originaux', 'Afficher un log', 'Changer le nom de la fonction', 'B', 'wraps met à jour les attributs __name__ et __doc__.'),
(471, 18, 'Quel attribut inspecter pour connaître la métaclasse ?', '.__class__', '.__metaclass__', '.__mro__', '.__bases__', 'A', '.__class__ de la classe renvoie sa métaclasse.'),
(472, 18, 'Quelle méthode magique définit la création d’une classe ?', '__new__', '__init__', '__create__', '__class__', 'A', '__new__ de la métaclasse fabrique la classe.'),
(473, 18, 'Que fait @property ?', 'Crée une méthode privée', 'Permet d’accéder à une méthode sans parenthèses', 'Déclare une méthode statique', 'Crée un nouveau décorateur', 'B', '@property transforme une méthode en attribut en lecture.'),
(474, 18, 'Pourquoi utiliser une métaclasse ?', 'Pour créer des variables globales', 'Pour contrôler la création et la modification des classes', 'Pour accélérer les boucles', 'Pour définir des tâches cron', 'B', 'Elles offrent un point d’extension lors de la déclaration des classes.'),
(475, 18, 'Quel décorateur standard convertit une méthode en propriété en écriture seule ?', '@property', '@setter', '@deleter', '@readonly', 'B', '@property.setter définit le setter d’une propriété existante.'),
(476, 18, 'Comment définir une méthode abstraite dans une classe ?', '@abstractmethod def f():', '@method abstract f():', 'def abstractmethod f():', '@abstract def f():', 'A', 'abstractmethod du module abc marque une méthode comme abstraite.'),
(477, 18, 'Quel module fournit ABC et abstractmethod ?', 'abc', 'abstract', 'decorators', 'inspect', 'A', 'Le module abc gère les classes abstraites et méthodes.'),
(478, 18, 'Que renvoie type(name, bases, dict)?', 'Une instance de classe', 'Une nouvelle classe dynamique', 'Une métaclasse', 'Un module', 'B', 'type() peut créer dynamiquement une nouvelle classe.'),
(479, 18, 'Quel décorateur transforme une méthode en attribut calculé en écriture seule ?', '@property', '@readonly', '@writing', '@calc', 'A', '@property crée un attribut en lecture seule.'),
(480, 18, 'Que fait functools.lru_cache(maxsize=None)?', 'Désactive le cache', 'Cache indéfiniment les résultats', 'Limite la taille du cache à None', 'Crée un cache explicite', 'B', 'maxsize=None signifie cache sans limite de taille.'),
(481, 16, 'Quel type de données Python utilise-t-on pour une chaîne de caractères ?', 'int', 'str', 'float', 'bool', 'B', 'str est le type pour les chaînes de caractères.'),
(482, 16, 'Quel type représente un nombre entier ?', 'int', 'float', 'complex', 'str', 'A', 'int est le type pour les entiers.'),
(483, 16, 'Quel type est utilisé pour un nombre à virgule ?', 'bool', 'str', 'float', 'list', 'C', 'float est le type pour les nombres réels.'),
(484, 16, 'Quel type représente Vrai/Faux ?', 'int', 'str', 'NoneType', 'bool', 'D', 'bool est le type booléen.'),
(485, 16, 'Quel est le type de None ?', 'NoneType', 'null', 'void', 'empty', 'A', 'NoneType est le type de None en Python.'),
(486, 16, 'Comment crée-t-on une liste ?', '[1, 2, 3]', '{1,2,3}', '(1,2,3)', '<1,2,3>', 'A', 'Les listes utilisent les crochets.'),
(487, 16, 'Quel type est un tuple ?', '[1, 2]', '(1, 2)', '{1, 2}', 'tuple()', 'B', 'Les tuples sont définis entre parenthèses.'),
(488, 16, 'Quel type est un ensemble (set) ?', '{1,2,3}', '[1,2,3]', '(1,2,3)', '<1,2,3>', 'A', 'Les sets utilisent les accolades sans paires clé:valeur.'),
(489, 16, 'Quel type est un dictionnaire ?', '{\"a\":1}', '[\"a\",1]', '(\"a\",1)', '<\"a\",1>', 'A', 'Les dicts sont des paires clé:valeur entre accolades.'),
(490, 16, 'Comment obtient-on le type d’une variable x ?', 'type(x)', 'typeof(x)', 'x.type()', 'gettype(x)', 'A', 'type(x) renvoie le type de x.'),
(491, 16, 'Quel est le résultat de 3/2 ?', '1', '1.5', '2', 'Erreur', 'B', '3/2 renvoie un float 1.5 en Python 3.'),
(492, 16, 'Quel opérateur crée une nouvelle liste sans modifier l’origine ?', '+=', '*=', '+', '*', 'C', '+ crée une nouvelle liste.'),
(493, 16, 'Que renvoie \'a\' * 3 ?', 'aaa', 'a3', 'Error', '[\"a\",\"a\",\"a\"]', 'A', 'La répétition de chaîne produit \"aaa\".'),
(494, 16, 'Comment déclare-t-on un littéral hexadécimal ?', '0x1A', '1Ah', 'hex(1A)', '0h1A', 'A', '0x prefixe un littéral hexadécimal.'),
(495, 16, 'Quel type Python utilise-t-il pour les nombres complexes ?', 'complex', 'complexe', 'comp', 'cx', 'A', 'complex est le type intégré.'),
(496, 16, 'Quelle méthode convertit une chaîne en entier ?', 'int()', 'str()', 'float()', 'bool()', 'A', 'int(\"123\") renvoie 123.'),
(497, 16, 'Quelle fonction retourne la longueur d’une séquence ?', 'len()', 'size()', 'count()', 'length()', 'A', 'len() donne la longueur d’une séquence.'),
(498, 16, 'Quel symbole démarre un commentaire ?', '#', '//', '/*', '<!--', 'A', 'Le symbole # démarre un commentaire.'),
(499, 16, 'Quel est le type de True + 1 ?', 'int', 'float', 'bool', 'str', 'A', 'bool est sous-classe d’int, donc True + 1 = 2 (int).'),
(500, 16, 'Que renvoie list(\"abc\") ?', '[\"a\",\"b\",\"c\"]', '\"abc\"', '(\"a\",\"b\",\"c\")', 'Error', 'A', 'list() convertit la chaîne en liste de caractères.'),
(501, 19, 'Quelle commande SQL permet de récupérer toutes les colonnes d\'une table users ?', 'SELECT * FROM users;', 'GET * FROM users;', 'FETCH * FROM users;', 'SHOW * FROM users;', 'A', 'SELECT * FROM table renvoie toutes les colonnes.'),
(502, 19, 'Comment renommer la colonne name en full_name ?', 'SELECT name AS full_name FROM table;', 'SELECT name TO full_name FROM table;', 'SELECT name RENAME full_name FROM table;', 'SELECT name CHANGE full_name FROM table;', 'A', 'AS permet de donner un alias à une colonne.'),
(503, 19, 'Quelle clause filtre les lignes où age > 30 ?', 'WHERE age > 30', 'HAVING age > 30', 'FILTER age > 30', 'IF age > 30', 'A', 'WHERE filtre les lignes avant l\'agrégation.'),
(504, 19, 'Comment trier les résultats par date_de_connexion décroissante ?', 'ORDER BY date_de_connexion DESC', 'ORDER BY date_de_connexion ASC', 'SORT BY date_de_connexion DESC', 'GROUP BY date_de_connexion DESC', 'A', 'ORDER BY ... DESC trie en ordre décroissant.'),
(505, 19, 'Quelle clause limite le nombre de résultats à 10 ?', 'LIMIT 10', 'TOP 10', 'FETCH FIRST 10', 'MAX 10', 'A', 'LIMIT 10 restreint le nombre de lignes retournées.'),
(506, 19, 'Comment récupérer les noms distincts ?', 'SELECT DISTINCT name FROM table;', 'SELECT UNIQUE name FROM table;', 'SELECT DIFFERENT name FROM table;', 'SELECT ONLY name FROM table;', 'A', 'DISTINCT élimine les doublons.'),
(507, 19, 'Quel mot-clé renomme une table users en u ?', 'FROM users AS u', 'FROM users RENAME u', 'FROM users TO u', 'FROM users ALIAS u', 'A', 'AS donne un alias à la table.'),
(508, 19, 'Comment sélectionner les colonnes name et email ?', 'SELECT name, email FROM table;', 'SELECT name & email FROM table;', 'SELECT name email FROM table;', 'SELECT name; email FROM table;', 'A', 'La virgule sépare plusieurs colonnes à sélectionner.'),
(509, 19, 'Quelle clause affiche uniquement les lignes où name commence par \"A\"?', 'WHERE name LIKE \"A%\"', 'HAVING name LIKE \"A%\"', 'FILTER name LIKE \"A%\"', 'IF name LIKE \"A%\"', 'A', 'LIKE avec % sert aux correspondances de motifs.'),
(510, 19, 'Comment concaténer deux colonnes firstname et lastname ?', 'SELECT firstname || \" \" || lastname', 'SELECT firstname + lastname', 'SELECT firstname & lastname', 'SELECT CONCAT(firstname, lastname)', 'A', '|| concatène dans SQL standard.'),
(511, 19, 'Quel mot-clé regroupe les lignes par city ?', 'GROUP BY city', 'ORDER BY city', 'FILTER BY city', 'PARTITION BY city', 'A', 'GROUP BY regroupe avant agrégation.'),
(512, 19, 'Comment obtenir le nombre total de lignes ?', 'SELECT COUNT(*) FROM table;', 'SELECT SUM(*) FROM table;', 'SELECT TOTAL(*) FROM table;', 'SELECT NUMBER(*) FROM table;', 'A', 'COUNT(*) compte les lignes.'),
(513, 19, 'Quelle clause affiche uniquement les groupes ayant plus de 5 membres ?', 'HAVING COUNT(*) > 5', 'WHERE COUNT(*) > 5', 'FILTER COUNT(*) > 5', 'GROUP BY COUNT(*) > 5', 'A', 'HAVING filtre après l\'agrégation.'),
(514, 19, 'Comment sélectionner les 5 premières lignes dans SQL Server ?', 'SELECT TOP 5 * FROM table;', 'SELECT LIMIT 5 * FROM table;', 'SELECT FIRST 5 * FROM table;', 'SELECT * FROM table FETCH 5;', 'A', 'TOP 5 est la syntaxe de SQL Server pour limiter.'),
(515, 19, 'Quel mot-clé évite la casse dans LIKE ?', 'ILIKE', 'LIKE', 'MATCH', 'COMPARE', 'A', 'ILIKE (PostgreSQL) fait une recherche insensible à la casse.'),
(516, 19, 'Comment afficher le schéma de la table ?', 'DESCRIBE table;', 'SHOW SCHEMA table;', 'EXPLAIN table;', 'DISPLAY SCHEMA table;', 'A', 'DESCRIBE ou DESC affiche la structure de la table.'),
(517, 19, 'Quelle fonction tronque les espaces en début et fin ?', 'TRIM()', 'STRIP()', 'CLEAN()', 'REMOVE()', 'A', 'TRIM() supprime les espaces superflus.'),
(518, 19, 'Comment remplacer NULL par 0 dans une colonne score ?', 'SELECT COALESCE(score, 0)', 'SELECT IFNULL(score, 0)', 'SELECT NVL(score, 0)', 'Toutes ci-dessus selon SGBD', 'D', 'COALESCE, IFNULL, NVL dépendent du moteur.'),
(519, 19, 'Quel mot-clé ignore les doublons dans INSERT SELECT ?', 'INSERT IGNORE', 'INSERT DISTINCT', 'INSERT UNIQUE', 'INSERT NONE', 'A', 'INSERT IGNORE évite les erreurs de doublons en MySQL.'),
(520, 19, 'Comment formater une date en YYYY-MM-DD ?', 'SELECT DATE_FORMAT(date, \"%Y-%m-%d\")', 'SELECT FORMAT(date, \"YYYY-MM-DD\")', 'SELECT TO_CHAR(date, \"YYYY-MM-DD\")', 'Toutes ci-dessus selon SGBD', 'D', 'Chaque SGBD a sa propre fonction de formatage.'),
(521, 20, 'Quelle clause réalise une jointure interne ?', 'JOIN', 'INNER JOIN', 'OUTER JOIN', 'CROSS JOIN', 'B', 'INNER JOIN ne retourne que les correspondances.'),
(522, 20, 'Comment écrire une jointure entre users et orders ?', 'FROM users u JOIN orders o ON u.id=o.user_id', 'FROM users u, orders o WHERE u.id=o.user_id', 'JOIN users u, orders o ON u.id=o.user_id', 'FROM users u INNER orders o ON u.id=o.user_id', 'A', 'Syntaxe INNER JOIN ON est claire et explicite.'),
(523, 20, 'Quel type de jointure inclut toutes les lignes de la première table ?', 'LEFT JOIN', 'RIGHT JOIN', 'FULL JOIN', 'INNER JOIN', 'A', 'LEFT JOIN conserve toutes les lignes de la table de gauche.'),
(524, 20, 'Quelle jointure inclut toutes les lignes des deux tables ?', 'INNER JOIN', 'LEFT JOIN', 'RIGHT JOIN', 'FULL OUTER JOIN', 'D', 'FULL OUTER JOIN conserve toutes les lignes des deux tables.'),
(525, 20, 'Comment créer un index non unique sur la colonne name ?', 'CREATE INDEX idx_name ON table(name);', 'CREATE UNIQUE INDEX idx_name ON table(name);', 'CREATE INDEX idx_name UNIQUE ON table(name);', 'CREATE INDEX name_idx table(name);', 'A', 'CREATE INDEX nom ON table(colonne) sans UNIQUE.'),
(526, 20, 'Quel avantage apporte un index ?', 'Accélère les SELECT', 'Accélère les INSERT', 'Réduit la taille de la table', 'Empêche les doublons', 'A', 'Les index optimisent la recherche en lecture.'),
(527, 20, 'Quel est l’impact principal des index sur les INSERT ?', 'Aucun', 'Accélèrent', 'Ralentissent légèrement', 'Suppriment les doublons', 'C', 'Les index ralentissent un peu les écritures pour maintenir la structure.'),
(528, 20, 'Comment supprimer un index idx_name ?', 'DROP INDEX idx_name;', 'DELETE INDEX idx_name;', 'REMOVE INDEX idx_name;', 'ALTER TABLE DROP INDEX idx_name;', 'D', 'ALTER TABLE DROP INDEX est la syntaxe MySQL pour supprimer un index.'),
(529, 20, 'Quelle jointure relie toutes les combinaisons possibles ?', 'INNER JOIN', 'LEFT JOIN', 'RIGHT JOIN', 'CROSS JOIN', 'D', 'CROSS JOIN produit le produit cartésien.'),
(530, 20, 'Quel mot-clé combine la jointure et la condition ?', 'USING', 'ON', 'WHERE', 'WITH', 'A', 'USING(col) est un raccourci pour ON table1.col=table2.col.'),
(531, 20, 'Quel index est automatiquement créé pour une clé primaire ?', 'Hash', 'B-tree', 'Unique B-tree', 'Spatial', 'C', 'Le primaire crée un index UNIQUE de type B-tree.'),
(532, 20, 'Comment optimiser une requête avec plusieurs conditions ?', 'Ajouter un index composite', 'Ajouter plusieurs index simples', 'Retirer tous les index', 'Utiliser DISTINCT', 'A', 'Un index composite couvre plusieurs colonnes pour cette requête.'),
(533, 20, 'Quel type de jointure utilise USING(col)?', 'INNER JOIN USING(col)', 'LEFT JOIN USING(col)', 'RIGHT JOIN USING(col)', 'Tous', 'D', 'USING peut s\'appliquer à INNER, LEFT ou RIGHT JOIN.'),
(534, 20, 'Que fait EXPLAIN SELECT ... ?', 'Exécute la requête', 'Montre le plan d\'exécution', 'Optimise la requête', 'Supprime l\'index', 'B', 'EXPLAIN affiche comment le moteur va exécuter la requête.'),
(535, 20, 'Quel est l’ordre d’application des clauses ?', 'SELECT → WHERE → FROM → ORDER BY', 'FROM → WHERE → SELECT → ORDER BY', 'FROM → WHERE → SELECT → GROUP BY', 'FROM → WHERE → SELECT → ORDER BY', 'D', 'Le moteur lit FROM, puis WHERE, puis SELECT, puis ORDER BY.'),
(536, 20, 'Quel index est adapté aux recherches de plage ?', 'Hash', 'B-tree', 'Bitmap', 'Fulltext', 'B', 'B-tree gère efficacement les recherches de plage.'),
(537, 20, 'Comment forcer l\'utilisation d\'un index idx_name ?', 'SELECT ... USE INDEX (idx_name)', 'SELECT ... FORCE INDEX idx_name', 'SELECT ... INDEX(idx_name)', 'SELECT ... WITH INDEX idx_name', 'A', 'USE INDEX spécifie l\'index à privilégier.'),
(538, 20, 'Quelle clause limite les lignes après jointure ?', 'LIMIT', 'OFFSET', 'WHERE', 'HAVING', 'A', 'LIMIT s\'applique après les jointures et l\'aggrégation.'),
(539, 20, 'Quel type d\'index est optimisé pour les recherches textuelles ?', 'B-tree', 'Hash', 'Fulltext', 'Spatial', 'C', 'Fulltext gère la recherche de mots dans les colonnes textuelles.'),
(540, 20, 'Quelle jointure retourne NULL si pas de correspondance ?', 'INNER JOIN', 'LEFT JOIN', 'RIGHT JOIN', 'FULL JOIN', 'B', 'LEFT JOIN donne NULL pour les colonnes de la table de droite en l\'absence de correspondance.'),
(541, 21, 'Quelle commande montre le plan d’exécution d’une requête ?', 'EXPLAIN', 'ANALYZE', 'SHOW PLAN', 'DESCRIBE PLAN', 'A', 'EXPLAIN affiche le plan sans l’exécuter.'),
(542, 21, 'Quelle option EXPLAIN donne les coûts estimés ?', 'EXPLAIN ANALYZE', 'EXPLAIN COSTS', 'EXPLAIN EXTENDED', 'EXPLAIN VERBOSE', 'A', 'EXPLAIN ANALYZE exécute et affiche les coûts réels.'),
(543, 21, 'Comment optimiser une requête GROUP BY lente ?', 'Ajouter un index sur la colonne groupée', 'Supprimer les index', 'Utiliser DISTINCT', 'Augmenter le timeout', 'A', 'Un index sur la colonne GROUP BY accélère l’agrégation.'),
(544, 21, 'Quel indicateur EXPLAIN signale un scan complet ?', 'index scan', 'table scan', 'full scan', 'sequential scan', 'D', 'sequential scan (ou full scan) signifie lecture de toute la table.'),
(545, 21, 'Pourquoi éviter SELECT * en production ?', 'Diminuer la bande passante', 'Augmenter la latence', 'Réduire la mémoire', 'Empêcher les fuites de données', 'A', 'Sélectionner uniquement les colonnes nécessaires réduit le trafic.'),
(546, 21, 'Quel type d’index améliore les requêtes de type LIKE \"abc%\" ?', 'Hash', 'B-tree', 'Fulltext', 'Bitmap', 'B', 'B-tree supporte les recherches de préfixe.'),
(547, 21, 'Quel outil vérifie les index inutilisés ?', 'EXPLAIN', 'SHOW INDEX', 'ANALYZE TABLE', 'SHOW UNUSED INDEX', 'B', 'SHOW INDEX liste les index et leur utilisation.'),
(548, 21, 'Comment forcer le moteur à réutiliser un index ?', 'FORCE INDEX', 'USE INDEX', 'INDEX HINT', 'OPTIMIZE INDEX', 'A', 'FORCE INDEX oblige le moteur à utiliser un index spécifique.'),
(549, 21, 'Quel paramètre de configuration affecte le cache des requêtes ?', 'query_cache_size', 'cache_size', 'tmp_table_size', 'buffer_pool_size', 'A', 'query_cache_size définit la mémoire pour le cache de requêtes MySQL.'),
(550, 21, 'Quelle méthode réduit la fragmentation des index ?', 'OPTIMIZE TABLE', 'ANALYZE TABLE', 'REPAIR TABLE', 'CHECK TABLE', 'A', 'OPTIMIZE TABLE reconstruit les index.'),
(551, 21, 'Que mesure le temps \"rows\" dans EXPLAIN ?', 'Nombre de lignes retournées', 'Nombre de lignes examinées', 'Nombre de lignes indexées', 'Nombre de lignes filtrées', 'B', 'Le champ rows estime les lignes examinées.'),
(552, 21, 'Quel type de JOIN est le plus coûteux sans index ?', 'INNER JOIN', 'LEFT JOIN', 'CROSS JOIN', 'RIGHT JOIN', 'C', 'CROSS JOIN parcourt le produit cartésien, très coûteux.'),
(553, 21, 'Comment vérifier la fragmentation d’une table InnoDB ?', 'SHOW TABLE STATUS', 'SHOW INDEX', 'EXPLAIN FRAGMENTATION', 'ANALYZE FRAGMENTATION', 'A', 'SHOW TABLE STATUS fournit data_free indiquant l’espace libre.'),
(554, 21, 'Quelle clause peut empêcher l’utilisation d’un index ?', 'WHERE col LIKE \"%abc\"', 'WHERE col = abc', 'WHERE col > 5', 'WHERE col IN (1,2)', 'A', 'LIKE \"%abc\" empêche l’utilisation de l’index sur la gauche.'),
(555, 21, 'Comment défragmenter une table MyISAM ?', 'OPTIMIZE TABLE', 'ANALYZE TABLE', 'REPAIR TABLE', 'CHECK TABLE', 'A', 'OPTIMIZE TABLE reconstruit la table et l’index.'),
(556, 21, 'Quel impact a un index trop large ?', 'Ralentit les SELECT', 'Accélère les INSERT', 'Ralentit les INSERT/UPDATE', 'Réduit l’usage mémoire', 'C', 'Index larges ralentissent les écritures.'),
(557, 21, 'Quelle commande met à jour les statistiques utilisées par l’optimiseur ?', 'ANALYZE TABLE', 'OPTIMIZE TABLE', 'REPAIR TABLE', 'CHECK TABLE', 'A', 'ANALYZE TABLE collecte des statistiques sur la distribution des données.'),
(558, 21, 'Que fait un index covering ?', 'Couvre plusieurs tables', 'Inclut toutes les colonnes sélectionnées', 'Couvre la table entière', 'Optimise les jointures', 'B', 'Un covering index contient toutes les colonnes nécessaires à la requête.'),
(559, 21, 'Quel paramètre MySQL ajuste la taille du buffer InnoDB ?', 'innodb_buffer_pool_size', 'innodb_log_file_size', 'innodb_flush_method', 'query_cache_size', 'A', 'innodb_buffer_pool_size définit la mémoire InnoDB pour les données et index.'),
(560, 21, 'Pourquoi utiliser des partitions de table ?', 'Pour augmenter la sécurité', 'Pour répartir les données et réduire le scan de partition', 'Pour supporter plus de connexions', 'Pour compresser les données', 'B', 'La partition limite les scans aux partitions pertinentes.'),
(561, 21, 'Quel plan EXPLAIN indique l’usage d’un index ?', 'type: ALL', 'type: index', 'type: range', 'rows: 0', 'C', 'type: range ou ref implique l’usage de l’index.'),
(562, 22, 'Quel outil est couramment utilisé pour scanner les ports ouverts ?', 'Whois', 'Nmap', 'Nikto', 'Metasploit', 'B', 'Nmap est l’outil standard pour la découverte et le scan de ports.'),
(563, 22, 'Quel protocole fournit des informations sur un domaine ?', 'DNS', 'HTTP', 'FTP', 'SMTP', 'A', 'DNS résout les noms de domaine et peut fournir des enregistrements TXT, MX, etc.'),
(564, 22, 'Quelle commande WHOIS récupère les informations d’enregistrement d’un domaine ?', 'whois example.com', 'nslookup example.com', 'dig example.com', 'traceroute example.com', 'A', 'La commande whois interroge la base d’enregistrement de domaine.'),
(565, 22, 'Quel outil automatise la découverte de sous-domaines ?', 'Sublist3r', 'Burp Suite', 'Hydra', 'John the Ripper', 'A', 'Sublist3r parcourt de nombreuses sources pour identifier les sous-domaines.'),
(566, 22, 'Quel outil vérifie les vulnérabilités de serveurs web ?', 'Nmap', 'Nikto', 'Metasploit', 'Aircrack-ng', 'B', 'Nikto scanne un serveur web pour des fichiers et configurations vulnérables.'),
(567, 22, 'Quel protocole utilise Telnet ?', 'TCP', 'UDP', 'ICMP', 'ARP', 'A', 'Telnet fonctionne sur TCP pour fournir une connexion terminal non chiffrée.'),
(568, 22, 'Que fait la commande traceroute ?', 'Scanne les ports', 'Liste les sous-domaines', 'Trace le chemin réseau', 'Interroge le DNS', 'C', 'Traceroute affiche chaque routeur traversé vers la cible.'),
(569, 22, 'Quel outil récupère les bannières de service ?', 'Whois', 'BannerGrab', 'Metasploit', 'Aircrack-ng', 'B', 'BannerGrab envoie des requêtes pour lire les messages d’accueil des services.'),
(570, 22, 'Quel protocole fournit la résolution d’adresse IP ?', 'DNS', 'SMTP', 'FTP', 'SNMP', 'A', 'DNS résout les noms de domaine en adresses IP.'),
(571, 22, 'Quel outil permet de cartographier un réseau Wi-Fi ?', 'Aircrack-ng', 'Wireshark', 'Nmap', 'Sublist3r', 'A', 'Aircrack-ng inclut airodump-ng pour capturer et cartographier les réseaux sans fil.'),
(572, 22, 'Quel composant réseau affiche les adresses MAC ?', 'Ping', 'ARP', 'Whois', 'Traceroute', 'B', 'ARP mappe les adresses IP aux adresses MAC sur un LAN.'),
(573, 22, 'Quel outil analyse le trafic réseau en temps réel ?', 'Metasploit', 'Wireshark', 'Nmap', 'Nikto', 'B', 'Wireshark capture et analyse le trafic réseau en profondeur.'),
(574, 22, 'Quel protocole utilise la commande ping ?', 'TCP', 'UDP', 'ICMP', 'ARP', 'C', 'Ping utilise ICMP Echo Request/Reply.'),
(575, 22, 'Que permet SNMP ?', 'Scanner les ports', 'Gérer les appareils réseau', 'Récupérer des bannières', 'Déchiffrer le trafic', 'B', 'SNMP permet de lire et configurer des périphériques réseau.'),
(576, 22, 'Quel outil découvre les hôtes actifs ?', 'Nmap -sP', 'Nikto -h', 'Wireshark -i', 'Sublist3r -d', 'A', 'Nmap -sP (ou -sn) réalise un ping scan pour détecter les hôtes.'),
(577, 22, 'Quel message ICMP indique qu’un hôte est injoignable ?', 'Echo Reply', 'Destination Unreachable', 'Time Exceeded', 'Redirect', 'B', 'Le type « Destination Unreachable » informe qu’un hôte ou réseau est joignable.'),
(578, 22, 'Quel outil récupère les certificats SSL/TLS ?', 'sslscan', 'Whois', 'Nikto', 'Aircrack-ng', 'A', 'sslscan examine les configurations SSL/TLS des serveurs.'),
(579, 22, 'Quel script Nmap détecte des versions de services ?', '-sV', '-O', '-sU', '-Pn', 'A', '-sV active la détection de version des services sur les ports ouverts.'),
(580, 22, 'Quel protocole fournit l’heure réseau ?', 'NTP', 'DNS', 'HTTP', 'SMTP', 'A', 'NTP synchronise l’heure entre serveurs sur le réseau.'),
(581, 22, 'Que fait la commande dig +short example.com ?', 'Retourne uniquement l’adresse IP', 'Scanne les ports DNS', 'Fait un traceroute DNS', 'Ignore les serveurs secondaires', 'A', '+short affiche une sortie simplifiée, souvent une IP.'),
(582, 23, 'Quelle technique exploite une injection SQL ?', 'Cross-Site Scripting', 'Inclusion de fichiers', 'Manipulation de paramètres', 'Injection de requêtes SQL', 'D', 'L\'injection SQL insère du code SQL malveillant dans les requêtes.'),
(583, 23, 'Quel paramètre HTTP est souvent ciblé par les attaques XSS ?', 'User-Agent', 'Accept', 'Cookie', 'Toute entrée renvoyée au navigateur', 'D', 'XSS exploite toute entrée renvoyée sans encodage côté client.'),
(584, 23, 'Quelle fonction PHP est dangereuse si on lui passe un code arbitraire ?', 'include()', 'require()', 'eval()', 'file_get_contents()', 'C', 'eval() exécute du code PHP arbitraire et doit être évitée.'),
(585, 23, 'Quel en-tête HTTP renforce la protection XSS ?', 'X-Content-Type-Options', 'Content-Security-Policy', 'X-Frame-Options', 'Strict-Transport-Security', 'B', 'CSP limite les sources de scripts exécutables.');
INSERT INTO `questions` (`id`, `quiz_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `reponse_correcte`, `explication`) VALUES
(586, 23, 'Quel type d\'injection permet d\'exécuter des commandes système ?', 'Injection de commandes', 'XXE', 'LFI', 'CSRF', 'A', 'L\'injection de commandes système insère des commandes shell.'),
(587, 23, 'Quel paramètre GET est typique d\'une LFI ?', 'id=../../etc/passwd', 'user=admin', 'page=home', 'file=index.html', 'A', 'Les séquences « ../ » indiquent souvent une LFI.'),
(588, 23, 'Quelle attaque cible les entités externes XML ?', 'XSS', 'XXE', 'SQLi', 'CSRF', 'B', 'XXE exploite les entités externes dans les documents XML.'),
(589, 23, 'Quel outil automatise la découverte et l\'exploitation des SQLi ?', 'Nikto', 'sqlmap', 'Metasploit', 'Burp Scanner', 'B', 'sqlmap détecte et exploite automatiquement les injections SQL.'),
(590, 23, 'Quel code HTTP indique qu\'une requête CSRF a été bloquée ?', '200 OK', '301 Moved', '403 Forbidden', '500 Internal Server Error', 'C', '403 signifie que l\'action est interdite (souvent token CSRF manquant).'),
(591, 23, 'Quelle vulnérabilité exploite les inclusions de fichiers distants ?', 'LFI', 'RFI', 'XSS', 'SQLi', 'B', 'RFI (Remote File Inclusion) inclut des scripts distants malveillants.'),
(592, 23, 'Quelle méthode HTTP est susceptible d\'être exploitée en CSRF ?', 'GET', 'POST', 'PUT', 'Toutes', 'D', 'Toute méthode non protégée (GET, POST, etc.) peut être visée par un CSRF.'),
(593, 23, 'Quel en-tête empêche un site d\'être affiché en iframe ?', 'Content-Security-Policy', 'X-Content-Type-Options', 'X-Frame-Options', 'Strict-Transport-Security', 'C', 'X-Frame-Options: DENY interdit l\'affichage en iframe.'),
(594, 23, 'Quelle fonction JavaScript ses mauvaise utilisation facilite XSS ?', 'alert()', 'console.log()', 'document.write()', 'parseInt()', 'C', 'document.write() peut injecter du HTML/JS non filtré.'),
(595, 23, 'Quel outil de Burp Suite automatise la recherche de vulnérabilités web ?', 'Intruder', 'Repeater', 'Scanner', 'Sequencer', 'C', 'Le Scanner identifie automatiquement les failles.'),
(596, 23, 'Quel code HTTP indique que la ressource n\'existe pas ?', '200 OK', '301 Moved', '403 Forbidden', '404 Not Found', 'D', '404 signifie que la ressource n\'a pas été trouvée.'),
(597, 23, 'Quel en-tête contrôle les origines autorisées pour AJAX ?', 'Access-Control-Allow-Origin', 'Content-Type', 'User-Agent', 'Referer', 'A', 'CORS est configuré via cet en-tête pour AJAX.'),
(598, 23, 'Quel patch corrige la vulnérabilité Shellshock ?', 'Mise à jour du noyau', 'Mise à jour de Bash', 'Mise à jour d\'OpenSSL', 'Mise à jour de PHP', 'B', 'Le correctif de Bash comble la faille Shellshock.'),
(599, 23, 'Quel outil détecte automatiquement les vulnérabilités web ?', 'Nmap', 'Nikto', 'sqlmap', 'Burp Scanner', 'D', 'Burp Scanner réalise un scan de sécurité web.'),
(600, 23, 'Quelle technique permet de forcer l\'upload de fichiers PHP ?', 'Renommage .php en .jpg', 'Encodage Base64', 'Multipart form data', 'Cross-Site Scripting', 'A', 'Changer l\'extension contourne parfois les contrôles de type.'),
(601, 23, 'Quel en-tête HTTP doit être validé pour prévenir la SSRF ?', 'Host', 'Accept', 'Content-Type', 'Referer', 'A', 'Valider Host empêche l\'accès à des ressources internes.'),
(602, 24, 'Quel outil Windows extrait les mots de passe en clair de la mémoire ?', 'Mimikatz', 'Responder', 'Hashcat', 'Metasploit', 'A', 'Mimikatz lit les jetons et mots de passe en mémoire.'),
(603, 24, 'Qu\'est-ce que le Pass-the-Hash ?', 'Vol de mot de passe texte clair', 'Réutilisation de hachages NTLM', 'Injection SQL', 'Brute force SSH', 'B', 'Pass-the-Hash utilise un hash NTLM pour s\'authentifier.'),
(604, 24, 'Quel script Linux identifie les SUID root vulnérables ?', 'LinEnum', 'Linux Exploit Suggester', 'Ldapenum', 'LinPEAS', 'A', 'LinEnum détecte de nombreux vecteurs d\'escalade de privilèges.'),
(605, 24, 'Quelle technique permet la persistance après redémarrage ?', 'Création d\'un service', 'Effacement des logs', 'Elevation de privilèges', 'Modification du shell par défaut', 'A', 'Un service Windows ou un systemd unit sous Linux persiste au reboot.'),
(606, 24, 'Où sont stockées les tâches planifiées Windows ?', '%WINDIR%\\System32\\Tasks', '%PROGRAMFILES%', '%TEMP%', '%USERPROFILE%', 'A', 'System32\\Tasks contient les XML des tâches planifiées.'),
(607, 24, 'Quel payload Meterpreter offre un shell furtif ?', 'shell', 'execute', 'getuid', 'use exploit', 'A', 'La commande shell ouvre un terminal interactif en mémoire.'),
(608, 24, 'Quelle commande Windows liste tous les services ?', 'services.msc', 'net start', 'sc query', 'tasklist', 'C', 'sc query affiche la liste des services via CLI.'),
(609, 24, 'Quel outil collecte les secrets Kerberos ?', 'Responder', 'Mimikatz', 'Rubeus', 'Impacket', 'C', 'Rubeus interagit avec Kerberos pour voler ou forger des tickets.'),
(610, 24, 'Quelle technique détourne des jetons d\'un processus ?', 'DLL Injection', 'Token Impersonation', 'Pass-the-Hash', 'Golden Ticket', 'B', 'Token Impersonation permet de s\'identifier comme un autre utilisateur.'),
(611, 24, 'Quel journal Linux contient les tentatives sudo ?', '/var/log/auth.log', '/var/log/syslog', '/var/log/secure', '/var/log/messages', 'A', 'auth.log consigne les activités sudo et SSH.'),
(612, 24, 'Quelle option ssh permet le port forwarding local ?', '-L', '-R', '-D', '-X', 'A', 'ssh -L forwarde un port local vers la machine distante.'),
(613, 24, 'Quelle tâche cron Linux s\'exécute au démarrage ?', '@reboot', '@daily', '@hourly', '@weekly', 'A', 'Le préfixe @reboot exécute le job après chaque reboot.'),
(614, 24, 'Qu\'est-ce qu\'un Golden Ticket ?', 'Hachage de session', 'Ticket Kerberos forgé', 'Mot de passe en clair', 'Token OAuth falsifié', 'B', 'Un Golden Ticket est un ticket Kerberos forgé pour un accès illimité.'),
(615, 24, 'Comment supprimer les logs Windows via PowerShell ?', 'Clear-EventLog', 'Remove-EventLog', 'Erase-Logs', 'Clean-Logs', 'A', 'Clear-EventLog efface les journaux d\'événements spécifiés.'),
(616, 24, 'Quel outil Linux active l\'audit du système ?', 'auditd', 'syslog', 'rsyslog', 'journald', 'A', 'auditd gère la journalisation d\'audit sous Linux.'),
(617, 24, 'Quelle commande Linux liste les connexions réseau actives ?', 'netstat -tulpn', 'ss -tulpn', 'lsof -i', 'Toutes ci-dessus', 'D', 'Chacune de ces commandes peut lister les connexions actives.'),
(618, 24, 'Quel script PowerShell obtiendra une session inversée ?', 'Invoke-Shellcode', 'Invoke-PsExec', 'Invoke-Command', 'Invoke-WebRequest', 'A', 'Invoke-Shellcode peut injecter du shellcode pour un reverse shell.'),
(619, 24, 'Quel utilitaire Windows capture le trafic réseau ?', 'Wireshark', 'tcpdump', 'tshark', 'netsh trace', 'D', 'netsh trace configure la capture réseau via Windows CLI.'),
(620, 24, 'Quelle méthode persiste en modifiant le registre Windows ?', 'HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run', 'HKCU\\Environment', 'HKLM\\Hardware', 'HKCU\\Network', 'A', 'La clé Run exécute des programmes à la connexion utilisateur.'),
(621, 24, 'Quel outil dérobe les cookies de session dans le navigateur ?', 'Mimikatz', 'Responder', 'LaZagne', 'BeEF', 'D', 'BeEF s\'intègre au navigateur pour voler les données de session.');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) DEFAULT NULL,
  `niveau` enum('1','2','3') DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total_questions` int(11) DEFAULT 20,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `cours_id`, `niveau`, `title`, `total_questions`, `description`) VALUES
(1, 1, '1', 'HTML Débutant - Bases du HTML', 20, NULL),
(2, 1, '2', 'HTML Intermédiaire - Formulaires et Sémantique', 20, NULL),
(3, 1, '3', 'HTML Avancé - Accessibilité et Microdonnées', 20, NULL),
(4, 2, '1', 'JS Débutant - Syntaxe de base', 20, NULL),
(5, 2, '2', 'JS Intermédiaire - DOM Manipulation', 20, NULL),
(6, 2, '3', 'JS Avancé - Async/Await', 20, NULL),
(7, 3, '1', 'Linux Débutant - Commandes de Base', 20, NULL),
(8, 3, '2', 'Linux Intermédiaire - Gestion des Utilisateurs', 20, NULL),
(9, 3, '3', 'Linux Avancé - Scripting Shell', 20, NULL),
(10, 4, '1', 'Cryptographie Débutant - Chiffrement de Base', 20, NULL),
(11, 4, '2', 'Cryptographie Intermédiaire - Algorithmes Symétriques', 20, NULL),
(12, 4, '3', 'Cryptographie Avancée - PKI et Certificats', 20, NULL),
(13, 5, '1', 'PHP Débutant - Syntaxe de Base', 20, NULL),
(14, 5, '2', 'PHP Intermédiaire - Programmation Orientée Objet', 20, NULL),
(15, 5, '3', 'PHP Avancé - Sécurité et Performance', 20, NULL),
(16, 6, '1', 'Python Débutant - Types de Données', 20, NULL),
(17, 6, '2', 'Python Intermédiaire - Bibliothèques Scientifiques', 20, NULL),
(18, 6, '3', 'Python Avancé - Métaclasses et Décorateurs', 20, NULL),
(19, 7, '1', 'SQL Débutant - Requêtes SELECT', 20, NULL),
(20, 7, '2', 'SQL Intermédiaire - Jointures et Index', 20, NULL),
(21, 7, '3', 'SQL Avancé - Optimisation de Requêtes', 20, NULL),
(22, 8, '1', 'Hacking Débutant - Reconnaissance', 20, NULL),
(23, 8, '2', 'Hacking Intermédiaire - Exploitation Web', 20, NULL),
(24, 8, '3', 'Hacking Avancé - Post-Exploitation', 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `user_id`, `quiz_id`, `score`, `total_questions`, `session_id`, `created_at`) VALUES
(1, 1, 13, 7, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(2, 1, 1, 1, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(3, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(4, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(5, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(6, 1, 1, 1, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(7, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:04'),
(8, 1, 2, 1, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(9, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(10, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(11, 1, 1, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(12, 1, 1, 1, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(13, 1, 6, 2, 18, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(14, 1, 6, 2, 18, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(15, 1, 6, 2, 18, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(16, 1, 6, 3, 18, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(17, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(18, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(19, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(20, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(21, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(22, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(23, 1, 4, 0, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(24, 1, 24, 4, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(25, 1, 24, 4, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(26, 1, 24, 3, 20, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(27, 1, 24, 3, 20, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(28, 1, 4, 19, 20, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(29, 1, 1, 0, 20, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(30, 1, 1, 0, 20, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(31, 1, 1, 2, 20, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(32, 1, 1, 1, 20, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(33, 1, 1, 1, 20, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:23:00'),
(34, 1, 1, 1, 20, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(35, 1, 1, 0, 20, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(36, 1, 1, 0, 20, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(37, 1, 1, 0, 20, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(38, 1, 1, 1, 20, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(39, 1, 20, 4, 20, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(40, 17, 2, 3, 20, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(41, 17, 4, 3, 20, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(42, 17, 4, 19, 20, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(43, 18, 1, 1, 20, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(44, 18, 2, 1, 20, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(45, 17, 2, 1, 20, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(46, 17, 4, 19, 20, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(47, 17, 5, 1, 19, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `security_logs`
--

CREATE TABLE `security_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(128) NOT NULL,
  `data` mediumtext DEFAULT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` text NOT NULL,
  `payload` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `data`, `timestamp`, `user_id`, `ip_address`, `user_agent`, `payload`, `created_at`, `last_activity`, `expires_at`) VALUES
('0b3abci8jstmf62ick1ecutjnd', '', 1746849567, NULL, '', '', '', '2025-05-10 03:59:27', '2025-05-10 03:59:27', NULL),
('2ec9mi9g8bhhn11b4fmk5l0vbq', '', 1747009989, NULL, '', '', '', '2025-05-12 00:33:09', '2025-05-12 00:33:09', NULL),
('6f39uq8dpvro5982dkemj0e9ip', '', 1746831109, NULL, '', '', '', '2025-05-09 22:51:49', '2025-05-09 22:51:49', NULL),
('6v7uako144lc5l8hjfsmeqtucu', '', 1746950314, NULL, '', '', '', '2025-05-11 07:58:34', '2025-05-11 07:58:34', NULL),
('c3fafdjuld15cjdis9smeehfg2', '', 1747737678, NULL, '', '', '', '2025-05-20 10:41:18', '2025-05-20 10:41:18', NULL),
('fc8qvfuq7drmb285a2l9ba12cf', '', 1746803906, NULL, '', '', '', '2025-05-09 15:18:26', '2025-05-09 15:18:26', NULL),
('hmpbq6790c56s73c4548n9tk5i', '', 1747667837, NULL, '', '', '', '2025-05-19 15:17:17', '2025-05-19 15:17:17', NULL),
('q1gj3k2oo7tlg166noj12vmr5k', '', 1747668675, NULL, '', '', '', '2025-05-19 15:31:15', '2025-05-19 15:31:15', NULL),
('q5863bq4d4h0bksvh50m8l8t5m', '', 1747737912, NULL, '', '', '', '2025-05-20 10:45:12', '2025-05-20 10:45:12', NULL),
('rdn3plvf1mp5tfhpjujtubq7qq', '', 1746824358, NULL, '', '', '', '2025-05-09 20:59:18', '2025-05-09 20:59:18', NULL),
('si2q6sc71ig8jtk449164qu5bo', '', 1746828673, NULL, '', '', '', '2025-05-09 22:11:13', '2025-05-09 22:11:13', NULL),
('vljsjra2s2hn14llmd5hlh1jfm', '', 1746804059, NULL, '', '', '', '2025-05-09 15:20:59', '2025-05-09 15:20:59', NULL),
('vuiv2h61m4fsp243n3ppjkb8g2', '', 1746843898, NULL, '', '', '', '2025-05-10 02:24:58', '2025-05-10 02:24:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `role` enum('student','teacher','admin') NOT NULL DEFAULT 'student',
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `role`, `profile_picture`, `bio`, `phone`, `address`, `created_at`, `updated_at`, `last_login`, `is_active`) VALUES
(1, 'sara@gamil.com', '$2y$10$K3zsdhXjwZderH2a9WoIPeSLEV5ei4lxUryRDCMZwTY.Qi/BEn2uW', 'sara', 'da', 'student', NULL, NULL, NULL, NULL, '2025-05-09 15:14:43', '2025-05-09 15:14:43', NULL, 1),
(2, 'salma@gmail.com', '$2y$10$4gAtHGNMHaEn6Xtn4WTFr.PLg5JgjBcqjnZ0A2rl59jriKN6KazBu', 'salma', 'sa', 'student', NULL, NULL, NULL, NULL, '2025-05-09 15:19:55', '2025-05-09 15:19:55', NULL, 1),
(3, 'hafsa@gmail.com', '$2y$10$EHbNAKD4aLOhpFhwNZs2POlxlgMn5TdKJTB/zXC/XKxiBKGopMYmC', 'hafsa', 'ha', 'admin', NULL, NULL, NULL, NULL, '2025-05-09 15:21:57', '2025-05-09 15:21:57', NULL, 1),
(9, 'zineb@gmail.com', '$2y$10$Xn8qnYQInvsi4r8lZXEn8eS0PZsRUyGEuNCv1UctI5Zx27Pmd4wsy', 'zineb', 'zinzb', 'student', NULL, NULL, NULL, NULL, '2025-05-09 19:34:20', '2025-05-09 19:34:20', NULL, 1),
(10, 'da@gmail.com', '$2y$10$gEn72A/2mHscl0kDIMnZbeVT5g.FA5F7X7JNAUAUBoDTJXotkDH6G', 'da', 'de', 'admin', NULL, NULL, NULL, NULL, '2025-05-09 20:19:38', '2025-05-09 20:19:38', NULL, 1),
(11, 'nada@gmail.com', '$2y$10$LHAMHIT96EYYSesmmxj6fO1/f6CcsIWHYhWTVpmjICSHhuN7N2iWy', 'nada', 'nada', 'student', NULL, NULL, NULL, NULL, '2025-05-09 20:22:02', '2025-05-09 20:22:02', NULL, 1),
(12, 'ro@gmail.com', '$2y$10$RQaoIhv4lVT4YXE8sQ3MsO8td32zcNZoTe16GjacCnsqwWUj3B9ei', 'nada', 'nada', 'student', NULL, NULL, NULL, NULL, '2025-05-09 20:28:34', '2025-05-09 20:28:34', NULL, 1),
(13, 'admin@example.com', '$2y$10$2qqvC9LrrPAvYLUg4w7nL.tYSVteOlvoioSPI8.J588q9R643/GOe', 'Admin', 'User', 'admin', NULL, NULL, NULL, NULL, '2025-05-09 21:13:04', '2025-05-09 21:13:04', NULL, 1),
(14, 'narjis@gmail.com', '$2y$10$FtQT/VQnWP4/tJemGBPzn.jAw0MJweTAWTo7bNZwKDkXqMvREDd0K', 'narjis', 'narjis', 'student', NULL, NULL, NULL, NULL, '2025-05-09 21:34:57', '2025-05-09 21:34:57', NULL, 1),
(15, 'sara00@gmail.com', '$2y$10$V5wgvXWQM/vxnsqdlkf0TeRgR1eU2CvJsG6QR.D42QyK3cZP3Om7G', 'boba', 'boba', 'student', NULL, NULL, NULL, NULL, '2025-05-09 21:41:33', '2025-05-09 22:51:39', NULL, 1),
(16, 'si@gmail.com', '$2y$10$aKcL3oEB6VYlow0P6ab98uiu0h7BAWLOVxfaR3.EcB1cgwOdiFgnS', 'salma', 'salma', 'student', NULL, NULL, NULL, NULL, '2025-05-10 02:26:20', '2025-05-10 02:26:20', NULL, 1),
(17, 'wiam@gmail.com', '$2y$10$k87atNioS/G7DJtt70xxlOqUm6oRQaIU5HkLRK7svyfUC6s5e.AHq', 'wiam', 'baba', 'student', NULL, NULL, NULL, NULL, '2025-05-10 12:42:16', '2025-05-10 12:42:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_answer` char(1) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `answered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `user_id`, `quiz_id`, `question_id`, `selected_answer`, `is_correct`, `session_id`, `answered_at`) VALUES
(1, 1, 12, 356, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(2, 1, 12, 341, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(3, 1, 12, 358, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(4, 1, 12, 346, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(5, 1, 12, 350, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(6, 1, 12, 343, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(7, 1, 12, 345, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(8, 1, 12, 351, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(9, 1, 12, 348, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(10, 1, 12, 344, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(11, 1, 12, 347, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(12, 1, 12, 354, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(13, 1, 12, 355, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(14, 1, 12, 357, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(15, 1, 12, 342, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(16, 1, 12, 349, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(17, 1, 12, 352, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(18, 1, 12, 353, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:03:24'),
(19, 1, 12, 355, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(20, 1, 12, 351, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(21, 1, 12, 356, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(22, 1, 12, 350, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(23, 1, 12, 349, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(24, 1, 12, 353, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(25, 1, 12, 346, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(26, 1, 12, 358, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(27, 1, 12, 347, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(28, 1, 12, 354, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(29, 1, 12, 342, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(30, 1, 12, 357, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(31, 1, 12, 343, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(32, 1, 12, 348, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(33, 1, 12, 345, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(34, 1, 12, 344, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(35, 1, 12, 341, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(36, 1, 12, 352, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:07:50'),
(37, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(38, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(39, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(40, 1, 1, 129, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(41, 1, 1, 137, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(42, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(43, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(44, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(45, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(46, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(47, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(48, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(49, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(50, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(51, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(52, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(53, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(54, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(55, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(56, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:15:34'),
(57, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(58, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(59, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(60, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(61, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(62, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(63, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(64, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(65, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(66, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(67, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(68, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(69, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(70, 1, 1, 124, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(71, 1, 1, 135, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(72, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(73, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(74, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(75, 1, 1, 136, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(76, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(77, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(78, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(79, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(80, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(81, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(82, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(83, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(84, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(85, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(86, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(87, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(88, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(89, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(90, 1, 1, 124, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(91, 1, 1, 135, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(92, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(93, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(94, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(95, 1, 1, 136, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:43'),
(96, 1, 1, 130, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(97, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(98, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(99, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(100, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(101, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(102, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(103, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(104, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(105, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(106, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(107, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(108, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(109, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(110, 1, 1, 124, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(111, 1, 1, 135, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(112, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(113, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(114, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(115, 1, 1, 136, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(116, 1, 1, 130, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-07 11:32:44'),
(117, 1, 1, 134, '0', 0, '6', '2025-05-09 02:30:22'),
(118, 1, 1, 128, '0', 0, '6', '2025-05-09 02:30:22'),
(119, 1, 1, 121, '0', 0, '6', '2025-05-09 02:30:22'),
(120, 1, 1, 135, '0', 0, '6', '2025-05-09 02:30:22'),
(121, 1, 1, 138, '0', 0, '6', '2025-05-09 02:30:22'),
(122, 1, 1, 122, '0', 0, '6', '2025-05-09 02:30:22'),
(123, 1, 1, 127, '0', 0, '6', '2025-05-09 02:30:22'),
(124, 1, 1, 133, '0', 0, '6', '2025-05-09 02:30:22'),
(125, 1, 1, 131, '0', 0, '6', '2025-05-09 02:30:22'),
(126, 1, 1, 125, '0', 0, '6', '2025-05-09 02:30:22'),
(127, 1, 1, 126, '0', 0, '6', '2025-05-09 02:30:22'),
(128, 1, 1, 129, '0', 0, '6', '2025-05-09 02:30:22'),
(129, 1, 1, 130, '0', 0, '6', '2025-05-09 02:30:22'),
(130, 1, 1, 136, '0', 0, '6', '2025-05-09 02:30:22'),
(131, 1, 1, 139, '0', 0, '6', '2025-05-09 02:30:22'),
(132, 1, 1, 140, '0', 0, '6', '2025-05-09 02:30:22'),
(133, 1, 1, 124, '0', 0, '6', '2025-05-09 02:30:22'),
(134, 1, 1, 137, '0', 0, '6', '2025-05-09 02:30:22'),
(135, 1, 1, 132, '0', 0, '6', '2025-05-09 02:30:22'),
(136, 1, 1, 123, '0', 1, '6', '2025-05-09 02:30:22'),
(137, 1, 13, 360, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(138, 1, 13, 364, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(139, 1, 13, 373, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(140, 1, 13, 369, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(141, 1, 13, 365, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(142, 1, 13, 378, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(143, 1, 13, 375, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(144, 1, 13, 376, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(145, 1, 13, 361, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(146, 1, 13, 377, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(147, 1, 13, 366, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(148, 1, 13, 368, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(149, 1, 13, 367, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(150, 1, 13, 374, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(151, 1, 13, 363, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(152, 1, 13, 359, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(153, 1, 13, 370, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(154, 1, 13, 362, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(155, 1, 13, 371, '0', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(156, 1, 13, 372, '0', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 02:50:29'),
(157, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(158, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(159, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(160, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(161, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(162, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(163, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(164, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(165, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(166, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(167, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(168, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(169, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(170, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(171, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(172, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(173, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(174, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(175, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(176, 1, 1, 132, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 03:57:16'),
(177, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(178, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(179, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(180, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(181, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(182, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(183, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(184, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(185, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(186, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(187, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(188, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(189, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(190, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(191, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(192, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(193, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(194, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(195, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(196, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(197, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(198, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(199, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(200, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(201, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(202, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(203, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(204, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(205, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(206, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(207, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(208, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(209, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(210, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(211, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(212, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(213, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(214, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(215, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(216, 1, 1, 131, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(217, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(218, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(219, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(220, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(221, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(222, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(223, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:53'),
(224, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(225, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(226, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(227, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(228, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(229, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(230, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(231, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(232, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(233, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(234, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(235, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(236, 1, 1, 131, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:00:54'),
(237, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(238, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(239, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(240, 1, 1, 123, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(241, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(242, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(243, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(244, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(245, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(246, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(247, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(248, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(249, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(250, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(251, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(252, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(253, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(254, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(255, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(256, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:10:05'),
(297, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(298, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(299, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(300, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(301, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(302, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(303, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(304, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(305, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(306, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(307, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(308, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(309, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(310, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(311, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(312, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(313, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(314, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:03'),
(315, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:04'),
(316, 1, 1, 127, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:16:04'),
(317, 1, 2, 158, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(318, 1, 2, 148, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(319, 1, 2, 155, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(320, 1, 2, 144, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(321, 1, 2, 146, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(322, 1, 2, 157, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(323, 1, 2, 147, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(324, 1, 2, 143, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(325, 1, 2, 150, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(326, 1, 2, 151, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(327, 1, 2, 141, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(328, 1, 2, 145, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(329, 1, 2, 149, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(330, 1, 2, 159, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(331, 1, 2, 160, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(332, 1, 2, 156, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(333, 1, 2, 152, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(334, 1, 2, 153, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(335, 1, 2, 154, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(336, 1, 2, 142, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:23:42'),
(337, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(338, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(339, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(340, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(341, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(342, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(343, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(344, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(345, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(346, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(347, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:07'),
(348, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(349, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(350, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(351, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(352, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(353, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(354, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(355, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(356, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(357, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(358, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(359, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(360, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(361, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(362, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(363, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(364, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(365, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(366, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(367, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(368, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(369, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(370, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(371, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(372, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(373, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(374, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(375, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(376, 1, 1, 134, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(377, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(378, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(379, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(380, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(381, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(382, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(383, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(384, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(385, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(386, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(387, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(388, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(389, 1, 1, 131, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(390, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(391, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(392, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(393, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(394, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(395, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(396, 1, 1, 134, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 04:49:08'),
(397, 1, 1, 131, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(398, 1, 1, 130, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(399, 1, 1, 125, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(400, 1, 1, 129, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(401, 1, 1, 132, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(402, 1, 1, 133, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(403, 1, 1, 136, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(404, 1, 1, 123, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(405, 1, 1, 134, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(406, 1, 1, 124, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(407, 1, 1, 122, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(408, 1, 1, 127, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(409, 1, 1, 121, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(410, 1, 1, 139, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(411, 1, 1, 137, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(412, 1, 1, 135, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(413, 1, 1, 138, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(414, 1, 1, 128, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(415, 1, 1, 126, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(416, 1, 1, 140, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:10:14'),
(417, 1, 6, 235, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(418, 1, 6, 225, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(419, 1, 6, 234, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(420, 1, 6, 239, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(421, 1, 6, 228, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(422, 1, 6, 223, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(423, 1, 6, 231, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(424, 1, 6, 227, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(425, 1, 6, 233, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(426, 1, 6, 238, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(427, 1, 6, 226, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(428, 1, 6, 230, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(429, 1, 6, 229, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(430, 1, 6, 237, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(431, 1, 6, 224, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(432, 1, 6, 222, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(433, 1, 6, 236, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(434, 1, 6, 232, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(435, 1, 6, 235, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(436, 1, 6, 225, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(437, 1, 6, 234, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(438, 1, 6, 239, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(439, 1, 6, 228, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(440, 1, 6, 223, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(441, 1, 6, 231, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(442, 1, 6, 227, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(443, 1, 6, 233, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(444, 1, 6, 238, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(445, 1, 6, 226, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(446, 1, 6, 230, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(447, 1, 6, 229, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(448, 1, 6, 237, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(449, 1, 6, 224, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(450, 1, 6, 222, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(451, 1, 6, 236, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(452, 1, 6, 232, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(453, 1, 6, 235, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(454, 1, 6, 225, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(455, 1, 6, 234, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(456, 1, 6, 239, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(457, 1, 6, 228, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(458, 1, 6, 223, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(459, 1, 6, 231, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(460, 1, 6, 227, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(461, 1, 6, 233, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(462, 1, 6, 238, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(463, 1, 6, 226, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(464, 1, 6, 230, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(465, 1, 6, 229, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(466, 1, 6, 237, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(467, 1, 6, 224, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(468, 1, 6, 222, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(469, 1, 6, 236, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(470, 1, 6, 232, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(471, 1, 6, 235, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(472, 1, 6, 225, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(473, 1, 6, 234, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(474, 1, 6, 239, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:45'),
(475, 1, 6, 228, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(476, 1, 6, 223, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(477, 1, 6, 231, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(478, 1, 6, 227, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(479, 1, 6, 233, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(480, 1, 6, 238, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(481, 1, 6, 226, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(482, 1, 6, 230, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(483, 1, 6, 229, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(484, 1, 6, 237, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(485, 1, 6, 224, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(486, 1, 6, 222, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(487, 1, 6, 236, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(488, 1, 6, 232, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:12:46'),
(489, 1, 4, 188, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(490, 1, 4, 198, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(491, 1, 4, 194, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(492, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(493, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(494, 1, 4, 183, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(495, 1, 4, 186, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(496, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(497, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(498, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(499, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(500, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(501, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(502, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(503, 1, 4, 201, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(504, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(505, 1, 4, 190, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(506, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(507, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(508, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:17:24'),
(509, 1, 4, 198, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(510, 1, 4, 190, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(511, 1, 4, 183, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(512, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(513, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(514, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(515, 1, 4, 188, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(516, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(517, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(518, 1, 4, 187, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(519, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(520, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(521, 1, 4, 201, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(522, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(523, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(524, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(525, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(526, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(527, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(528, 1, 4, 194, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(529, 1, 4, 198, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(530, 1, 4, 190, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(531, 1, 4, 183, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(532, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(533, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(534, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(535, 1, 4, 188, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(536, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(537, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(538, 1, 4, 187, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(539, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(540, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(541, 1, 4, 201, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(542, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(543, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(544, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(545, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(546, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(547, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(548, 1, 4, 194, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(549, 1, 4, 198, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(550, 1, 4, 190, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(551, 1, 4, 183, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(552, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(553, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(554, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:30'),
(555, 1, 4, 188, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(556, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(557, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(558, 1, 4, 187, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(559, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(560, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(561, 1, 4, 201, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(562, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(563, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(564, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(565, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(566, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(567, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(568, 1, 4, 194, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:30:31'),
(569, 1, 4, 183, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(570, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(571, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(572, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(573, 1, 4, 201, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(574, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(575, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(576, 1, 4, 187, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(577, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(578, 1, 4, 186, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(579, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(580, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(581, 1, 4, 188, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(582, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(583, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(584, 1, 4, 194, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(585, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(586, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(587, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(588, 1, 4, 190, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(589, 1, 4, 183, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(590, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(591, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(592, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(593, 1, 4, 201, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(594, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(595, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(596, 1, 4, 187, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(597, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(598, 1, 4, 186, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(599, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(600, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(601, 1, 4, 188, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(602, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(603, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(604, 1, 4, 194, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(605, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(606, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(607, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(608, 1, 4, 190, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(609, 1, 4, 183, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(610, 1, 4, 189, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(611, 1, 4, 193, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(612, 1, 4, 195, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(613, 1, 4, 201, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:11'),
(614, 1, 4, 202, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(615, 1, 4, 184, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(616, 1, 4, 187, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(617, 1, 4, 200, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(618, 1, 4, 186, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(619, 1, 4, 199, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(620, 1, 4, 182, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(621, 1, 4, 188, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(622, 1, 4, 197, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(623, 1, 4, 185, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(624, 1, 4, 194, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(625, 1, 4, 192, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(626, 1, 4, 196, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(627, 1, 4, 191, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(628, 1, 4, 190, 'D', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 05:33:12'),
(629, 1, 24, 615, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(630, 1, 24, 605, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(631, 1, 24, 616, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(632, 1, 24, 618, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(633, 1, 24, 619, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(634, 1, 24, 603, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(635, 1, 24, 617, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(636, 1, 24, 604, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(637, 1, 24, 621, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(638, 1, 24, 607, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(639, 1, 24, 613, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(640, 1, 24, 610, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(641, 1, 24, 606, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(642, 1, 24, 608, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(643, 1, 24, 609, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(644, 1, 24, 620, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(645, 1, 24, 611, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(646, 1, 24, 602, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(647, 1, 24, 614, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(648, 1, 24, 612, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(649, 1, 24, 615, 'A', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(650, 1, 24, 605, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(651, 1, 24, 616, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(652, 1, 24, 618, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(653, 1, 24, 619, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(654, 1, 24, 603, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(655, 1, 24, 617, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(656, 1, 24, 604, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(657, 1, 24, 621, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(658, 1, 24, 607, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(659, 1, 24, 613, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(660, 1, 24, 610, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(661, 1, 24, 606, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(662, 1, 24, 608, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(663, 1, 24, 609, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(664, 1, 24, 620, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(665, 1, 24, 611, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(666, 1, 24, 602, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(667, 1, 24, 614, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(668, 1, 24, 612, 'C', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:02:13'),
(669, 1, 24, 609, 'A', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(670, 1, 24, 617, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(671, 1, 24, 608, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(672, 1, 24, 613, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(673, 1, 24, 607, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(674, 1, 24, 620, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(675, 1, 24, 615, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(676, 1, 24, 604, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(677, 1, 24, 603, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(678, 1, 24, 616, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(679, 1, 24, 618, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(680, 1, 24, 621, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(681, 1, 24, 606, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(682, 1, 24, 612, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(683, 1, 24, 605, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(684, 1, 24, 614, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(685, 1, 24, 610, 'B', 1, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(686, 1, 24, 611, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(687, 1, 24, 602, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(688, 1, 24, 619, 'B', 0, '6v7uako144lc5l8hjfsmeqtucu', '2025-05-09 06:08:46'),
(689, 1, 24, 609, 'A', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(690, 1, 24, 617, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(691, 1, 24, 608, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(692, 1, 24, 613, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(693, 1, 24, 607, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23');
INSERT INTO `user_answers` (`id`, `user_id`, `quiz_id`, `question_id`, `selected_answer`, `is_correct`, `session_id`, `answered_at`) VALUES
(694, 1, 24, 620, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(695, 1, 24, 615, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(696, 1, 24, 604, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(697, 1, 24, 603, 'B', 1, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(698, 1, 24, 616, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(699, 1, 24, 618, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(700, 1, 24, 621, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(701, 1, 24, 606, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(702, 1, 24, 612, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(703, 1, 24, 605, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(704, 1, 24, 614, 'B', 1, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(705, 1, 24, 610, 'B', 1, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(706, 1, 24, 611, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(707, 1, 24, 602, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(708, 1, 24, 619, 'B', 0, 'quiz_681d9c8ba177f8.15696462', '2025-05-09 06:11:23'),
(709, 1, 4, 194, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:49'),
(710, 1, 4, 187, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:49'),
(711, 1, 4, 195, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:49'),
(712, 1, 4, 202, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:49'),
(713, 1, 4, 182, 'A', 0, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:49'),
(714, 1, 4, 200, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(715, 1, 4, 190, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(716, 1, 4, 196, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(717, 1, 4, 192, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(718, 1, 4, 201, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(719, 1, 4, 191, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(720, 1, 4, 193, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(721, 1, 4, 188, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(722, 1, 4, 185, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:50'),
(723, 1, 4, 183, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(724, 1, 4, 198, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(725, 1, 4, 184, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(726, 1, 4, 199, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(727, 1, 4, 197, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(728, 1, 4, 189, 'A', 1, 'quiz_681d9ce1762199.08728013', '2025-05-09 06:12:51'),
(729, 1, 1, 136, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(730, 1, 1, 132, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(731, 1, 1, 139, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(732, 1, 1, 122, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(733, 1, 1, 137, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(734, 1, 1, 128, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(735, 1, 1, 129, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(736, 1, 1, 125, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(737, 1, 1, 131, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(738, 1, 1, 140, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(739, 1, 1, 130, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(740, 1, 1, 135, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(741, 1, 1, 126, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(742, 1, 1, 121, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(743, 1, 1, 124, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(744, 1, 1, 123, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(745, 1, 1, 134, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(746, 1, 1, 133, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(747, 1, 1, 138, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(748, 1, 1, 127, 'B', 0, 'quiz_681da720be1a05.07748562', '2025-05-09 06:56:32'),
(749, 1, 1, 132, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(750, 1, 1, 136, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(751, 1, 1, 122, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(752, 1, 1, 134, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(753, 1, 1, 123, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(754, 1, 1, 127, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(755, 1, 1, 126, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(756, 1, 1, 137, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(757, 1, 1, 131, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(758, 1, 1, 121, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(759, 1, 1, 125, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(760, 1, 1, 140, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(761, 1, 1, 130, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(762, 1, 1, 135, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(763, 1, 1, 128, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(764, 1, 1, 138, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(765, 1, 1, 129, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(766, 1, 1, 139, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(767, 1, 1, 133, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(768, 1, 1, 124, 'B', 0, 'quiz_681da85b75bea6.03802068', '2025-05-09 07:01:47'),
(769, 1, 1, 133, 'A', 1, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(770, 1, 1, 123, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(771, 1, 1, 124, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(772, 1, 1, 126, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(773, 1, 1, 122, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(774, 1, 1, 139, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(775, 1, 1, 136, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(776, 1, 1, 130, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(777, 1, 1, 137, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(778, 1, 1, 125, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(779, 1, 1, 135, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(780, 1, 1, 128, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(781, 1, 1, 140, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(782, 1, 1, 131, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(783, 1, 1, 127, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(784, 1, 1, 138, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(785, 1, 1, 129, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(786, 1, 1, 132, 'B', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(787, 1, 1, 121, 'C', 0, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(788, 1, 1, 134, 'A', 1, 'quiz_681daed123ff13.04939125', '2025-05-09 07:29:21'),
(789, 1, 1, 133, 'A', 1, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(790, 1, 1, 121, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(791, 1, 1, 131, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(792, 1, 1, 136, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(793, 1, 1, 135, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(794, 1, 1, 129, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(795, 1, 1, 134, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(796, 1, 1, 138, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(797, 1, 1, 122, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(798, 1, 1, 123, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(799, 1, 1, 126, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(800, 1, 1, 127, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(801, 1, 1, 140, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(802, 1, 1, 128, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(803, 1, 1, 130, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(804, 1, 1, 132, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(805, 1, 1, 139, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(806, 1, 1, 125, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(807, 1, 1, 124, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(808, 1, 1, 137, 'B', 0, 'quiz_681dd7837bb0d6.43853248', '2025-05-09 10:22:59'),
(809, 1, 1, 133, 'A', 1, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(810, 1, 1, 121, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(811, 1, 1, 131, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(812, 1, 1, 136, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(813, 1, 1, 135, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(814, 1, 1, 129, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(815, 1, 1, 134, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(816, 1, 1, 138, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(817, 1, 1, 122, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(818, 1, 1, 123, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(819, 1, 1, 126, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(820, 1, 1, 127, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(821, 1, 1, 140, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(822, 1, 1, 128, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(823, 1, 1, 130, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(824, 1, 1, 132, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:22:59'),
(825, 1, 1, 139, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:23:00'),
(826, 1, 1, 125, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:23:00'),
(827, 1, 1, 124, 'B', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:23:00'),
(828, 1, 1, 137, 'C', 0, 'quiz_681dd783e9c999.08935830', '2025-05-09 10:23:00'),
(829, 1, 1, 133, 'A', 1, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(830, 1, 1, 121, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(831, 1, 1, 131, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(832, 1, 1, 136, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(833, 1, 1, 135, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(834, 1, 1, 129, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(835, 1, 1, 134, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(836, 1, 1, 138, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(837, 1, 1, 122, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(838, 1, 1, 123, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(839, 1, 1, 126, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(840, 1, 1, 127, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(841, 1, 1, 140, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(842, 1, 1, 128, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(843, 1, 1, 130, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(844, 1, 1, 132, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(845, 1, 1, 139, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(846, 1, 1, 125, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(847, 1, 1, 124, 'B', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(848, 1, 1, 137, 'D', 0, 'quiz_681dd7840e8da1.36377281', '2025-05-09 10:23:00'),
(849, 1, 1, 124, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(850, 1, 1, 129, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(851, 1, 1, 130, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(852, 1, 1, 139, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(853, 1, 1, 140, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(854, 1, 1, 134, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(855, 1, 1, 126, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(856, 1, 1, 122, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(857, 1, 1, 133, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(858, 1, 1, 135, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(859, 1, 1, 128, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(860, 1, 1, 131, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(861, 1, 1, 127, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(862, 1, 1, 132, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(863, 1, 1, 136, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(864, 1, 1, 123, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(865, 1, 1, 121, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(866, 1, 1, 137, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(867, 1, 1, 125, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(868, 1, 1, 138, 'B', 0, 'quiz_681ddcd3256714.22038652', '2025-05-09 10:45:39'),
(869, 1, 1, 124, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(870, 1, 1, 129, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(871, 1, 1, 130, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(872, 1, 1, 139, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(873, 1, 1, 140, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(874, 1, 1, 134, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(875, 1, 1, 126, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(876, 1, 1, 122, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(877, 1, 1, 133, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(878, 1, 1, 135, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(879, 1, 1, 128, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(880, 1, 1, 131, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(881, 1, 1, 127, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(882, 1, 1, 132, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(883, 1, 1, 136, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(884, 1, 1, 123, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(885, 1, 1, 121, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(886, 1, 1, 137, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(887, 1, 1, 125, 'B', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(888, 1, 1, 138, 'C', 0, 'quiz_681ddcd6309bf4.07506049', '2025-05-09 10:45:42'),
(889, 1, 1, 129, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(890, 1, 1, 125, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(891, 1, 1, 122, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(892, 1, 1, 135, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(893, 1, 1, 128, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(894, 1, 1, 131, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(895, 1, 1, 121, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(896, 1, 1, 134, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(897, 1, 1, 137, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(898, 1, 1, 124, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(899, 1, 1, 123, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(900, 1, 1, 136, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(901, 1, 1, 133, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(902, 1, 1, 139, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(903, 1, 1, 140, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(904, 1, 1, 138, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(905, 1, 1, 126, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(906, 1, 1, 130, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(907, 1, 1, 132, 'B', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(908, 1, 1, 127, 'C', 0, 'quiz_681de05152ff27.79005546', '2025-05-09 11:00:33'),
(909, 1, 1, 133, 'A', 1, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(910, 1, 1, 132, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(911, 1, 1, 130, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(912, 1, 1, 128, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(913, 1, 1, 134, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(914, 1, 1, 126, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(915, 1, 1, 121, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(916, 1, 1, 136, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(917, 1, 1, 127, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(918, 1, 1, 137, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(919, 1, 1, 124, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(920, 1, 1, 131, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(921, 1, 1, 125, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(922, 1, 1, 135, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(923, 1, 1, 140, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(924, 1, 1, 123, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(925, 1, 1, 138, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(926, 1, 1, 139, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(927, 1, 1, 129, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(928, 1, 1, 122, 'D', 0, 'quiz_681de64acac493.83420419', '2025-05-09 11:26:02'),
(929, 1, 20, 530, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(930, 1, 20, 528, 'D', 1, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(931, 1, 20, 538, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(932, 1, 20, 527, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(933, 1, 20, 523, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(934, 1, 20, 533, 'D', 1, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(935, 1, 20, 536, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(936, 1, 20, 526, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(937, 1, 20, 540, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(938, 1, 20, 539, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(939, 1, 20, 537, 'C', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(940, 1, 20, 522, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(941, 1, 20, 524, 'D', 1, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(942, 1, 20, 531, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(943, 1, 20, 534, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(944, 1, 20, 535, 'A', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(945, 1, 20, 529, 'D', 1, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(946, 1, 20, 525, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(947, 1, 20, 521, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(948, 1, 20, 532, 'D', 0, 'quiz_681de7c189a4a9.15262561', '2025-05-09 11:32:17'),
(989, 17, 2, 151, 'D', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(990, 17, 2, 147, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(991, 17, 2, 143, 'A', 1, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(992, 17, 2, 145, 'A', 1, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(993, 17, 2, 150, 'D', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(994, 17, 2, 157, 'D', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(995, 17, 2, 154, 'A', 1, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(996, 17, 2, 153, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(997, 17, 2, 144, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(998, 17, 2, 148, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(999, 17, 2, 142, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1000, 17, 2, 155, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1001, 17, 2, 160, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1002, 17, 2, 141, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1003, 17, 2, 159, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1004, 17, 2, 149, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1005, 17, 2, 146, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1006, 17, 2, 152, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1007, 17, 2, 156, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1008, 17, 2, 158, 'B', 0, 'quiz_682032fe9f2328.54474973', '2025-05-11 05:17:50'),
(1009, 17, 4, 202, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1010, 17, 4, 185, 'A', 1, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1011, 17, 4, 186, 'A', 1, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1012, 17, 4, 195, 'D', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1013, 17, 4, 201, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1014, 17, 4, 194, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1015, 17, 4, 196, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1016, 17, 4, 193, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1017, 17, 4, 187, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1018, 17, 4, 184, 'C', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1019, 17, 4, 182, 'C', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1020, 17, 4, 190, 'A', 1, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1021, 17, 4, 188, 'C', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1022, 17, 4, 200, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1023, 17, 4, 189, 'C', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1024, 17, 4, 199, 'C', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1025, 17, 4, 192, 'C', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1026, 17, 4, 183, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1027, 17, 4, 191, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1028, 17, 4, 198, 'B', 0, 'quiz_68204c225eeb43.03308791', '2025-05-11 07:05:06'),
(1029, 17, 4, 187, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1030, 17, 4, 190, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1031, 17, 4, 186, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1032, 17, 4, 196, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1033, 17, 4, 198, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1034, 17, 4, 202, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1035, 17, 4, 184, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1036, 17, 4, 197, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1037, 17, 4, 194, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1038, 17, 4, 182, 'A', 0, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1039, 17, 4, 201, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1040, 17, 4, 195, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1041, 17, 4, 183, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1042, 17, 4, 200, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1043, 17, 4, 185, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1044, 17, 4, 193, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1045, 17, 4, 191, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1046, 17, 4, 189, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1047, 17, 4, 199, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1048, 17, 4, 192, 'A', 1, 'quiz_68204ff068d275.66475834', '2025-05-11 07:21:20'),
(1049, 18, 1, 135, 'A', 1, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1050, 18, 1, 140, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1051, 18, 1, 126, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1052, 18, 1, 133, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1053, 18, 1, 130, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1054, 18, 1, 132, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1055, 18, 1, 137, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1056, 18, 1, 139, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1057, 18, 1, 131, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1058, 18, 1, 125, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1059, 18, 1, 123, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1060, 18, 1, 127, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1061, 18, 1, 136, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1062, 18, 1, 129, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1063, 18, 1, 122, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1064, 18, 1, 128, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1065, 18, 1, 138, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1066, 18, 1, 134, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1067, 18, 1, 124, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1068, 18, 1, 121, 'B', 0, 'quiz_68207b693a8559.19709876', '2025-05-11 10:26:49'),
(1069, 18, 2, 143, 'A', 1, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1070, 18, 2, 146, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1071, 18, 2, 151, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1072, 18, 2, 155, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1073, 18, 2, 145, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1074, 18, 2, 141, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1075, 18, 2, 142, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1076, 18, 2, 148, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1077, 18, 2, 153, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1078, 18, 2, 154, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1079, 18, 2, 147, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1080, 18, 2, 160, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1081, 18, 2, 159, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1082, 18, 2, 152, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1083, 18, 2, 149, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1084, 18, 2, 156, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1085, 18, 2, 157, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1086, 18, 2, 158, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1087, 18, 2, 150, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1088, 18, 2, 144, 'B', 0, 'quiz_68207d6f83f485.43309485', '2025-05-11 10:35:27'),
(1089, 17, 2, 147, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1090, 17, 2, 158, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1091, 17, 2, 160, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1092, 17, 2, 149, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1093, 17, 2, 159, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1094, 17, 2, 144, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1095, 17, 2, 141, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1096, 17, 2, 151, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1097, 17, 2, 146, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1098, 17, 2, 153, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1099, 17, 2, 156, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1100, 17, 2, 143, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1101, 17, 2, 150, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1102, 17, 2, 145, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1103, 17, 2, 154, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1104, 17, 2, 157, 'B', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1105, 17, 2, 148, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1106, 17, 2, 155, 'A', 1, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1107, 17, 2, 142, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1108, 17, 2, 152, 'C', 0, 'quiz_6820aabf6ff328.50690038', '2025-05-11 13:48:47'),
(1109, 17, 4, 182, 'A', 0, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1110, 17, 4, 198, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1111, 17, 4, 193, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1112, 17, 4, 202, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1113, 17, 4, 197, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1114, 17, 4, 192, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1115, 17, 4, 196, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1116, 17, 4, 186, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1117, 17, 4, 200, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1118, 17, 4, 190, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1119, 17, 4, 184, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1120, 17, 4, 183, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1121, 17, 4, 185, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1122, 17, 4, 188, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1123, 17, 4, 191, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1124, 17, 4, 195, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1125, 17, 4, 201, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1126, 17, 4, 187, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1127, 17, 4, 199, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1128, 17, 4, 189, 'A', 1, 'quiz_6821349a9e5417.71765564', '2025-05-11 23:36:58'),
(1129, 17, 5, 214, 'A', 1, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1130, 17, 5, 221, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1131, 17, 5, 210, 'C', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1132, 17, 5, 213, 'D', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1133, 17, 5, 208, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1134, 17, 5, 207, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1135, 17, 5, 219, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1136, 17, 5, 209, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1137, 17, 5, 206, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1138, 17, 5, 204, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1139, 17, 5, 211, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1140, 17, 5, 216, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1141, 17, 5, 217, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1142, 17, 5, 203, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1143, 17, 5, 220, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1144, 17, 5, 212, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1145, 17, 5, 215, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1146, 17, 5, 218, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08'),
(1147, 17, 5, 205, 'B', 0, 'quiz_682b51144c30b3.75568079', '2025-05-19 15:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_performance`
--

CREATE TABLE `user_performance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_contents`
--
ALTER TABLE `course_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_ratings`
--
ALTER TABLE `course_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rating` (`course_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ip_email` (`ip`,`email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_token` (`token`);

--
-- Indexes for table `progression`
--
ALTER TABLE `progression`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`course_id`,`chapter_id`);

--
-- Indexes for table `progression_utilisateur`
--
ALTER TABLE `progression_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `fk_quiz_results_user` (`user_id`);

--
-- Indexes for table `security_logs`
--
ALTER TABLE `security_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timestamp_idx` (`timestamp`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `fk_user_answers_user` (`user_id`);

--
-- Indexes for table `user_performance`
--
ALTER TABLE `user_performance`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `course_contents`
--
ALTER TABLE `course_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_ratings`
--
ALTER TABLE `course_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progression`
--
ALTER TABLE `progression`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `progression_utilisateur`
--
ALTER TABLE `progression_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=622;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `security_logs`
--
ALTER TABLE `security_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1148;

--
-- AUTO_INCREMENT for table `user_performance`
--
ALTER TABLE `user_performance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD CONSTRAINT `course_enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_ratings`
--
ALTER TABLE `course_ratings`
  ADD CONSTRAINT `course_ratings_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `fk_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);

--
-- Constraints for table `security_logs`
--
ALTER TABLE `security_logs`
  ADD CONSTRAINT `security_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
