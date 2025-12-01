<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title><?php echo $titulo ?? 'Cambiar Contraseña'; ?></title>
  <link rel="stylesheet" href="/css/login.css">
</head>
<body>
   <header>
    </header>
    <h1>Cambiar Contraseña</h1>
    <p style="text-align: center; color: #555;">Debes cambiar tu contraseña antes de continuar.</p>
    <form action="/change-password" method="POST">

        <div class="input-container">
            <input class="input-field" placeholder=" " type="password" id="clave" name="clave" required>
            <label class="input-label" for="clave">Nueva Contraseña:</label>
        </div>
        <br>
        <div class="input-container">
            <input class="input-field" placeholder=" " type="password" id="confirmar_clave" name="confirmar_clave" required>
            <label class="input-label" for="confirmar_clave">Confirmar Contraseña:</label>
        </div>

        <br>

        <?php if (!empty($_GET['error'])) : ?>
            <p style="color: red; text-align: center;"><?php echo htmlspecialchars($_GET['error']); ?></p>
        <?php endif; ?>

        <button type="submit">Actualizar Contraseña</button>
    </form>
</body>
</html>
