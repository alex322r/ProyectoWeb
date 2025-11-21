document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.getElementById("buscarPacientePagos");
    const searchResults = document.getElementById("paciente-search-results");
    const pacienteInfoSection = document.getElementById("paciente-info-section");
    const pacienteDetails = document.getElementById("paciente-details");
    const deudasSection = document.getElementById("deudas-section");
    const historialPagosSection = document.getElementById("historial-pagos-section");
    const pagoMetodoSelect = document.getElementById("pago_metodo");

    const debounce = (func, delay) => {
        let timeoutId;
        return (...args) => {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(() => {
                func.apply(this, args);
            }, delay);
        };
    };

    const search = async (searchTerm) => {
        if (searchTerm.length < 2) {
            searchResults.innerHTML = '';
            searchResults.classList.add('hidden');
            return;
        }

        try {
            const response = await fetch(`/api/pacientes/buscar?term=${encodeURIComponent(searchTerm)}`);
            const pacientes = await response.json();
            renderSearchResults(pacientes);
        } catch (error) {
            console.error('Error en la búsqueda de pacientes:', error);
        }
    };

    const renderSearchResults = (pacientes) => {
        searchResults.innerHTML = '';
        if (pacientes.length === 0) {
            searchResults.innerHTML = '<div class="result-item">No se encontraron pacientes.</div>';
        } else {
            pacientes.forEach(paciente => {
                const item = document.createElement('div');
                item.classList.add('result-item');
                item.textContent = `${paciente.nombres} ${paciente.apellidos} (DNI: ${paciente.dni})`;
                item.dataset.id = paciente.id_paciente;
                item.dataset.nombre = `${paciente.nombres} ${paciente.apellidos}`;
                item.dataset.dni = paciente.dni;
                searchResults.appendChild(item);
            });
        }
        searchResults.classList.remove('hidden');
    };

    const selectPaciente = (paciente) => {
        searchInput.value = paciente.nombre;
        searchResults.classList.add('hidden');

        pacienteDetails.innerHTML = `
            <p><strong>Nombre:</strong> ${paciente.nombre}</p>
            <p><strong>DNI:</strong> ${paciente.dni}</p>
            <p style="display:none;"><strong>ID:</strong> ${paciente.id}</p>
        `;
        pacienteInfoSection.classList.remove('hidden');

        // Fetch and display debts and history
        fetchDeudas(paciente.id);
        fetchHistorial(paciente.id);

        deudasSection.classList.remove('hidden');
        historialPagosSection.classList.remove('hidden');
    };

    const fetchHistorial = async (id_paciente) => {
        try {
            const response = await fetch(`/api/pagos/historial/${id_paciente}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();

            if (result.success) {
                renderHistorial(result.data);
            } else {
                alert("Error al cargar el historial de pagos: " + result.message);
            }
        } catch (error) {
            console.error('Error al obtener historial de pagos:', error);
            alert("No se pudo cargar el historial de pagos del paciente.");
        }
    };

    const renderHistorial = (pagos) => {
        const historialPagosList = document.getElementById("historial-pagos-list");
        historialPagosList.innerHTML = '';
        if (pagos.length === 0) {
            historialPagosList.innerHTML = '<li>No hay pagos registrados.</li>';
            return;
        }
        pagos.forEach(pago => {
            const item = document.createElement('li');
            item.innerHTML = `
                <span>${new Date(pago.fecha_pago).toLocaleString()} - S/ ${pago.monto_pagado_paciente} - ${pago.descripcion}</span>
            `;
            historialPagosList.appendChild(item);
        });
    };

    const fetchDeudas = async (id_paciente) => {
        try {
            const response = await fetch(`/api/pagos/deudas/${id_paciente}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();

            if (result.success) {
                renderCitas(result.data.citas);
                renderPlanes(result.data.planes);
            } else {
                alert("Error al cargar las deudas: " + result.message);
            }
        } catch (error) {
            console.error('Error al obtener deudas:', error);
            alert("No se pudo cargar las deudas del paciente.");
        }
    };

    const renderCitas = (citas) => {
        const citasPendientesList = document.getElementById("citas-pendientes-list");
        citasPendientesList.innerHTML = '';
        if (citas.length === 0) {
            citasPendientesList.innerHTML = '<li>No hay citas pendientes de pago.</li>';
            return;
        }
        citas.forEach(cita => {
            const item = document.createElement('li');
            item.innerHTML = `
                <span>${cita.fecha_hora} - ${cita.motivo_consulta} (S/ ${cita.monto_sugerido})</span>
                <button class="btn btn-sm" data-type="cita" data-id="${cita.id_cita}" data-monto="${cita.monto_sugerido}" data-descripcion="Cita: ${cita.fecha_hora}">Registrar Pago</button>
            `;
            citasPendientesList.appendChild(item);
        });
    };

    const renderPlanes = (planes) => {
        const planesPendientesList = document.getElementById("planes-pendientes-list");
        planesPendientesList.innerHTML = '';
        if (planes.length === 0) {
            planesPendientesList.innerHTML = '<li>No hay planes pendientes de pago.</li>';
            return;
        }
        planes.forEach(plan => {
            const item = document.createElement('li');
            item.innerHTML = `
                <span>${plan.nombre_plan} (S/ ${plan.monto_sugerido})</span>
                <button class="btn btn-sm" data-type="plan" data-id="${plan.id_plan_paciente}" data-monto="${plan.monto_sugerido}" data-descripcion="Plan: ${plan.nombre_plan}">Registrar Pago</button>
            `;
            planesPendientesList.appendChild(item);
        });
    };

    const openRegistrarPagoModal = (type, id, monto, descripcion) => {
        const dialog = document.getElementById("registrarPagoDialog");
        document.getElementById("pago_tipo_deuda").value = type;
        document.getElementById("pago_id_deuda").value = id;
        document.getElementById("pago_descripcion_deuda").textContent = descripcion;
        document.getElementById("pago_monto_total").textContent = monto;
        document.getElementById("pago_monto").value = monto;
        
        dialog.showModal();
    };

    document.getElementById('deudas-section').addEventListener('click', (event) => {
        if (event.target.tagName === 'BUTTON' && event.target.dataset.id) {
            const { type, id, monto, descripcion } = event.target.dataset;
            openRegistrarPagoModal(type, id, monto, descripcion);
        }
    });
    
    // Populate payment methods
    if (typeof metodos_pago !== 'undefined' && metodos_pago.length > 0) {
        metodos_pago.forEach(metodo => {
            const option = document.createElement('option');
            option.value = metodo.id_metodo_pago;
            option.textContent = metodo.tipo;
            pagoMetodoSelect.appendChild(option);
        });
    }

    searchInput.addEventListener("input", debounce((event) => {
        search(event.target.value);
    }, 300));

    searchResults.addEventListener("click", (event) => {
        if (event.target.classList.contains('result-item') && event.target.dataset.id) {
            const paciente = {
                id: event.target.dataset.id,
                nombre: event.target.dataset.nombre,
                dni: event.target.dataset.dni,
            };
            selectPaciente(paciente);
        }
    });

    // Hide search results when clicking outside
    document.addEventListener("click", (event) => {
        if (!searchResults.contains(event.target) && event.target !== searchInput) {
            searchResults.classList.add('hidden');
        }
    });

    const registrarPagoForm = document.getElementById("registrarPagoForm");
    registrarPagoForm.addEventListener("submit", async (event) => {
        event.preventDefault();

        const dialog = document.getElementById("registrarPagoDialog");
        const tipo_deuda = document.getElementById("pago_tipo_deuda").value;
        const id_deuda = document.getElementById("pago_id_deuda").value;
        const monto = document.getElementById("pago_monto").value;
        const id_metodo_pago = document.getElementById("pago_metodo").value;

        try {
            const response = await fetch('/api/pagos/crear', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    tipo_deuda,
                    id_deuda,
                    monto,
                    id_metodo_pago
                })
            });

            const result = await response.json();

            if (result.success) {
                alert("Pago registrado exitosamente.");
                dialog.close();
                // Refresh the debts and history lists
                const pacienteIdText = document.getElementById("paciente-details").querySelector("p:nth-child(3)").textContent;
                const pacienteId = pacienteIdText.split(": ")[1];
                fetchDeudas(pacienteId);
                fetchHistorial(pacienteId);
            } else {
                alert("Error al registrar el pago: " + result.message);
            }
        } catch (error) {
            console.error('Error al registrar el pago:', error);
            alert("No se pudo registrar el pago.");
        }
    });

    const cancelarPagoBtn = document.getElementById("cancelarPagoBtn");
    cancelarPagoBtn.addEventListener("click", () => {
        const dialog = document.getElementById("registrarPagoDialog");
        dialog.close();
    });
});
