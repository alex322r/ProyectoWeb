<?php 
ini_set('error_log', '/home/alexis/error.log');
session_start();

// Set the default timezone for the application
$config_file = __DIR__ . '/../storage/config.json';
$default_timezone = 'UTC'; // Fallback timezone
$views_config = [];

if (file_exists($config_file)) {
    $config_content = file_get_contents($config_file);
    $config = json_decode($config_content, true);
    if (isset($config['timezone']) && !empty($config['timezone'])) {
        $default_timezone = $config['timezone'];
    }
    if (isset($config['views'])) {
        $views_config = $config['views'];
    }
}
date_default_timezone_set($default_timezone);

$maintenance_flag_file = __DIR__ . '/../storage/maintenance.flag';

if (file_exists($maintenance_flag_file)) {
    // Allow administrators to access the site
    if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'administrador') {
        require __DIR__ . '/../views/maintenance.php';
        exit();
    }
}

require __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../src/audit_log.php';


function view($name, $data = []) {

  extract($data);

  if ($name === 'login') {
    require __DIR__ . "/../views/login.php";
    return;
  }

  if ($name === 'home') {
    require __DIR__ . "/../views/home.php";
    return;
  }

  if ($name === 'inactive_account') {
    require __DIR__ . "/../views/inactive_account.php";
    return;
  }

  ob_start();
  require __DIR__ . "/../views/{$name}.php";

  $content = ob_get_clean();

  require __DIR__ . "/../views/layout.php";

}

use Bramus\Router\Router;
use App\Controllers\MonitorController;
use App\Controllers\AuthController; //
use App\Controllers\DashboardController;
use App\Controllers\PacienteController;
use App\Controllers\EmpleadoController;
use App\Controllers\ConfiguracionController;
use App\Controllers\BackupController;
use App\Controllers\ReportesController;
use App\Controllers\PlanesController;
use App\Controllers\AgendaController;
use App\Controllers\HistorialController;
use App\Controllers\PagoController;

$dsn = 'mysql:host=127.0.0.1;dbname=consultorio_psicologico';
$usuario = 'root';
$pass = '';
$options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];
try {
    $pdo = new PDO($dsn, $usuario, $pass, $options);
} catch (PDOException $e) {
    // Si la conexión falla, la BBDD está "caída"
    //echo json_encode(['estado' => 'offline', 'error' => $e->getMessage()]);
    die("Error" . $e->getMessage());
}

$router = new Router();

$router->get('/', function() {

  view('home', [
    'titulo' => 'Pagina de Inicio'
  ]);

});

$authController = new AuthController($pdo);
$monitorController = new MonitorController($pdo);
$pacienteController = new PacienteController($pdo);
$empleadoController = new EmpleadoController($pdo);
$dashboardController = new DashboardController($pdo);
$configuracionController = new ConfiguracionController($pdo);
$backupController = new BackupController($pdo);
$reportesController = new ReportesController($pdo);
$planesController = new PlanesController($pdo);
$agendaController = new AgendaController($pdo);
$historialController = new HistorialController($pdo);
$pagoController = new PagoController($pdo);

// --- RUTAS PÚBLICAS (No requieren login) ---
$router->before('GET', '/login', function() {
    if (isset($_SESSION['user_id'])) {
        header('Location: /dashboard');
        exit();
    }
});
$router->get('/login', [$authController, 'showLoginForm']);
$router->post('/login', [$authController, 'handleLogin']);
$router->get('/logout', [$authController, 'logout']);

// Ruta para informar al usuario que su cuenta está inactiva
$router->get('/inactive-account', function() {
    view('inactive_account');
});

$router->get('/home', function() {
    view('home', [
        'titulo' => 'Página de Inicio'
    ]);
});

$router->get('/reportes', function() use ($reportesController) {
    $data = $reportesController->index();
    view('reportes', $data);
});

$router->get('/reportes/pacientes', function() use ($reportesController) {
    $data = $reportesController->pacientes();
    view('reportes_pacientes', $data);
});

