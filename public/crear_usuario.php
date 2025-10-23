<?php
// Carga tu conexión a BBDD desde index.php
// (Ajusta la ruta si es necesario)

$dsn = 'mysql:host=127.0.0.1;dbname=consultorio_psicologico'; // Usa 127.0.0.1
$usuario_root = 'root'; // Tu usuario root
$pass_root = '123456'; // ⚠️ ¡Tu contraseña de root de MySQL!
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

// DATOS DEL NUEVO USUARIO
$username = 'alex322r';
$password_texto_plano = '123456';

// ¡Hasheamos la contraseña!
$password_hash = password_hash($password_texto_plano, PASSWORD_DEFAULT);

try {
    $pdo = new PDO($dsn, $usuario_root, "", $options);
    $stmt = $pdo->prepare("INSERT INTO empleado (rol, usuario, clave) VALUES (?, ?, ?)");
    $stmt->execute([ "administrador", $username, $password_hash]);
    echo "¡Usuario creado exitosamente!";
} catch (PDOException $e) {
    echo "Error al crear usuario: " . $e->getMessage();
}
