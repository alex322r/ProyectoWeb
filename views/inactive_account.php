<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Cuenta Inactiva</title>
  <link rel="stylesheet" href="/css/login.css"> <!-- Reusing login styles for consistency -->
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-color: #f0f2f5; /* Light gray background */
      font-family: Arial, sans-serif;
    }
    .inactive-container {
      background-color: #fff;
      padding: 40px;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      max-width: 400px;
      width: 90%;
    }
    .inactive-container h1 {
      color: #dc3545; /* Red for error/warning */
      margin-bottom: 20px;
    }
    .inactive-container p {
      color: #333;
      margin-bottom: 25px;
      line-height: 1.6;
    }
    .inactive-container a {
      display: inline-block;
      background-color: #007bff; /* Blue for primary action */
      color: #fff;
      padding: 10px 20px;
      border-radius: 5px;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }
    .inactive-container a:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
    <div class="inactive-container">
        <h1>Cuenta Inactiva</h1>
        <p>Tu cuenta se encuentra inactiva. No puedes iniciar sesión en este momento.</p>
        <p>Por favor, contacta al administrador del sistema para obtener asistencia y activar tu cuenta.</p>
        <a href="/login">Volver al inicio de sesión</a>
    </div>
</body>
</html>