$router->before('GET|POST', '/(dashboard|pacientes|pacientes/delete|agenda|pagos|planes|empleados|reportes|config|backup|api/.*|home|historial/.*)', function() use ($pdo) {
    // Si la variable de sesión 'user_id' no existe, lo botamos al login
    if (!isset($_SESSION['user_id'])) {
        header('Location: /login');
        exit(); // Detenemos la ejecución
    }

    try {
        // Actualizar la última actividad del usuario usando UTC para evitar problemas de zona horaria
        $stmt = $pdo->prepare("UPDATE empleado SET last_activity = UTC_TIMESTAMP() WHERE id_empleado = ?");
        $stmt->execute([$_SESSION['user_id']]);
    } catch (PDOException $e) {
        // Log the error, but don't block the user
        error_log("Error updating last_activity: " . $e->getMessage());
    }
});



$router->get('/dashboard', function() use ($dashboardController) {
    $data = $dashboardController->getDashboardData();
    view('dashboard', $data);
});

$router->get('/pagos', [$pagoController, 'index']);

$router->get('/historial/buscar', function() use ($historialController) {
    $historialController->index();
});


if ($views_config['registros']) {
    $router->get('/registros', function() use ($monitorController) {
        $data = $monitorController->getApplicationLogs();
        view('registros', $data);
    });
}

$router->get('/configuracion', function() use ($configuracionController) {
    $data = $configuracionController->index();
    view('configuracion', $data);
});

$router->post('/configuracion/maintenance/enable', function() use ($configuracionController) {
    $configuracionController->enableMaintenanceMode();
});

$router->post('/configuracion/maintenance/disable', function() use ($configuracionController) {
    $configuracionController->disableMaintenanceMode();
});

$router->post('/configuracion/timezone/update', [$configuracionController, 'updateTimezone']);
$router->post('/configuracion/features/update', [$configuracionController, 'updateFeatures']);
$router->post('/configuracion/views/update', [$configuracionController, 'updateViews']);

$router->get('/backup', function() use ($backupController) {
    $data = $backupController->index();
    view('backup', $data);
});

$router->post('/backup/create', [$backupController, 'create']);
$router->get('/backup/download/(.*)', [$backupController, 'download']);
$router->get('/backup/delete/(.*)', [$backupController, 'delete']);

// users administration

if ($views_config['empleados']) {
    $router->get('/empleados', function() use ($empleadoController) {
        $empleados = $empleadoController->listar();
        view('empleados', [
            'paginaActiva' => 'empleados',
            'empleados'=> $empleados
        ]);
    });

    $router->post('/empleados/crear', function() use ($empleadoController) {
        $empleadoController->crear();
    });

    $router->post('/empleados/eliminar/(\d+)', function($id) use ($empleadoController) {
        $empleadoController->eliminar($id);
    });

    $router->post('/empleados/inactivar/(\d+)', function($id) use ($empleadoController) {
        $empleadoController->inactivar($id);
    });

    $router->post('/empleados/activar/(\d+)', function($id) use ($empleadoController) {
        $empleadoController->activar($id);
    });

    $router->post('/empleados/editar/(\d+)', function($id) use ($empleadoController) {
        $empleadoController->editar($id);
    });

    $router->get('/empleados/ver/(\d+)', function($id) use ($empleadoController) {
        $empleadoController->ver($id);
    });

    $router->get('/empleados/listar', function() use ($empleadoController) {
    });
}

if ($views_config['planes']) {
    $router->get('/planes', function() use ($planesController) {
        $planes = $planesController->listar();
        view('planes', [
            'paginaActiva' => 'planes',
            'planes'=> $planes
        ]);
    });

    $router->post('/planes/crear', function() use ($planesController) {
        $planesController->crear();
    });

    $router->post('/planes/editar/(\d+)', function($id) use ($planesController) {
        $planesController->editar($id);
    });

    $router->post('/planes/eliminar/(\d+)', function($id) use ($planesController) {
        $planesController->eliminar($id);
    });

    $router->get('/planes/obtener/(\d+)', function($id) use ($planesController) {
        $planesController->obtener($id);
    });

    $router->post('/planes/activar/(\d+)', function($id) use ($planesController) {
        $planesController->activar($id);
    });

    $router->post('/planes/inactivar/(\d+)', function($id) use ($planesController) {
        $planesController->inactivar($id);
    });
}

