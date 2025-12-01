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
            // ¡Éxito! Ahora verificamos si el usuario está activo
            if ($user['estado'] === 'inactivo') {
                // Usuario inactivo, no puede iniciar sesión
                header('Location: /inactive-account');
                exit;
            }

            // Reseteamos los intentos fallidos y la fecha de bloqueo
            $stmt = $this->pdo->prepare("UPDATE empleado SET intentos_fallidos = 0, bloqueado_hasta = NULL WHERE id_empleado = ?");
            $stmt->execute([$user['id_empleado']]);

            // Guardamos al usuario en la sesión
            $_SESSION['user_id'] = $user['id_empleado'];
            $_SESSION['user_email'] = $user['usuario'];
            $_SESSION['user_role'] = $user['rol'];
            session_regenerate_id(true); // Seguridad contra fijación de sesión

            // Check for forced password change
            if (isset($user['cambiar_clave']) && $user['cambiar_clave'] == 1) {
                $_SESSION['force_change_password'] = true;
                header('Location: /change-password');
                exit;
            }

            // Redirigimos al dashboard
            header('Location: /dashboard');
            exit;

        } else {
            // Error, credenciales incorrectas
            $ip = $_SERVER['REMOTE_ADDR'];
            $stmt = $this->pdo->prepare("INSERT INTO intentos_login_fallidos (usuario, ip) VALUES (?, ?)");
            $stmt->execute([$usuario, $ip]);
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

    public function showChangePasswordForm()
    {
        if (!isset($_SESSION['user_id']) || !isset($_SESSION['force_change_password'])) {
            header('Location: /login');
            exit;
        }
        view('change_password', ['titulo' => 'Cambiar Contraseña']);
    }

    public function handleChangePassword()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: /login');
            exit;
        }

        $clave = $_POST['clave'] ?? null;
        $confirmar_clave = $_POST['confirmar_clave'] ?? null;

        if (!$clave || !$confirmar_clave) {
            header('Location: /change-password?error=Faltan datos');
            exit;
        }

        if ($clave !== $confirmar_clave) {
            header('Location: /change-password?error=Las contraseñas no coinciden');
            exit;
        }

        // Enforce password strength (optional but recommended)
        if (strlen($clave) < 6) {
             header('Location: /change-password?error=La contraseña debe tener al menos 6 caracteres');
             exit;
        }

        // Update password and clear flag
        $hash = password_hash($clave, PASSWORD_BCRYPT);
        $stmt = $this->pdo->prepare("UPDATE empleado SET clave = ?, cambiar_clave = 0 WHERE id_empleado = ?");
        $stmt->execute([$hash, $_SESSION['user_id']]);

        // Clear force flag
        unset($_SESSION['force_change_password']);

        header('Location: /dashboard?message=Contraseña actualizada');
        exit;
    }

    // Maneja el logout
    public function logout()
    {
        session_destroy();
        header('Location: /login');
        exit;
    }

    public function getFailedLoginAttempts()
    {
        try {
            $stmt = $this->pdo->query("SELECT usuario, ip, fecha_intento FROM intentos_login_fallidos ORDER BY fecha_intento DESC LIMIT 20");
            $attempts = $stmt->fetchAll();
            header('Content-Type: application/json');
            echo json_encode($attempts);
        } catch (Exception $e) {
            header('Content-Type: application/json', true, 500);
            echo json_encode(['error' => 'Could not get failed login attempts', 'details' => $e->getMessage()]);
        }
    }
}
