<?php 
session_start();

require __DIR__ . '/../vendor/autoload.php';


function view($name, $data = []) {

  extract($data);

  if ($name === 'login') {
        require __DIR__ . "/../views/login.php";
        return; // Detenemos aquí
  }

  ob_start();


  require __DIR__ . "/../views/{$name}.php";

  $content = ob_get_clean();

  require __DIR__ . "/../views/layout.php";

}

use Bramus\Router\Router;
use App\Controllers\MonitorController;
use App\Controllers\AuthController; //


$dsn = 'mysql:host=127.0.0.1;dbname=consultorio_psicologico';
$usuario = 'usuario_monitor';
$pass = '123456';

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


// --- RUTAS PÚBLICAS (No requieren login) ---
$router->get('/login', [$authController, 'showLoginForm']);
$router->post('/login', [$authController, 'handleLogin']);
$router->get('/logout', [$authController, 'logout']);

$router->before('GET|POST', '/(dashboard|pacientes|agenda|pagos|planes|empleados|reportes|config|api/.*)', function() {
    // Si la variable de sesión 'user_id' no existe, lo botamos al login
    if (!isset($_SESSION['user_id'])) {
        header('Location: /login');
        exit(); // Detenemos la ejecución
    }
});



$router->get('/dashboard', function() use ($pdo) {
    // Aquí deberías llamar a un controlador, ej. DashboardController
    // Y pasarle datos de la BD
    
    // $dashboardController = new DashboardController($pdo);
    // $data = $dashboardController->getDashboardData();
    
    // view('dashboard', $data);
    
    // Por ahora, solo llamamos a la vista:
    view('dashboard', [
        'titulo' => 'Dashboard',
        'citasHoy' => 12, // Dato de ejemplo
        'ingresosDia' => 1220 // Dato de ejemplo
    ]);
});

$router->get('/pacientes', function() use ($pdo) {
    // Aquí deberías llamar a un controlador, ej. DashboardController
    // Y pasarle datos de la BD
    
    // $dashboardController = new DashboardController($pdo);
    // $data = $dashboardController->getDashboardData();
    
    // view('dashboard', $data);
    
    // Por ahora, solo llamamos a la vista:
    view('pacientes', [
        'titulo' => 'Pacientes'
    ]);
});

$router->get('/api/db-status', function() use ($pdo) {
    // Creamos la instancia del controlador y le pasamos la conexión
    $controller = $monitorController;
    // Llamamos al método que maneja la ruta
    $controller->getStatus();
});

$router->run();
