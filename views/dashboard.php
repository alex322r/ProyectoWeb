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
        <div class="value">S/ <?php echo number_format($ingresosDia ?? 1240, 2); ?></div>
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
            <?php
              // Aquí iterarías sobre los datos pasados desde el controlador
              // foreach ($proximasCitas as $cita):
            ?>
            <tr>
              <td>09:00</td>
              <td>Luis Alejos</td>
              <td>Dra. Rojas</td>
              <td><span class="status confirmed">Confirmada</span></td>
            </tr>
            <?php // endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
    </div>
</div>
