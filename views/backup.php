<div id="backup" role="region" aria-label="Copias de Seguridad">
  <h2>Copias de Seguridad</h2>

  <div class="card">
    <div class="card-header">
      <h3>Crear Copia de Seguridad</h3>
    </div>
    <div class="card-body">
      <p>
        Crea una copia de seguridad de la base de datos. El archivo se guardará en el servidor.
      </p>
      <form action="/backup/create" method="post">
        <button type="submit">Crear Copia de Seguridad</button>
      </form>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <h3>Copias de Seguridad Existentes</h3>
    </div>
    <div class="card-body">
      <?php if (empty($backups)): ?>
        <p>No hay copias de seguridad existentes.</p>
      <?php else: ?>
        <table>
          <thead>
            <tr>
              <th>Archivo</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($backups as $backup): ?>
              <tr>
                <td><?php echo htmlspecialchars($backup); ?></td>
                <td>
                  <a href="/backup/download/<?php echo htmlspecialchars($backup); ?>">Descargar</a>
                  <a href="/backup/delete/<?php echo htmlspecialchars($backup); ?>" onclick="return confirm('¿Estás seguro de que quieres eliminar esta copia de seguridad?');">Eliminar</a>
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      <?php endif; ?>
    </div>
  </div>
</div>
