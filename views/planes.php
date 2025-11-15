<div id="planes" class="" role="region" aria-label="Planes">

<?php if (isset($_SESSION['success_message'])): ?>
    <dialog id="successDialog">
        <p><?php echo $_SESSION['success_message']; ?></p>
        <button id="closeSuccessDialog">Cerrar</button>
    </dialog>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const successDialog = document.getElementById('successDialog');
            if (successDialog) {
                successDialog.showModal();
            }
            const closeSuccessDialog = document.getElementById('closeSuccessDialog');
            if (closeSuccessDialog) {
                closeSuccessDialog.addEventListener('click', () => {
                    successDialog.close();
                });
            }
        });
    </script>
    <?php unset($_SESSION['success_message']); ?>
<?php endif; ?>

<?php if (isset($_SESSION['error_message'])): ?>
    <dialog id="errorDialog">
        <p><?php echo $_SESSION['error_message']; ?></p>
        <button id="closeErrorDialog">Cerrar</button>
    </dialog>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const errorDialog = document.getElementById('errorDialog');
            if (errorDialog) {
                errorDialog.showModal();
            }
            const closeErrorDialog = document.getElementById('closeErrorDialog');
            if (closeErrorDialog) {
                closeErrorDialog.addEventListener('click', () => {
                    errorDialog.close();
                });
            }
        });
    </script>
    <?php unset($_SESSION['error_message']); ?>
<?php endif; ?>

          <div class="view-header">
             <div>
                <h3>Planes</h3>
                <p>Buscar, crear y administrar planes</p>
             </div>
            <div class="header-actions">
              <input id="buscarPlan" type="search" placeholder="Buscar por nombre" />
              <button id="openPlanesBtn" class="btn">+ Nuevo Plan</button>
            </div>
          </div>

          <div class="table-wrap">
            <table>
              <thead><tr><th>Id</th><th>Nombre</th><th>Descripción</th><th>Sesiones</th><th>Precio</th><th>Descuento</th><th>Duración (Meses)</th><th>Activo</th><th>Acciones</th></tr></thead>
              <tbody id="planesTable">
                <?php
                  if (isset($planes) && is_array($planes)):
                    foreach ($planes as $plan):
                ?>
                        <tr>
                            <td><?php echo htmlspecialchars($plan['id_plan']); ?></td>
                            <td><?php echo htmlspecialchars($plan['nombre']); ?></td>
                            <td><?php echo htmlspecialchars($plan['descripcion']); ?></td>
                            <td><?php echo htmlspecialchars($plan['numero_sesiones']); ?></td>
                            <td><?php echo htmlspecialchars($plan['precio']); ?></td>
                            <td><?php echo htmlspecialchars($plan['descuento']); ?></td>
                            <td><?php echo htmlspecialchars($plan['duracion_meses']); ?></td>
                            <td class="estado-<?php echo $plan['activo'] ? 'activo' : 'inactivo'; ?>"><?php echo $plan['activo'] ? 'Sí' : 'No'; ?></td>
                            <td>
                                <button class="btn ghost" onclick="editPlan(<?php echo htmlspecialchars($plan['id_plan']); ?>)">Editar</button>
                                <form action="/planes/eliminar/<?php echo htmlspecialchars($plan['id_plan']); ?>" method="POST" style="display:inline;" onsubmit="return confirm('¿Está seguro de que desea eliminar este plan?');">
                                    <button type="submit" class="btn ghost">Borrar</button>
                                </form>
                                <?php if ($plan['activo']): ?>
                                    <form action="/planes/inactivar/<?php echo htmlspecialchars($plan['id_plan']); ?>" method="POST" style="display:inline;" onsubmit="return confirm('¿Está seguro de que desea inactivar este plan?');">
                                        <button type="submit" class="btn ghost">Inactivar</button>
                                    </form>
                                <?php else: ?>
                                    <form action="/planes/activar/<?php echo htmlspecialchars($plan['id_plan']); ?>" method="POST" style="display:inline;" onsubmit="return confirm('¿Está seguro de que desea activar este plan?');">
                                        <button type="submit" class="btn ghost">Activar</button>
                                    </form>
                                <?php endif; ?>
                            </td>
                        </tr>
                <?php
                    endforeach;
                  endif;
                ?>

              </tbody>
            </table>
          </div>
        </div>

<dialog id="registerDialog">
        <form action="/planes/crear" method="POST" id="registerForm">
            <h2>Registro de Plan</h2>

            <fieldset>
                <legend>Datos del Plan</legend>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion"></textarea>
                <label for="numero_sesiones">Número de Sesiones:</label>
                <input type="number" id="numero_sesiones" name="numero_sesiones" required min="1">
                <label for="precio">Precio:</label>
                <input type="number" id="precio" name="precio" required step="0.01" min="0">
                <label for="descuento">Descuento:</label>
                <input type="number" id="descuento" name="descuento" step="0.01" min="0" value="0.00">
                <label for="duracion_meses">Duración (Meses):</label>
                <input type="number" id="duracion_meses" name="duracion_meses" required min="1">
                <label for="activo">Activo:</label>
                <input type="checkbox" id="activo" name="activo" value="1" checked>
            </fieldset>

            <div class="form-actions">
                <button type="button" id="cancelBtn">Cancelar</button>
                <button type="submit">Guardar Plan</button>
            </div>
        </form>
    </dialog>

<dialog id="editDialog">
        <form action="" method="POST" id="editForm">
            <h2>Editar Plan</h2>
            <input type="hidden" id="edit_id_plan" name="id_plan">
            <fieldset>
                <legend>Datos del Plan</legend>
                <label for="edit_nombre">Nombre:</label>
                <input type="text" id="edit_nombre" name="nombre" required>
                <label for="edit_descripcion">Descripción:</label>
                <textarea id="edit_descripcion" name="descripcion"></textarea>
                <label for="edit_numero_sesiones">Número de Sesiones:</label>
                <input type="number" id="edit_numero_sesiones" name="numero_sesiones" required min="1">
                <label for="edit_precio">Precio:</label>
                <input type="number" id="edit_precio" name="precio" required step="0.01" min="0">
                <label for="edit_descuento">Descuento:</label>
                <input type="number" id="edit_descuento" name="descuento" step="0.01" min="0">
                <label for="edit_duracion_meses">Duración (Meses):</label>
                <input type="number" id="edit_duracion_meses" name="duracion_meses" required min="1">
                <label for="edit_activo">Activo:</label>
                <input type="checkbox" id="edit_activo" name="activo" value="1">
            </fieldset>

            <div class="form-actions">
                <button type="button" id="cancelEditBtn">Cancelar</button>
                <button type="submit">Guardar Cambios</button>
            </div>
        </form>
    </dialog>

<script src="/js/planes.js" type="module"></script>
