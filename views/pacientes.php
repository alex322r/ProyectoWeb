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
                <tr>
                  <td>1</td>
                  <td>Alexis Rodriguez</td>
                  <td>87654321</td>
                  <td>Plan 10 sesiones</td>
                  <td>2025-10-02</td>
                  <td><button class="btn ghost" onclick="viewProfile(1)">Ver Perfil</button></td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>William Ríos</td>
                  <td>71234567</td>
                  <td>-</td>
                  <td>2025-09-28</td>
                  <td><button class="btn ghost" onclick="viewProfile(2)">Ver Perfil</button></td>
                </tr>
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
<script src="js/pacientes.js" type="module"></script>
