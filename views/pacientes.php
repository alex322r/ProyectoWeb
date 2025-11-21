        <div id="pacientes" class="" role="region" aria-label="Pacientes">
          <div class="view-header">
             <div>
                <h3>Pacientes</h3>
                <p>Buscar, crear y administrar pacientes</p>
             </div>
            <div class="header-actions">
              <input id="buscarPaciente" type="search" placeholder="Buscar por nombre o DNI" />
              <?php if (isset($_SESSION['user_role']) && ($_SESSION['user_role'] === 'recepcionista' || $_SESSION['user_role'] === 'administrador')): ?>
              <button id="openRegisterBtn" class="btn">+ Nuevo Paciente</button>
              <?php endif; ?>
            </div>
          </div>

          <div class="table-wrap">
            <table>
              <thead><tr><th>#</th><th>Nombre completo</th><th>DNI</th><th>Estado</th><th>Últ. cita</th><th>Acciones</th></tr></thead>
              <tbody id="patientsTable">
                <?php if (isset($pacientes) && !empty($pacientes)): ?>
                  <?php foreach ($pacientes as $paciente): ?>
                    <tr>
                      <td><?php echo htmlspecialchars($paciente['id_paciente']); ?></td>
                      <td><?php echo htmlspecialchars($paciente['nombres'] . ' ' . $paciente['apellidos']); ?></td>
                      <td><?php echo htmlspecialchars($paciente['dni']); ?></td>
                      <td class="status-cell">
                          <span class="status-badge status-<?php echo str_replace(' ', '-', htmlspecialchars($paciente['estado'])); ?>">
                              <?php echo htmlspecialchars($paciente['estado']); ?>
                          </span>
                      </td>
                      <td class="ultima-cita-cell"
                          data-estado-cita="<?php echo htmlspecialchars($paciente['estado_cita'] ?? ''); ?>"
                          data-monto-pago="<?php echo htmlspecialchars($paciente['monto_pago'] ?? ''); ?>"
                          data-estado-pago="<?php echo htmlspecialchars($paciente['estado_pago'] ?? ''); ?>">
                          <?php echo htmlspecialchars($paciente['ultima_cita'] ? $paciente['ultima_cita'] : '-'); ?>
                      </td>
                  <td class="actions-cell">
                        <button class="btn ghost" onclick="viewProfile(<?php echo htmlspecialchars($paciente['id_paciente']); ?>)">Ver Perfil</button>
                        <?php if (isset($_SESSION['user_role']) && ($_SESSION['user_role'] === 'psicologo' || $_SESSION['user_role'] === 'administrador')): ?>
                        <a href="/pacientes/expediente/<?php echo htmlspecialchars($paciente['id_paciente']); ?>" class="btn">Ver Expediente</a>
                        <?php endif; ?>
                        <?php if (isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'psicologo'): ?>
                        <div class="dropdown">
                            <button class="btn dropdown-toggle">Cambiar Estado</button>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item" data-id="<?php echo htmlspecialchars($paciente['id_paciente']); ?>" data-estado="en tratamiento">En Tratamiento</a>
                                <a href="#" class="dropdown-item" data-id="<?php echo htmlspecialchars($paciente['id_paciente']); ?>" data-estado="alta">Dar de Alta</a>
                                <a href="#" class="dropdown-item" data-id="<?php echo htmlspecialchars($paciente['id_paciente']); ?>" data-estado="suspendido">Suspender</a>
                            </div>
                        </div>
                        <?php endif; ?>
                        <?php if (isset($_SESSION['user_role']) && ($_SESSION['user_role'] === 'administrador' || $_SESSION['user_role'] === 'recepcionista')): ?>
                        <button class="btn btn-danger" onclick="deletePatient(<?php echo htmlspecialchars($paciente['id_paciente']); ?>)">Eliminar</button>
                        <?php endif; ?>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                <?php else: ?>
                  <tr>
                    <td colspan="6">No hay pacientes registrados.</td>
                  </tr>
                <?php endif; ?>
              </tbody>
            </table>
          </div>
        </div>

<div id="cita-tooltip" class="hidden">
    <p><strong>Estado de la cita:</strong> <span id="tooltip-estado-cita"></span></p>
    <p><strong>Monto del pago:</strong> <span id="tooltip-monto-pago"></span></p>
    <p><strong>Estado del pago:</strong> <span id="tooltip-estado-pago"></span></p>
</div>

