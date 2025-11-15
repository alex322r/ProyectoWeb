<div id="registros" role="region" aria-label="Registros de Aplicación">
  <h2>Registros de Aplicación</h2>

  <div class="card">
    <div class="card-header">
      <h3>Logs de Errores</h3>
    </div>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>Timestamp</th>
            <th>Message</th>
          </tr>
        </thead>
        <tbody>
          <?php if (isset($logs) && !empty($logs)): ?>
            <?php foreach ($logs as $log): ?>
              <tr>
                <td><?php echo htmlspecialchars($log['timestamp']); ?></td>
                <td><pre><?php echo htmlspecialchars($log['message']); ?></pre></td>
              </tr>
            <?php endforeach; ?>
          <?php else: ?>
            <tr>
              <td colspan="2">No hay logs para mostrar.</td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <h3>Logs de Acceso</h3>
    </div>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>IP Address</th>
            <th>User Agent</th>
            <th>Request Method</th>
            <th>Request URI</th>
            <th>Response Status</th>
            <th>Timestamp</th>
          </tr>
        </thead>
        <tbody>
          <?php if (isset($accessLogs) && !empty($accessLogs)): ?>
            <?php foreach ($accessLogs as $log): ?>
              <tr>
                <td><?php echo htmlspecialchars($log['ip_address']); ?></td>
                <td><?php echo htmlspecialchars($log['user_agent']); ?></td>
                <td><?php echo htmlspecialchars($log['request_method']); ?></td>
                <td><?php echo htmlspecialchars($log['request_uri']); ?></td>
                <td><?php echo htmlspecialchars($log['response_status']); ?></td>
                <td><?php echo htmlspecialchars($log['timestamp']); ?></td>
              </tr>
            <?php endforeach; ?>
          <?php else: ?>
            <tr>
              <td colspan="6">No hay logs de acceso para mostrar.</td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <h3>Logs de Auditoría</h3>
    </div>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>Usuario</th>
            <th>Acción</th>
            <th>Target</th>
            <th>Detalles</th>
            <th>Timestamp</th>
          </tr>
        </thead>
        <tbody>
          <?php if (isset($auditLogs) && !empty($auditLogs)): ?>
            <?php foreach ($auditLogs as $log): ?>
              <tr>
                <td><?php echo htmlspecialchars($log['nombres'] . ' ' . $log['apellidos']); ?> (ID: <?php echo htmlspecialchars($log['user_id']); ?>)</td>
                <td><?php echo htmlspecialchars($log['action']); ?></td>
                <td><?php echo htmlspecialchars($log['target_type']); ?> (ID: <?php echo htmlspecialchars($log['target_id']); ?>)</td>
                <td><pre><?php echo htmlspecialchars(json_encode(json_decode($log['details']), JSON_PRETTY_PRINT)); ?></pre></td>
                <td><?php echo htmlspecialchars($log['timestamp']); ?></td>
              </tr>
            <?php endforeach; ?>
          <?php else: ?>
            <tr>
              <td colspan="5">No hay logs de auditoría para mostrar.</td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
