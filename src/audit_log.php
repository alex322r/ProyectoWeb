<?php

function log_audit(PDO $pdo, int $userId, string $action, ?int $targetId = null, ?string $targetType = null, ?array $details = null) {
    try {
        $stmt = $pdo->prepare(
            "INSERT INTO audit_logs (user_id, action, target_id, target_type, details) VALUES (?, ?, ?, ?, ?)"
        );
        $stmt->execute([
            $userId,
            $action,
            $targetId,
            $targetType,
            $details ? json_encode($details) : null
        ]);
    } catch (PDOException $e) {
        // Log the error, but don't block the user
        error_log("Error logging audit event: " . $e->getMessage());
    }
}
