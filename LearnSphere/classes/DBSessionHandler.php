<?php
class DBSessionHandler implements SessionHandlerInterface {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function open($savePath, $sessionName): bool {
        return true;
    }

    public function close(): bool {
        return true;
    }

    public function read($id): string|false {
        try {
            $stmt = $this->db->prepare("SELECT data FROM sessions WHERE id = ?");
            $stmt->execute([$id]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result ? $result['data'] : '';
        } catch (PDOException $e) {
            error_log("Session read error: " . $e->getMessage());
            return '';
        }
    }

    public function write($id, $data): bool {
        try {
            $stmt = $this->db->prepare("REPLACE INTO sessions (id, data, timestamp) VALUES (?, ?, ?)");
            return $stmt->execute([$id, $data, time()]);
        } catch (PDOException $e) {
            error_log("Session write error: " . $e->getMessage());
            return false;
        }
    }

    public function destroy($id): bool {
        try {
            $stmt = $this->db->prepare("DELETE FROM sessions WHERE id = ?");
            return $stmt->execute([$id]);
        } catch (PDOException $e) {
            error_log("Session destroy error: " . $e->getMessage());
            return false;
        }
    }

    public function gc($maxlifetime): int|false {
        try {
            $stmt = $this->db->prepare("DELETE FROM sessions WHERE timestamp < ?");
            $stmt->execute([time() - $maxlifetime]);
            return $stmt->rowCount();
        } catch (PDOException $e) {
            error_log("Session gc error: " . $e->getMessage());
            return false;
        }
    }
}