if ($views_config['pacientes']) {
    $router->get('/pacientes', function() use ($pacienteController) {
        $pacientes = $pacienteController->listar();
        view('pacientes', [
            'titulo' => 'Pacientes',
            'pacientes' => $pacientes,
            'paginaActiva' => 'pacientes'
        ]);
    });

    $router->post('/pacientes/crear', function() use ($pacienteController) {
        $pacienteController->crear();
    });

    $router->get('/api/pacientes/buscar', function() use ($pacienteController) {
        $pacienteController->buscar();
    });

    $router->get('/pacientes/ver/(\d+)', function($id) use ($pacienteController) {
        $pacienteController->ver($id);
    });

    $router->before('GET', '/pacientes/expediente/(\d+)', function() {
        if (!isset($_SESSION['user_role']) || ($_SESSION['user_role'] !== 'psicologo' && $_SESSION['user_role'] !== 'administrador')) {
            header('Location: /dashboard');
            exit();
        }
    });
    $router->get('/pacientes/expediente/(\d+)', function($id) use ($pacienteController) {
        $pacienteController->verExpediente($id);
    });

    $router->post('/pacientes/expediente/(\d+)', function($id) use ($pacienteController) {
        $pacienteController->guardarExpediente($id);
    });

    $router->post('/pacientes/actualizarEstado', function() use ($pacienteController) {
        $pacienteController->actualizarEstado();
    });

    $router->post('/pacientes/eliminar/(\d+)', function($id) use ($pacienteController) {
        $pacienteController->eliminar($id);
    });

}


if ($views_config['citas']) {
    $router->get('/citas', [$agendaController, 'citas']);
}

if ($views_config['agenda']) {
    $router->get('/agenda', function() use ($agendaController) {
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'psicologo') {
            header('Location: /dashboard');
            exit();
        }
        $agendaController->index();
    });
    $router->get('/api/citas', function() use ($agendaController) {
        $agendaController->getAppointments();
    });
    $router->post('/api/citas/create', function() use ($agendaController) {
        $agendaController->create();
    });
    $router->post('/api/citas/update/(\d+)', function($id) use ($agendaController) {
        $agendaController->update($id);
    });
    $router->post('/api/citas/cancel/(\d+)', function($id) use ($agendaController) {
        $agendaController->cancel($id);
    });
    $router->post('/api/citas/delete/(\d+)', function($id) use ($agendaController) {
        $agendaController->delete($id);
    });
    $router->get('/api/citas/(\d+)', function($id) use ($agendaController) {
        $agendaController->get($id);
    });
}

$router->get('/api/empleados/online', [$empleadoController, 'getOnlineUsers']);
$router->get('/api/system-status', [$monitorController, 'getSystemStatus']);
$router->get('/api/empleados/nuevos', [$empleadoController, 'getNewUsers']);
$router->get('/api/empleados/listar/psicologo', [$empleadoController, 'listarPsicologos']);
$router->get('/api/auth/failed-logins', [$authController, 'getFailedLoginAttempts']);
$router->get('/api/pagos/deudas/(\d+)', function($id) use ($pagoController) {
    $pagoController->deudas($id);
});
$router->get('/api/pagos/historial/(\d+)', function($id) use ($pagoController) {
    $pagoController->historial($id);
});
$router->post('/api/pagos/crear', function() use ($pagoController) {
    $pagoController->crear();
});
$router->post('/api/pagos/registrar', function() use ($pagoController) {
    $pagoController->registrarPago();
});

$router->run(function() use ($pdo) {
    try {
        $stmt = $pdo->prepare("INSERT INTO access_logs (ip_address, user_agent, request_method, request_uri, response_status) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([
            $_SERVER['REMOTE_ADDR'],
            $_SERVER['HTTP_USER_AGENT'],
            $_SERVER['REQUEST_METHOD'],
            $_SERVER['REQUEST_URI'],
            http_response_code()
        ]);
    } catch (PDOException $e) {
        // Log the error, but don't block the user
        error_log("Error logging access: " . $e->getMessage());
    }
});
