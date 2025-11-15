<?php
$userRole = $_SESSION['user_role'] ?? 'invitado';
?>

<?php if ($userRole == 'administrador'): ?>


<div id="dashboard" role="region" aria-label="Dashboard - Administración">
  <h2>
    Dashboard de Administración
  </h2>

  <div class="grid main-grid">
    <div class="card">
      <div class="card-header">
        <h3>Usuarios en Línea</h3>
      </div>
      <div id="online-users-list" class="table-wrap">
        <!-- La lista de usuarios se cargará aquí dinámicamente -->
        <p>Cargando...</p>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <h3>Nuevos Registros (Últimas 24h)</h3>
      </div>
      <div id="new-users-list" class="table-wrap">
        <!-- La lista de nuevos usuarios se cargará aquí dinámicamente -->
        <p>Cargando...</p>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <h3>Estado del Sistema</h3>
      </div>
      <div id="system-status-card" class="table-wrap">
        <p>Cargando...</p>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <h3>Intentos de Sesión Fallidos</h3>
      </div>
      <div id="failed-logins-list" class="table-wrap">
        <p>Cargando...</p>
      </div>
    </div>
  </div>
</div>
<?php endif; ?>

<?php if ($userRole == 'recepcionista'): ?>
<div id="dashboard" role="region" aria-label="Dashboard">
  
  <div class="grid kpi-grid">
    <div class="card kpi">
      <div>
        <div class="label">Citas de hoy</div>
        <div class="value"><?php echo $citasHoy ?? 8; ?></div>
      </div>
      <div class="kpi-icon">📅</div>
    </div>
    <div class="card kpi">
      <div>
        <div class="label">Ingresos del día</div>
        <div class="value"><?php echo number_format($ingresosDia ?? 1240, 2); ?></div>
      </div>
      <div class="kpi-icon">💰</div>
    </div>
  </div>

  <div class="grid main-grid">
    <div class="card">
      <div class="card-header">
        <h3>Próximas citas</h3>
        <button class="btn ghost" onclick="goTo('agenda')">Ver agenda</button>
      </div>
      <div class="table-wrap">
        <table>
          <thead><tr><th>Hora</th><th>Paciente</th><th>Psicólogo</th><th>Estado</th></tr></thead>
          <tbody>
            <?php if (isset($proximasCitas) && !empty($proximasCitas)): ?>
              <?php foreach ($proximasCitas as $cita): ?>
                <tr>
                  <td><?php echo date('h:i A', strtotime($cita['fecha_hora'])); ?></td>
                  <td><?php echo htmlspecialchars($cita['nombre_paciente']); ?></td>
                  <td><?php echo htmlspecialchars($cita['nombre_psicologo']); ?></td>
                  <td><span class="status <?php echo strtolower(htmlspecialchars($cita['estado'])); ?>"><?php echo htmlspecialchars($cita['estado']); ?></span></td>
                </tr>
              <?php endforeach; ?>
            <?php else: ?>
              <tr>
                <td colspan="4">No hay próximas citas.</td>
              </tr>
            <?php endif; ?>
          </tbody>
        </table>
      </div>
    </div>
    </div>
</div>
<?php endif; ?>
<script src="/js/dashboard.js"></script>