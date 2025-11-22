<?php

  if(!isset($_SESSION['user_id'])) {
    header('Locatation: /login');
    exit;
  }

  $userName = $_SESSION['user_email'] ?? 'Usuario';
  $userRole = $_SESSION['user_role'] ?? 'Rol';

  $config_file = __DIR__ . '/../storage/config.json';
  $views_config = [];
  if (file_exists($config_file)) {
      $config_content = file_get_contents($config_file);
      $config = json_decode($config_content, true);
      if (isset($config['views'])) {
          $views_config = $config['views'];
      }
  }

?>

<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="user-role" content="<?php echo htmlspecialchars($userRole); ?>">
  <title><?php echo htmlspecialchars($titulo ?? 'Consultorio'); ?> - Gestión Clínica</title>

  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="/css/styles.css"> 
  <link rel="stylesheet" href="/css/pacientes.css"> 
  <link rel="stylesheet" href="/css/agenda.css"> 
  <link rel="stylesheet" href="/css/citas.css">
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/main.min.css' rel='stylesheet' />
</head>
<body>
  <div class="app" id="app">
    
    <aside class="sidebar" role="navigation" aria-label="Main sidebar">
      <div class="brand">
        <div class="logo">AV</div>
        <div>
          <h1>Avance</h1>
          <div class="brand-subtitle">Gestión Clínica</div>
        </div>
      </div>

      <nav class="nav" id="menu">

        <?php if ( $userRole === 'recepcionista'): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'dashboard' ? 'active' : ''; ?>" data-target="dashboard"><a href="/dashboard">📊 Dashboard</a></div>
          <?php if ($views_config['pacientes']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'pacientes' ? 'active' : ''; ?>" data-target="pacientes"><a href="/pacientes">👥 Pacientes</a></div>
          <?php endif; ?>
          <?php if ($views_config['citas']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'citas' ? 'active' : ''; ?>" data-target="citas"><a href="/citas">🗓️ Citas</a></div>
          <?php endif; ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'reportes' ? 'active' : ''; ?>" data-target="reportes"><a href="/reportes/pacientes">📊 Reportes</a></div>
        <?php endif; ?>
        <?php if ( $userRole === 'psicologo'): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'dashboard' ? 'active' : ''; ?>" data-target="dashboard"><a href="/dashboard">📊 Dashboard</a></div>
          <?php if ($views_config['pacientes']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'pacientes' ? 'active' : ''; ?>" data-target="pacientes"><a href="/pacientes">👥 Pacientes</a></div>
          <?php endif; ?>
          <?php if ($views_config['agenda']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'agenda' ? 'active' : ''; ?>" data-target="agenda"><a href="/agenda">📅 Agenda</a></div>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'buscar_historial' ? 'active' : ''; ?>" data-target="buscar_historial"><a href="/historial/buscar">🔍 Buscar Historial</a></div>
          <?php endif; ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'reportes' ? 'active' : ''; ?>" data-target="reportes"><a href="/reportes/pacientes">📊 Reportes</a></div>
        <?php endif; ?>
        <?php if ( $userRole === 'administrador'): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'dashboard' ? 'active' : ''; ?>" data-target="dashboard"><a href="/dashboard">📊 Dashboard</a></div>
          <?php if ($views_config['empleados']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'empleados' ? 'active' : ''; ?>" data-target="empleados"><a href="/empleados">Empleados</a></div>
          <?php endif; ?>
          <?php if ($views_config['planes']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'planes' ? 'active' : ''; ?>" data-target="planes"><a href="/planes">Planes</a></div>
          <?php endif; ?>
          <?php if ($views_config['registros']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'registros' ? 'active' : ''; ?>" data-target="registros"><a href="/registros">Registros</a></div>
          <?php endif; ?>
          <?php if ($views_config['backup']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'backup' ? 'active' : ''; ?>" data-target="backup"><a href="/backup">Copias de Seguridad</a></div>
          <?php endif; ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'configuracion' ? 'active' : ''; ?>" data-target="configuracion"><a href="/configuracion">Configuración</a></div>

          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'reportes' ? 'active' : ''; ?>" data-target="reportes"><a href="/reportes">Reportes</a></div>
 
       <?php endif; ?>

        <?php if ( $userRole === 'cajero'): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'pagos' ? 'active' : ''; ?>" data-target="pagos"><a href="/pagos">💰 Pagos</a></div>
          <?php if ($views_config['reportes']): ?>
          <div class="nav-item <?php echo ($paginaActiva ?? '') === 'reportes_caja' ? 'active' : ''; ?>" data-target="reportes_caja"><a href="/reportes/caja">📊 Reportes</a></div>
          <?php endif; ?>
        <?php endif; ?>

      </nav>

      <div class="sidebar-footer">© 2025 Avance • Sistema</div>
    </aside>

    <main class="main" role="main">
      <header class="topbar">
        <div class="topbar-left">
          <div class="user-info">
              <div class="user-name"><?php echo htmlspecialchars($userName); ?></div>
              <div class="user-role"><?php echo htmlspecialchars($userRole); ?></div>
          </div>
          <a href="/logout" class="logout-button">Cerrar Sesión</a>
        </div>
        <div id="live-clock" class="live-clock" data-server-time="<?php echo time() * 1000; ?>"></div>
      </header>

      <section class="content">
        <?php echo $content; ?>
      </section>
    </main>
  </div>

  <div id="patientProfileModal" class="modal-overlay hidden">
    </div>

  <div id="newAppointmentModal" class="modal-overlay hidden">
     </div>

  <div id="newPatientModal" class="modal-overlay hidden">
     </div>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const clockElement = document.getElementById('live-clock');
      const serverTime = parseInt(clockElement.getAttribute('data-server-time'), 10);
      let serverTimeObj = new Date(serverTime);

      function updateClock() {
        // Increment seconds
        serverTimeObj.setSeconds(serverTimeObj.getSeconds() + 1);

        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' };
        const formattedDateTime = serverTimeObj.toLocaleDateString('es-ES', options);
        
        clockElement.textContent = formattedDateTime;
      }

      // Update the clock every second
      setInterval(updateClock, 1000);
      
      // Initial call to display the clock immediately
      updateClock();
    });
  </script>
  <?php echo $scripts ?? ''; ?>
</body>
</html>
