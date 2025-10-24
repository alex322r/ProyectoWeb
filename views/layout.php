<?php

  if(!isset($_SESSION['user_id'])) {
    header('Locatation: /login');
    exit;
  }

  $userName = $_SESSION['user_name'] ?? 'Usuario';
  $userRole = $_SESSION['user_role'] ?? 'Rol';

?>

<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title><?php echo htmlspecialchars($titulo ?? 'Consultorio'); ?> - Gestión Clínica</title>

  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="/css/styles.css"> 
  <link rel="stylesheet" href="/css/pacientes.css"> 
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
        <div class="nav-item active" data-target="dashboard"><a href="/dashboard">📊 Dashboard</a></div>
        <div class="nav-item" data-target="pacientes"><a href="/pacientes">👥 Pacientes</a></div>
        <div class="nav-item" data-target="agenda"><a href="/agenda">📅 Agenda</a></div>
        </nav>

      <div class="sidebar-footer">© 2025 Avance • Sistema</div>
    </aside>

    <main class="main" role="main">
      <header class="topbar">
        <div class="user-name"><?php /* echo htmlspecialchars($userName); */ ?></div>
        <div class="user-role"><?php /* echo htmlspecialchars($userRole); */ ?></div>
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

  <script src="/js/pacientes.js"></script>
</body>
</html>
