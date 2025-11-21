<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Agenda de Citas</h3>
                    <h6 class="font-weight-normal mb-0">Aquí puedes gestionar todas tus citas.</h6>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Calendario de Citas</h4>
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="appointment-modal" class="modal">
    <div class="modal-content">
        <span class="close-button">&times;</span>
        <h2 id="modal-title">Nueva Cita</h2>
        <form id="appointment-form">
            <input type="hidden" id="id_cita" name="id_cita">
            
            <label for="id_paciente">Paciente:</label>
            <select id="id_paciente" name="id_paciente" required></select>

            <?php if ($_SESSION['user_role'] !== 'psicologo'): ?>
            <label for="id_empleado_psicologo">Psicólogo:</label>
            <select id="id_empleado_psicologo" name="id_empleado_psicologo" required></select>
            <?php endif; ?>

            <label for="fecha_hora">Fecha y Hora:</label>
            <input type="datetime-local" id="fecha_hora" name="fecha_hora" required>

            <label for="motivo_consulta">Motivo de la consulta:</label>
            <textarea id="motivo_consulta" name="motivo_consulta" rows="3" required></textarea>

            <div class="form-buttons">
                <button type="submit" id="save-button">Guardar</button>
                <button type="button" id="cancel-button">Cancelar</button>
                <button type="button" id="delete-button" class="delete" style="display:none;">Eliminar</button>
            </div>
        </form>
    </div>
</div>

<?php ob_start(); ?>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const userRole = '<?php echo $_SESSION['user_role'] ?? ''; ?>';
        const calendarEl = document.getElementById('calendar');
        const modal = document.getElementById('appointment-modal');
        const modalTitle = document.getElementById('modal-title');
        const closeButton = document.querySelector('.close-button');
        const cancelButton = document.getElementById('cancel-button');
        const form = document.getElementById('appointment-form');
        const idCitaInput = document.getElementById('id_cita');
        const idPacienteSelect = document.getElementById('id_paciente');
        const idEmpleadoPsicologoSelect = document.getElementById('id_empleado_psicologo');
        const fechaHoraInput = document.getElementById('fecha_hora');
        const motivoConsultaInput = document.getElementById('motivo_consulta');
        const saveButton = document.getElementById('save-button');
        const deleteButton = document.getElementById('delete-button');

        let calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'es',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            events: '/api/citas',
            selectable: true,
            dateClick: function(info) {
                if (userRole === 'psicologo') {
                    return; // Psicologo cannot create new appointments
                }
                openModal();
                modalTitle.textContent = 'Nueva Cita';
                form.reset();
                idCitaInput.value = '';
                fechaHoraInput.value = info.dateStr + 'T09:00'; // Default time
                deleteButton.style.display = 'none';
            },
            eventClick: async function(info) {
                // Reset form state first
                modalTitle.textContent = 'Ver Cita';
                form.reset();
                idPacienteSelect.disabled = false;
                if (idEmpleadoPsicologoSelect) idEmpleadoPsicologoSelect.disabled = false;
                fechaHoraInput.disabled = false;
                motivoConsultaInput.disabled = false;
                saveButton.style.display = 'inline-block';
                deleteButton.style.display = 'none';

                openModal();
                await populateSelects(); // Wait for selects to be populated

                idCitaInput.value = info.event.id;
                
                // Fetch appointment details and populate the form
                try {
                    const response = await fetch(`/api/citas/${info.event.id}`);
                    const data = await response.json();
                    
                    idPacienteSelect.value = data.id_paciente;
                    if (idEmpleadoPsicologoSelect) {
                        idEmpleadoPsicologoSelect.value = data.id_empleado_psicologo;
                    }
                    fechaHoraInput.value = data.fecha_hora.replace(' ', 'T');
                    motivoConsultaInput.value = data.motivo_consulta;

                    // Apply permissions based on role
                    if (userRole === 'psicologo') {
                        modalTitle.textContent = 'Detalles de la Cita';
                        saveButton.style.display = 'none';
                        deleteButton.style.display = 'none';
                        idPacienteSelect.disabled = true;
                        if (idEmpleadoPsicologoSelect) idEmpleadoPsicologoSelect.disabled = true;
                        fechaHoraInput.disabled = true;
                        motivoConsultaInput.disabled = true;
                    } else {
                        modalTitle.textContent = 'Editar Cita';
                        saveButton.style.display = 'inline-block';
                        deleteButton.style.display = 'inline-block';
                    }
                } catch (error) {
                    console.error('Error fetching appointment details:', error);
                    alert('No se pudieron cargar los detalles de la cita.');
                    closeModal();
                }
            }
        });

        calendar.render();

        function openModal() {
            modal.style.display = 'block';
        }

        function closeModal() {
            modal.style.display = 'none';
        }

        async function populateSelects() {
            const patientPromise = fetch('/api/pacientes/buscar')
                .then(response => response.json())
                .then(pacientes => {
                    idPacienteSelect.innerHTML = '<option value="">Seleccione un paciente</option>';
                    pacientes.forEach(p => {
                        idPacienteSelect.innerHTML += `<option value="${p.id_paciente}">${p.nombres} ${p.apellidos}</option>`;
                    });
                });

            let psychologistPromise = Promise.resolve();
            if (idEmpleadoPsicologoSelect) {
                psychologistPromise = fetch('/api/empleados/listar/psicologo')
                    .then(response => response.json())
                    .then(psicologos => {
                        idEmpleadoPsicologoSelect.innerHTML = '<option value="">Seleccione un psicólogo</option>';
                        psicologos.forEach(p => {
                            idEmpleadoPsicologoSelect.innerHTML += `<option value="${p.id_empleado}">${p.nombres} ${p.apellidos}</option>`;
                        });
                    });
            }
            
            return Promise.all([patientPromise, psychologistPromise]).catch(error => {
                console.error('Error populating selects:', error);
            });
        }

        form.addEventListener('submit', async function(e) {
            e.preventDefault();
            const id_cita = idCitaInput.value;
            const url = id_cita ? `/agenda/actualizar/${id_cita}` : '/agenda/crear';
            const method = 'POST';

            const formData = new FormData(form);
            const data = Object.fromEntries(formData.entries());

            try {
                const response = await fetch(url, {
                    method: method,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });

                if (response.ok) {
                    closeModal();
                    calendar.refetchEvents();
                } else {
                    const result = await response.json();
                    alert(result.message);
                }
            } catch (error) {
                console.error('Error saving appointment:', error);
                alert('Error al guardar la cita.');
            }
        });

        deleteButton.addEventListener('click', async function() {
            const id_cita = idCitaInput.value;
            if (id_cita && confirm('¿Estás seguro de que quieres cancelar esta cita?')) {
                try {
                    const response = await fetch(`/agenda/cancelar/${id_cita}`, {
                        method: 'POST'
                    });

                    if (response.ok) {
                        closeModal();
                        calendar.refetchEvents();
                    } else {
                        const result = await response.json();
                        alert(result.message);
                    }
                } catch (error) {
                    console.error('Error canceling appointment:', error);
                    alert('Error al cancelar la cita.');
                }
            }
        });

        closeButton.addEventListener('click', closeModal);
        cancelButton.addEventListener('click', closeModal);
        window.addEventListener('click', function(event) {
            if (event.target == modal) {
                closeModal();
            }
        });
    });
</script>
<?php $scripts = ob_get_clean(); ?>
