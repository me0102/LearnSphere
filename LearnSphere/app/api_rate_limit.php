<?php
function rateLimit($ip, $limit = 100, $window = 60) {
    $file = __DIR__ . '/../logs/ratelimit_' . md5($ip) . '.log';
    $now = time();
    $data = ['count' => 1, 'start' => $now];
    if (file_exists($file)) {
        $data = json_decode(file_get_contents($file), true);
        if ($now - $data['start'] < $window) {
            $data['count']++;
        } else {
            $data = ['count' => 1, 'start' => $now];
        }
    }
    file_put_contents($file, json_encode($data));
    if ($data['count'] > $limit) {
        http_response_code(429);
        exit('Trop de requêtes, réessayez plus tard.');
    }
} 