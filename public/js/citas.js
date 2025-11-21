document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');
    const appointmentModal = document.getElementById('appointmentModal');
    const closeModal = document.querySelector('.close-button');
    const appointmentForm = document.getElementById('appointmentForm');
    const appointmentModalTitle = document.getElementById('appointmentModalTitle');
    const appointmentId = document.getElementById('appointmentId');
    const patientId = document.getElementById('patientId');
    const patientName = document.getElementById('patientName');
    const patientAutocompleteResults = document.getElementById('patientAutocompleteResults');
    const appointmentDate = document.getElementById('appointmentDate');
    const appointmentTime = document.getElementById('appointmentTime');
    const psychologist = document.getElementById('psychologist');
    const status = document.getElementById('status');
    const saveButton = document.getElementById('saveButton');
    const cancelButton = document.getElementById('cancelButton');
    const deleteButton = document.getElementById('deleteButton');

    let calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: '/api/citas',
        dateClick: function(info) {
            openModal(info.dateStr);
        },
        eventClick: function(info) {
            openModal(info.event.startStr, info.event);
        }
    });

    calendar.render();

    function openModal(date, event = null) {
        appointmentForm.reset();
        patientId.value = '';
        patientAutocompleteResults.innerHTML = '';

        if (event) {
            appointmentModalTitle.textContent = 'Editar Cita';
            appointmentId.value = event.id;
            patientName.value = event.title;
            patientId.value = event.extendedProps.id_paciente;
            const eventDate = new Date(event.start);
            appointmentDate.value = eventDate.toISOString().split('T')[0];
            appointmentTime.value = eventDate.toTimeString().split(' ')[0].substring(0, 5);
            psychologist.value = event.extendedProps.id_empleado_psicologo;
            status.value = event.extendedProps.status;
            saveButton.textContent = 'Reagendar';
            cancelButton.style.display = 'inline-block';
            deleteButton.style.display = 'inline-block';
        } else {
            appointmentModalTitle.textContent = 'Nueva Cita';
            appointmentId.value = '';
            appointmentDate.value = date;
            saveButton.textContent = 'Guardar';
            cancelButton.style.display = 'none';
            deleteButton.style.display = 'none';
        }
        appointmentModal.style.display = 'block';
    }

    closeModal.onclick = function() {
        appointmentModal.style.display = 'none';
    }

    window.onclick = function(event) {
        if (event.target == appointmentModal) {
            appointmentModal.style.display = 'none';
        }
    }

    // Load psychologists
    fetch('/api/empleados/listar/psicologo')
        .then(response => response.json())
        .then(data => {
            psychologist.innerHTML = '';
            data.forEach(psico => {
                const option = document.createElement('option');
                option.value = psico.id_empleado;
                option.textContent = psico.nombre_completo;
                psychologist.appendChild(option);
            });
        });

    patientName.addEventListener('input', function() {
        const searchTerm = patientName.value;
        if (searchTerm.length < 2) {
            patientAutocompleteResults.innerHTML = '';
            return;
        }

        fetch(`/api/pacientes/buscar?term=${searchTerm}`)
            .then(response => response.json())
            .then(data => {
                patientAutocompleteResults.innerHTML = '';
                data.forEach(p => {
                    const div = document.createElement('div');
                    div.textContent = `${p.nombres} ${p.apellidos}`;
                    div.addEventListener('click', function() {
                        patientName.value = `${p.nombres} ${p.apellidos}`;
                        patientId.value = p.id_paciente;
                        patientAutocompleteResults.innerHTML = '';
                    });
                    patientAutocompleteResults.appendChild(div);
                });
            });
    });

    appointmentForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const formData = new FormData(appointmentForm);
        const id = formData.get('id');
        const url = id ? `/api/citas/update/${id}` : '/api/citas/create';

        fetch(url, {
            method: 'POST',
            body: new URLSearchParams(formData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                calendar.refetchEvents();
                appointmentModal.style.display = 'none';
            } else {
                alert('Error: ' + data.message);
            }
        });
    });

    cancelButton.addEventListener('click', function() {
        const id = appointmentId.value;
        if (id && confirm('¿Está seguro de que desea cancelar esta cita?')) {
            fetch(`/api/citas/cancel/${id}`, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    calendar.refetchEvents();
                    appointmentModal.style.display = 'none';
                } else {
                    alert('Error: ' + data.message);
                }
            });
        }
    });

    deleteButton.addEventListener('click', function() {
        const id = appointmentId.value;
        if (id && confirm('¿Está seguro de que desea eliminar esta cita?')) {
            fetch(`/api/citas/delete/${id}`, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    calendar.refetchEvents();
                    appointmentModal.style.display = 'none';
                } else {
                    alert('Error: ' + data.message);
                }
            });
        }
    });
});
