<?php

namespace App\Controllers;

use App\Config;
use PDO;
use PDOException;

class SetupController
{
    public function index()
    {
        if (file_exists(__DIR__ . '/../../storage/installed.lock')) {
            header('Location: /login');
            exit;
        }
        require __DIR__ . '/../../views/setup.php';
    }

    public function install()
    {
        if (file_exists(__DIR__ . '/../../storage/installed.lock')) {
            header('Location: /login');
            exit;
        }

        $db_host = $_POST['db_host'] ?? 'localhost';
        $db_name = $_POST['db_name'] ?? 'consultorio_psicologico';
        $db_user = $_POST['db_user'] ?? 'root';
        $db_pass = $_POST['db_pass'] ?? '';

        $admin_nombres = $_POST['admin_nombres'];
        $admin_apellidos = $_POST['admin_apellidos'];
        $admin_user = $_POST['admin_user'];
        $admin_pass = $_POST['admin_pass'];
        $admin_email = $_POST['admin_email'];

        if (empty($admin_user) || empty($admin_pass)) {
            $error = "Usuario y contraseña de administrador son requeridos.";
            require __DIR__ . '/../../views/setup.php';
            return;
        }

        try {
            // 1. Connect and Create DB
            $pdo = new PDO("mysql:host=$db_host;port=3306;charset=utf8mb4", $db_user, $db_pass, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_MULTI_STATEMENTS => true
            ]);
            
            $pdo->exec("CREATE DATABASE IF NOT EXISTS `$db_name`");
            $pdo->exec("USE `$db_name`");

            // 2. Import SQL
            $sql_file = __DIR__ . '/../../consultorio_psicologico.sql';
            if (file_exists($sql_file)) {
                $sql = file_get_contents($sql_file);
                
                // Preprocess SQL to remove comments that might cause issues with PDO
                $lines = explode("\n", $sql);
                $clean_sql = "";
                foreach ($lines as $line) {
                    $trimLine = trim($line);
                    if (empty($trimLine) || strpos($trimLine, '--') === 0 || strpos($trimLine, '/*M!') === 0) {
                        continue;
                    }
                    $clean_sql .= $line . "\n";
                }
                
                $pdo->exec($clean_sql);
            } else {
                throw new \Exception("Archivo SQL base no encontrado.");
            }

            // Run migrations
            $migrations_dir = __DIR__ . '/../../migrations/';
            if (is_dir($migrations_dir)) {
                $migrations = glob($migrations_dir . '*.sql');
                sort($migrations);
                foreach ($migrations as $migration) {
                    $sql_mig = file_get_contents($migration);
                    try {
                        $pdo->exec($sql_mig);
                    } catch (\PDOException $e) {
                        // Continue if already exists (naive migration handling)
                    }
                }
            }

            // 3. Create Admin
            // Check if admin exists to avoid duplicates if re-running partial install
            $stmt = $pdo->prepare("SELECT count(*) FROM empleado WHERE usuario = ?");
            $stmt->execute([$admin_user]);
            if ($stmt->fetchColumn() == 0) {
                // Insert Persona
                $stmt = $pdo->prepare("INSERT INTO persona (nombres, apellidos, email) VALUES (?, ?, ?)");
                $stmt->execute([$admin_nombres, $admin_apellidos, $admin_email]);
                $id_persona = $pdo->lastInsertId();

                // Hash password
                $hash = password_hash($admin_pass, PASSWORD_DEFAULT, ['cost' => 12]);

                // Insert Empleado
                $stmt = $pdo->prepare("INSERT INTO empleado (id_persona, rol, usuario, clave, estado) VALUES (?, 'administrador', ?, ?, 'activo')");
                $stmt->execute([$id_persona, $admin_user, $hash]);
            }

            // 4. Save Config
            $current_config = Config::all() ?: [];
            $new_config = array_merge($current_config, [
                'db' => [
                    'host' => $db_host,
                    'name' => $db_name,
                    'user' => $db_user,
                    'pass' => $db_pass
                ]
            ]);
            Config::write($new_config);

            // 5. Lock
            file_put_contents(__DIR__ . '/../../storage/installed.lock', 'INSTALLED');

            header('Location: /login?message=Instalación completada');
            exit;

        } catch (\Exception $e) {
            $error = "Error durante la instalación: " . $e->getMessage();
            require __DIR__ . '/../../views/setup.php';
            return;
        }
    }
}
