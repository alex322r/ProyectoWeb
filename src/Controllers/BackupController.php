<?php

namespace App\Controllers;

use PDO;

class BackupController
{
    private $pdo;
    private $backup_dir;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
        $this->backup_dir = __DIR__ . '/../../storage/backups';
    }

    public function index()
    {
        $backups = [];
        if (is_dir($this->backup_dir)) {
            $files = scandir($this->backup_dir, SCANDIR_SORT_DESCENDING);
            foreach ($files as $file) {
                if ($file !== '.' && $file !== '..' && $file !== '.gitignore') {
                    $backups[] = $file;
                }
            }
        }

        return [
            'titulo' => 'Copias de Seguridad',
            'paginaActiva' => 'backup',
            'backups' => $backups
        ];
    }

    public function create()
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        $db_name = 'consultorio_psicologico';
        $db_user = 'root';
        $db_pass = '';
        $db_host = '127.0.0.1';

        $backup_file = $this->backup_dir . '/backup_' . date('Y-m-d_H-i-s') . '.sql';

        $command = "mysqldump --user={$db_user} --password={$db_pass} --host={$db_host} {$db_name} > {$backup_file}";

        exec($command, $output, $return_var);

        if ($return_var === 0) {
            log_audit($this->pdo, $_SESSION['user_id'], 'create_backup', null, null, ['file' => basename($backup_file)]);
        } else {
            // Log error
            error_log("Error creating backup: " . implode("\n", $output));
        }

        header('Location: /backup');
    }

    public function download($filename)
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        $filepath = $this->backup_dir . '/' . $filename;

        if (file_exists($filepath)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($filepath) . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($filepath));
            readfile($filepath);
            exit;
        } else {
            // File not found
            header('Location: /backup');
        }
    }

    public function delete($filename)
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        $filepath = $this->backup_dir . '/' . $filename;

        if (file_exists($filepath)) {
            unlink($filepath);
            log_audit($this->pdo, $_SESSION['user_id'], 'delete_backup', null, null, ['file' => $filename]);
        }

        header('Location: /backup');
    }
}
