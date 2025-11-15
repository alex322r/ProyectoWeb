<?php

namespace App\Controllers;

use PDO;
use DateTimeZone;

class ConfiguracionController
{
    private $pdo;
    private $maintenance_flag_file;
    private $config_file;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
        $this->maintenance_flag_file = __DIR__ . '/../../storage/maintenance.flag';
        $this->config_file = __DIR__ . '/../../storage/config.json';
    }

    public function index()
    {
        $maintenance_mode_status = file_exists($this->maintenance_flag_file);

        $current_timezone = 'UTC';
        $features = ['allow_new_user_registration' => false];
        $views = [];
        if (file_exists($this->config_file)) {
            $config_content = file_get_contents($this->config_file);
            $config = json_decode($config_content, true);
            if (isset($config['timezone'])) {
                $current_timezone = $config['timezone'];
            }
            if (isset($config['features'])) {
                $features = $config['features'];
            }
            if (isset($config['views'])) {
                $views = $config['views'];
            }
        }

        $timezones = DateTimeZone::listIdentifiers(DateTimeZone::ALL);

        return [
            'titulo' => 'Configuración del Sistema',
            'paginaActiva' => 'configuracion',
            'maintenance_mode_status' => $maintenance_mode_status,
            'current_timezone' => $current_timezone,
            'timezones' => $timezones,
            'features' => $features,
            'views' => $views
        ];
    }

    public function updateFeatures()
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        $config = [];
        if (file_exists($this->config_file)) {
            $config_content = file_get_contents($this->config_file);
            $config = json_decode($config_content, true);
        }

        $allow_registration = isset($_POST['allow_new_user_registration']) && $_POST['allow_new_user_registration'] == '1';
        $config['features']['allow_new_user_registration'] = $allow_registration;

        file_put_contents($this->config_file, json_encode($config, JSON_PRETTY_PRINT));
        log_audit($this->pdo, $_SESSION['user_id'], 'update_features', null, null, ['allow_new_user_registration' => $allow_registration]);

        header('Location: /configuracion');
    }

    public function updateTimezone()
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        if (isset($_POST['timezone'])) {
            $new_timezone = $_POST['timezone'];
            if (in_array($new_timezone, DateTimeZone::listIdentifiers(DateTimeZone::ALL))) {
                $config = [];
                if (file_exists($this->config_file)) {
                    $config_content = file_get_contents($this->config_file);
                    $config = json_decode($config_content, true);
                }
                $config['timezone'] = $new_timezone;
                file_put_contents($this->config_file, json_encode($config, JSON_PRETTY_PRINT));
                log_audit($this->pdo, $_SESSION['user_id'], 'update_timezone', null, null, ['new_timezone' => $new_timezone]);
            }
        }

        header('Location: /configuracion');
    }

    public function enableMaintenanceMode()
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        touch($this->maintenance_flag_file);
        log_audit($this->pdo, $_SESSION['user_id'], 'enable_maintenance_mode');
        header('Location: /configuracion');
    }

    public function disableMaintenanceMode()
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        if (file_exists($this->maintenance_flag_file)) {
            unlink($this->maintenance_flag_file);
        }
        log_audit($this->pdo, $_SESSION['user_id'], 'disable_maintenance_mode');
        header('Location: /configuracion');
    }

    public function updateViews()
    {
        session_start();
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
            header('Location: /login');
            exit();
        }

        $config = [];
        if (file_exists($this->config_file)) {
            $config_content = file_get_contents($this->config_file);
            $config = json_decode($config_content, true);
        }

        $views_status = [];
        if (isset($_POST['views']) && is_array($_POST['views'])) {
            foreach ($config['views'] as $view_name => $old_value) {
                $views_status[$view_name] = isset($_POST['views'][$view_name]);
            }
        }
        
        $config['views'] = $views_status;

        file_put_contents($this->config_file, json_encode($config, JSON_PRETTY_PRINT));
        log_audit($this->pdo, $_SESSION['user_id'], 'update_views', null, null, $views_status);

        header('Location: /configuracion');
    }
}