<dialog id="registerDialog">
        <form id="registerForm">
            <h2>Registro de Paciente</h2>

            <fieldset>
                <legend>1. Datos del Paciente</legend>
                <label for="paciente_dni">DNI:</label>
                <div class="input-with-button">
                    <input type="text" id="paciente_dni" name="paciente_dni" required maxlength="8">
                    <button type_button="button" id="searchPacienteBtn">Buscar</button>
                </div>
                <label for="paciente_nombres">Nombres:</label>
                <input type="text" id="paciente_nombres" name="paciente_nombres" required>
                <label for="paciente_apellidos">Apellidos:</label>
                <input type="text" id="paciente_apellidos" name="paciente_apellidos" required>
                <label for="paciente_email">Email:</label>
                <input type="email" id="paciente_email" name="paciente_email">
            </fieldset>

            <fieldset>
                <legend>2. Datos de Facturación</legend>
                <div id="billingOptions" class="radio-group">
                    <label>
                        <input type="radio" name="billingType" value="same" checked> El mismo paciente
                    </label>
                    <label>
                        <input type="radio" name="billingType" value="other"> Otra persona (familiar)
                    </label>
                    <label>
                        <input type="radio" name="billingType" value="company"> Una empresa
                    </label>
                </div>

                <div id="otherPersonInfo" class="billing-details hidden">
                    <label for="cliente_dni">DNI del Responsable:</label>
                    <div class="input-with-button">
                        <input type="text" id="cliente_dni" name="cliente_dni" maxlength="8">
                        <button type="button" id="searchClienteBtn">Buscar</button>
                    </div>
                    <label for="cliente_nombres">Nombres del Responsable:</label>
                    <input type="text" id="cliente_nombres" name="cliente_nombres">
                </div>

                <div id="companyInfo" class="billing-details hidden">
                    <label for="cliente_ruc">RUC:</label>
                    <div class="input-with-button">
                        <input type="text" id="cliente_ruc" name="cliente_ruc" maxlength="11">
                        <button type="button" id="searchRucBtn">Buscar</button>
                    </div>
                    <label for="cliente_razon_social">Razón Social:</label>
                    <input type="text" id="cliente_razon_social" name="cliente_razon_social">
                </div>
            </fieldset>
            <div class="form-actions">
                <button type="button" id="cancelBtn">Cancelar</button>
                <button type="submit">Guardar Paciente</button>
            </div>
        </form>
    </dialog>

    <dialog id="editDialog">
        <form id="editForm">
            <h2>Editar Paciente</h2>
            <input type="hidden" id="edit_id_paciente" name="id_paciente">

            <fieldset>
                <legend>1. Datos del Paciente</legend>
                <label for="edit_paciente_dni">DNI:</label>
                <div class="input-with-button">
                    <input type="text" id="edit_paciente_dni" name="dni" required maxlength="8">
                </div>
                <label for="edit_paciente_nombres">Nombres:</label>
                <input type="text" id="edit_paciente_nombres" name="nombres" required>
                <label for="edit_paciente_apellidos">Apellidos:</label>
                <input type="text" id="edit_paciente_apellidos" name="apellidos" required>
                <label for="edit_paciente_email">Email:</label>
                <input type="email" id="edit_paciente_email" name="email">
            </fieldset>
            
            <div class="form-actions">
                <button type="button" id="cancelEditBtn">Cancelar</button>
                <button type="submit">Guardar Cambios</button>
            </div>
        </form>
    </dialog>
    <script>
      console.log("Hola desde pacientes.php");  
    </script>
<script src="js/pacientes.js" type="module"></script>

<dialog id="profileDialog">
    <div class="profile-container">
        <header class="profile-header">
            <h2 id="profile-nombre_completo">Nombre del Paciente</h2>
            <p>ID de Paciente: <span id="profile-id_paciente"></span></p>
            <button id="closeProfileBtn" class="close-button" aria-label="Cerrar">&times;</button>
        </header>

        <div class="profile-body">
            <div class="profile-section">
                <h3>Datos Personales</h3>
                <p><strong>DNI:</strong> <span id="profile-dni"></span></p>
                <p><strong>Email:</strong> <span id="profile-email"></span></p>
                <p><strong>Estado:</strong> <span id="profile-estado" class="status-badge"></span></p>
            </div>

            <div class="profile-section">
                <h3>Información de Facturación</h3>
                <div id="profile-facturacion">
                    <!-- El contenido se llenará dinámicamente -->
                </div>
            </div>
        </div>

        <footer class="profile-footer">
            <button id="editProfileBtn" class="btn">Editar</button>
            <button id="viewHistoryBtn" class="btn ghost">Ver Historial</button>
        </footer>
    </div>
</dialog>
