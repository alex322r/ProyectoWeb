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

        // 3. Verificar si el usuario existe Y la contraseña es correcta
        if ($user && password_verify($clave, $user['clave'])) {
            // ¡Éxito! Guardamos al usuario en la sesión
            session_regenerate_id(true); // Seguridad contra fijación de sesión
            $_SESSION['user_id'] = $user['id_empleado'];
            $_SESSION['user_email'] = $user['usuario'];

            // Redirigimos al dashboard (la home)
            header('Location: /dashboard');
            exit;

        } else {
            // Error, credenciales incorrectas
            header('Location: /login?error=Credenciales incorrectas');
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
