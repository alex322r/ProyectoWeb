<div class="container">
    <h1>Gestión de Citas</h1>
    <p>Aquí puede ver, crear, reagendar y cancelar las citas de los pacientes.</p>

    <div id="calendar"></div>
</div>

<div id="appointmentModal" class="modal">
    <div class="modal-content">
        <span class="close-button">&times;</span>
        <h2 id="appointmentModalTitle">Nueva Cita</h2>
        <form id="appointmentForm">
            <input type="hidden" id="appointmentId" name="id">
            <input type="hidden" id="patientId" name="patientId">
            <div class="form-group">
                <label for="patientName">Paciente:</label>
                <input type="text" id="patientName" name="patientName" autocomplete="off" required>
                <div id="patientAutocompleteResults" class="autocomplete-results"></div>
            </div>
            <div class="form-group">
                <label for="appointmentDate">Fecha:</label>
                <input type="date" id="appointmentDate" name="date" required>
            </div>
            <div class="form-group">
                <label for="appointmentTime">Hora:</label>
                <input type="time" id="appointmentTime" name="time" required>
            </div>
            <div class="form-group">
                <label for="psychologist">Psicólogo:</label>
                <select id="psychologist" name="psychologist" required>
                    <!-- Options will be loaded dynamically -->
                </select>
            </div>
            <div class="form-group">
                <label for="status">Estado:</label>
                <select id="status" name="status">
                    <option value="programada">Programada</option>
                    <option value="confirmada">Confirmada</option>
                    <option value="cancelada">Cancelada</option>
                </select>
            </div>
            <div class="form-actions">
                <button type="submit" id="saveButton">Guardar</button>
                <button type="button" id="cancelButton">Cancelar Cita</button>
                <button type="button" id="deleteButton">Eliminar</button>
            </div>
        </form>
    </div>
</div>

<?php $scripts = "
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<script src='/js/citas.js'></script>
"; ?>
