<?php
namespace App\Controllers;

use PDO;

class AuthController
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    // Muestra el formulario de login
    public function showLoginForm()
    {
        // Usamos la función global view() que ya tienes
        view('login', ['titulo' => 'Iniciar Sesión']);
    }

    // Procesa el intento de login
    public function handleLogin()
    {
        define('MAX_ATTEMPTS', 5);
        define('LOCKOUT_TIME', '15 minutes');
        // 1. Obtener datos del formulario
        $usuario = $_POST['usuario'] ?? null;
        $clave = $_POST['clave'] ?? null;

        if (!$usuario || !$clave) {
            header('Location: /login?error=Faltan datos');
            exit;
        }

        // 2. Buscar al usuario en la BBDD
        $stmt = $this->pdo->prepare("SELECT * FROM empleado WHERE usuario = ?");
        $stmt->execute([$usuario]);
        $user = $stmt->fetch();

        // 3. Verificar si el usuario existe y si está bloqueado
        if ($user) {
            if ($user['bloqueado_hasta'] && strtotime($user['bloqueado_hasta']) > time()) {
                // El usuario está bloqueado
                $tiempo_restante = ceil((strtotime($user['bloqueado_hasta']) - time()) / 60);
                header('Location: /login?error=' . urlencode("Cuenta bloqueada. Inténtalo de nuevo en {$tiempo_restante} minutos."));
                exit;
            }
        }

        // 4. Verificar si el usuario existe Y la contraseña es correcta
        if ($user && password_verify($clave, $user['clave'])) {
            // ¡Éxito! Reseteamos los intentos fallidos y la fecha de bloqueo
            $stmt = $this->pdo->prepare("UPDATE empleado SET intentos_fallidos = 0, bloqueado_hasta = NULL WHERE id_empleado = ?");
            $stmt->execute([$user['id_empleado']]);

            // Guardamos al usuario en la sesión
            session_regenerate_id(true); // Seguridad contra fijación de sesión
            $_SESSION['user_id'] = $user['id_empleado'];
            $_SESSION['user_email'] = $user['usuario'];

            // Redirigimos al dashboard
            header('Location: /dashboard');
            exit;

        } else {
            // Error, credenciales incorrectas
            if ($user) {
                $intentos_fallidos = $user['intentos_fallidos'] + 1;

                if ($intentos_fallidos >= MAX_ATTEMPTS) {
                    // Bloquear la cuenta
                    $bloqueado_hasta = date('Y-m-d H:i:s', strtotime(LOCKOUT_TIME));
                    $stmt = $this->pdo->prepare("UPDATE empleado SET intentos_fallidos = ?, bloqueado_hasta = ? WHERE id_empleado = ?");
                    $stmt->execute([$intentos_fallidos, $bloqueado_hasta, $user['id_empleado']]);
                    header('Location: /login?error=' . urlencode("Has excedido el número de intentos. Tu cuenta ha sido bloqueada por 15 minutos."));
                } else {
                    // Solo incrementar los intentos
                    $stmt = $this->pdo->prepare("UPDATE empleado SET intentos_fallidos = ? WHERE id_empleado = ?");
                    $stmt->execute([$intentos_fallidos, $user['id_empleado']]);
                    header('Location: /login?error=Credenciales incorrectas');
                }
            } else {
                // Usuario no encontrado
                header('Location: /login?error=Credenciales incorrectas');
            }
            exit;
        }
    }

    // Maneja el logout
    public function logout()
    {
        session_destroy();
        header('Location: /login');
        exit;
    }
}
