        <div id="pacientes" class="" role="region" aria-label="Pacientes">
          <div class="view-header">
             <div>
                <h3>Pacientes</h3>
                <p>Buscar, crear y administrar pacientes</p>
             </div>
            <div class="header-actions">
              <input id="buscarPaciente" type="search" placeholder="Buscar por nombre o DNI" />
              <button id="openRegisterBtn" class="btn">+ Nuevo Paciente</button>
            </div>
          </div>

          <div class="table-wrap">
            <table>
              <thead><tr><th>#</th><th>Nombre completo</th><th>DNI</th><th>Plan</th><th>Últ. cita</th><th>Acciones</th></tr></thead>
              <tbody id="patientsTable">
                <?php if (isset($pacientes) && !empty($pacientes)): ?>
                  <?php foreach ($pacientes as $paciente): ?>
                    <tr>
                      <td><?php echo htmlspecialchars($paciente['id_paciente']); ?></td>
                      <td><?php echo htmlspecialchars($paciente['nombres'] . ' ' . $paciente['apellidos']); ?></td>
                      <td><?php echo htmlspecialchars($paciente['dni']); ?></td>
                      <td>-</td>
                      <td><?php echo htmlspecialchars($paciente['ultima_cita'] ? $paciente['ultima_cita'] : '-'); ?></td>
                  <td>
                        <button class="btn ghost" onclick="viewProfile(<?php echo htmlspecialchars($paciente['id_paciente']); ?>)">Ver Perfil</button>
                        <button class="btn btn-danger" onclick="deletePatient(<?php echo htmlspecialchars($paciente['id_paciente']); ?>)">Eliminar</button>
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
