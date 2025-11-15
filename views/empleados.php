        <div id="pacientes" class="" role="region" aria-label="Pacientes">

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
                <h3>Empleados</h3>
                <p>Buscar, crear y administrar empleados</p>
             </div>
            <div class="header-actions">
              <input id="buscarPaciente" type="search" placeholder="Buscar por nombre o DNI" />
              <button id="openEmpleadosBtn" class="btn">+ Nuevo Empleado</button>
            </div>
          </div>

          <div class="table-wrap">
            <table>
              <thead><tr><th>Id</th><th>DNI</th><th>NOMBRE COMPLETO</th><th>Rol</th><th>Usuario</th><th>Estado</th><th>Acciones</th></tr></thead>
              <tbody id="patientsTable">
                <?php
                  // Aquí iría la lógica para listar empleados
                    foreach ($empleados as $empleado):
                ?>
                        <tr>
                            <td><?php echo htmlspecialchars($empleado['id']); ?></td>
                            <td><?php echo htmlspecialchars($empleado['dni']); ?></td>
                            <td><?php echo htmlspecialchars($empleado['nombre_completo']); ?></td>
                            <td><?php echo htmlspecialchars($empleado['rol']); ?></td>
                            <td><?php echo htmlspecialchars($empleado['usuario']); ?></td>
                            <td class="estado-<?php echo htmlspecialchars($empleado['estado']); ?>"><?php echo ucfirst(htmlspecialchars($empleado['estado'])); ?></td>
                            <td>
                                <button class="btn ghost" onclick="viewProfile(<?php echo htmlspecialchars($empleado['id']); ?>)">Ver Perfil</button>
                                <button class="btn ghost" onclick="editProfile(<?php echo htmlspecialchars($empleado['id']); ?>)">Editar</button>
                                <form action="/empleados/eliminar/<?php echo htmlspecialchars($empleado['id']); ?>" method="POST" style="display:inline;" onsubmit="return confirm('¿Está seguro de que desea eliminar este empleado?');">
                                    <button type="submit" class="btn ghost">Borrar</button>
                                </form>
                                <?php if ($empleado['estado'] == 'activo'): ?>
                                    <form action="/empleados/inactivar/<?php echo htmlspecialchars($empleado['id']); ?>" method="POST" style="display:inline;" onsubmit="return confirm('¿Está seguro de que desea inactivar a este empleado?');">
                                        <button type="submit" class="btn ghost">Inactivar</button>
                                    </form>
                                <?php else: ?>
                                    <form action="/empleados/activar/<?php echo htmlspecialchars($empleado['id']); ?>" method="POST" style="display:inline;" onsubmit="return confirm('¿Está seguro de que desea activar a este empleado?');">
                                        <button type="submit" class="btn ghost">Activar</button>
                                    </form>
                                <?php endif; ?>
                            </td>
                        </tr>
                <?php
                    endforeach;
                ?>

              </tbody>
            </table>
          </div>
        </div>

<dialog id="registerDialog">
        <form action="/empleados/crear" method="POST" id="registerForm">
            <h2>Registro de Empleado</h2>

            <fieldset>
                <legend>1. Datos del Empleado</legend>
                <label for="empleado_dni">DNI:</label>
                <input type="number" id="empleado_dni" name="empleado_dni" required maxlength="8">
                <label for="empleado_nombres">Nombres:</label>
                <input type="text" id="empleado_nombres" name="empleado_nombres" required>
                <label for="empleado_apellidos">Apellidos:</label>
                <input type="text" id="empleado_apellidos" name="empleado_apellidos" required>
                <label for="empleado_email">Email:</label>
                <input type="email" id="empleado_email" name="empleado_email">
                <label type="text" for="empleado_direccion">Dirección:</label>
                <input type="text" id="empleado_direccion" name="empleado_direccion">
                <label for="empleado_telefono">Teléfono:</label>
                <input type="number" id="empleado_telefono" name="empleado_telefono">
                <label for="empleado_fecha_nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="empleado_fecha_nacimiento" name="empleado_fecha_nacimiento">
                <label for="empleado_rol">Rol</label>
                <select id="empleado_rol" name="empleado_rol" required>
                    <option value="">Seleccione un rol</option>
                    <option value="administrador">Administrador</option>
                    <option value="psicologo">Psicologo</option>
                    <option value="recepcionista">Recepcionista</option>
                    <option value="cajero">Cajero</option>
                </select>
            </fieldset>

            <div class="form-actions">
                <button type="button" id="cancelBtn">Cancelar</button>
                <button type="submit">Guardar Empleado</button>
            </div>
        </form>
    </dialog>
    <script>
      console.log("Hola desde empleados.php");
    </script>
    <script src="/js/empleados.js" type="module"></script>

<dialog id="profileDialog">
    <div id="profileContent">
        <!-- Profile content will be injected here -->
    </div>
    <button id="closeProfileBtn">Cerrar</button>
</dialog>