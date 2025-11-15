<div id="configuracion" role="region" aria-label="Configuración del Sistema">
  <h2>Configuración del Sistema</h2>

  <div class="card">
    <div class="card-header">
      <h3>Modo Mantenimiento</h3>
    </div>
    <div class="card-body">
      <p>
        El modo mantenimiento permite poner el sitio web en "fuera de línea" temporalmente para el público general,
        mostrando un mensaje de "Volvemos pronto". Los administradores aún pueden acceder al sitio.
      </p>
      <form action="/configuracion/maintenance/<?php echo $maintenance_mode_status ? 'disable' : 'enable'; ?>" method="post">
        <button type="submit">
          <?php echo $maintenance_mode_status ? 'Desactivar Modo Mantenimiento' : 'Activar Modo Mantenimiento'; ?>
        </button>
      </form>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <h3>Opciones Generales</h3>
    </div>
    <div class="card-body">
      <form action="/configuracion/timezone/update" method="post">
        <label for="timezone">Zona Horaria por Defecto:</label>
        <select name="timezone" id="timezone">
          <?php foreach ($timezones as $timezone): ?>
            <option value="<?php echo htmlspecialchars($timezone); ?>" <?php echo ($timezone === $current_timezone) ? 'selected' : ''; ?>>
              <?php echo htmlspecialchars($timezone); ?>
            </option>
          <?php endforeach; ?>
        </select>
        <button type="submit">Guardar Cambios</button>
      </form>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <h3>Ajustes de Funcionalidad</h3>
    </div>
    <div class="card-body">
      <form action="/configuracion/features/update" method="post">
        <label>
          <input type="checkbox" name="allow_new_user_registration" value="1" <?php echo !empty($features['allow_new_user_registration']) ? 'checked' : ''; ?>>
          Permitir registro de nuevos usuarios
        </label>
        <br>
        <button type="submit">Guardar Cambios</button>
      </form>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <h3>Ajustes de Vistas</h3>
    </div>
    <div class="card-body">
      <form action="/configuracion/views/update" method="post">
        <?php foreach ($views as $view_name => $is_enabled): ?>
        <label>
          <input type="checkbox" name="views[<?php echo $view_name; ?>]" value="1" <?php echo $is_enabled ? 'checked' : ''; ?>>
          Habilitar vista de <?php echo ucfirst($view_name); ?>
        </label>
        <br>
        <?php endforeach; ?>
        <button type="submit">Guardar Cambios</button>
      </form>
    </div>
  </div>
</div>
