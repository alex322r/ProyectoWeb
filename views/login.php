 <!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title><?php echo $titulo; ?></title>
  <link rel="stylesheet" href="/css/login.css">
</head>
<body>
   <header>
    </header>
    <h1>Iniciar sesion</h1>
    <form action="/login" method="POST">

        <div class="input-container">
        <input class="input-field" placeholder=" " type="text" id="username" name="usuario" required>
        <label class="input-label" for="username">Usuario:</label>

        </div>

        <br>
        <div class="input-container" class="floating-label">
        <input class="input-field" placeholder=" " type="password" id="password" name="clave" required>
        <label class="input-label" for="password">Contraseña:</label>

        </div>
        <br>
        <p><a href="#">¿Olvidaste tu contraseña?</a></p>
    
        <button type="submit">Iniciar sesión</button>
    </form>
</body>
</html>
