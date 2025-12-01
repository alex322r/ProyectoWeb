<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instalación del Sistema</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/login.css">
    <style>
        body {
            height: auto !important;
            overflow: auto !important;
            display: block !important;
            padding-bottom: 50px;
        }
        .setup-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .step-section {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .step-section:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="setup-container">
        <div class="text-center mb-4">
            <h2>Instalación del Consultorio Psicológico</h2>
            <p class="text-muted">Configuración inicial del sistema</p>
        </div>

        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <form action="/setup/install" method="POST">
            
            <div class="step-section">
                <h4>1. Configuración de Base de Datos</h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Host</label>
                        <input type="text" name="db_host" class="form-control" value="127.0.0.1" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Nombre de la Base de Datos</label>
                        <input type="text" name="db_name" class="form-control" value="consultorio_psicologico" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Usuario</label>
                        <input type="text" name="db_user" class="form-control" value="root" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Contraseña</label>
                        <input type="password" name="db_pass" class="form-control">
                    </div>
                </div>
            </div>

            <div class="step-section">
                <h4>2. Cuenta de Administrador</h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Nombres</label>
                        <input type="text" name="admin_nombres" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Apellidos</label>
                        <input type="text" name="admin_apellidos" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Usuario (Login)</label>
                        <input type="text" name="admin_user" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Contraseña</label>
                        <input type="password" name="admin_pass" class="form-control" required>
                    </div>
                    <div class="col-md-12 mb-3">
                         <label>Email</label>
                         <input type="email" name="admin_email" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg">Instalar Sistema</button>
            </div>
        </form>
    </div>
</body>
</html>
