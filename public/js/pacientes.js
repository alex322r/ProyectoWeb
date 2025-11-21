document.addEventListener("DOMContentLoaded", () => {


  // --- 1. Seleccionar Elementos del DOM ---
  const dialog = document.getElementById("registerDialog");
  const openBtn = document.getElementById("openRegisterBtn");
  const cancelBtn = document.getElementById("cancelBtn");
  const form = document.getElementById("registerForm");

  // Opciones de facturación
  const billingOptions = document.querySelectorAll('input[name="billingType"]');
  const otherPersonInfo = document.getElementById("otherPersonInfo");
  const companyInfo = document.getElementById("companyInfo");

  // Botones de búsqueda (simulados)
  const searchPacienteBtn = document.getElementById("searchPacienteBtn");
  const searchClienteBtn = document.getElementById("searchClienteBtn");
  const searchRucBtn = document.getElementById("searchRucBtn");

  // --- 2. Lógica para Abrir y Cerrar el Diálogo ---

  // Abrir el diálogo
  openBtn.addEventListener("click", () => {
    form.reset(); // Limpia el formulario cada vez que se abre
    handleBillingChange(); // Resetea la vista de facturación
    dialog.showModal(); // Función nativa para abrir el diálogo modal
  });

  // Cerrar con el botón "Cancelar"
  cancelBtn.addEventListener("click", () => {
    dialog.close(); // Función nativa para cerrar
  });

  // (Opcional) El <dialog> se cierra nativamente con 'Esc'
  // (Opcional) Si quieres cerrarlo al hacer clic fuera (en el backdrop):
  dialog.addEventListener("click", (event) => {
    if (event.target === dialog) {
      dialog.close();
    }
  });

  // --- 3. Lógica del Formulario ---

  // Manejar el cambio en las opciones de facturación
  const handleBillingChange = () => {
    const selectedType = document.querySelector('input[name="billingType"]:checked').value;

    // Ocultar todos los detalles primero
    otherPersonInfo.classList.add("hidden");
    companyInfo.classList.add("hidden");

    if (selectedType === "other") {
      otherPersonInfo.classList.remove("hidden");
    } else if (selectedType === "company") {
      companyInfo.classList.remove("hidden");
    }
    // Si es "same", no se muestra nada extra
  };

  // Asignar el evento a CADA botón de radio
  billingOptions.forEach(option => {
    option.addEventListener("change", handleBillingChange);
  });

  // --- 4. Lógica de Búsqueda y Envío (Simulada) ---

  // Simular búsqueda de DNI Paciente
  searchPacienteBtn.addEventListener("click", (e) => {
    e.preventDefault(); // Evita que el botón envíe el formulario
    const dni = document.getElementById("paciente_dni").value;
    if (dni) {
      alert(`Buscando DNI del paciente: ${dni}...\n(Aquí se llenarían los campos si se encuentra)`);
      // Simulación: Rellenar campos
      // document.getElementById("paciente_nombres").value = "Ana";
      // document.getElementById("paciente_apellidos").value = "García";
    }
  });

  // Simular búsqueda de DNI Cliente
  searchClienteBtn.addEventListener("click", (e) => {
    e.preventDefault();
    alert("Buscando DNI del responsable...");
  });

  // Simular búsqueda de RUC
  searchRucBtn.addEventListener("click", (e) => {
    e.preventDefault();
    alert("Buscando RUC de la empresa...");
  });


  form.addEventListener("submit", async (event) => {
    event.preventDefault();

    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    try {
      const response = await fetch('/pacientes/crear', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });

      const result = await response.json();

      if (result.success) {
        alert("¡Paciente registrado con éxito!");
        dialog.close();
        form.reset();
        window.location.reload();
      } else {
        alert("Error al registrar el paciente: " + result.message);
      }
    } catch (error) {
      console.error('Error de red:', error);
      alert("Ocurrió un error de red. Inténtalo de nuevo.");
    }
  });  const searchInput = document.getElementById("buscarPaciente");
  const patientsTable = document.getElementById("patientsTable");

  const debounce = (func, delay) => {
    let timeoutId;
    return (...args) => {
      clearTimeout(timeoutId);
      timeoutId = setTimeout(() => {
        func.apply(this, args);
      }, delay);
    };
  };

  const userRole = document.querySelector('meta[name="user-role"]').getAttribute('content');

  const renderTable = (pacientes) => {
    patientsTable.innerHTML = ''; // Limpiar la tabla

    if (pacientes.length === 0) {
      patientsTable.innerHTML = '<tr><td colspan="6">No se encontraron pacientes.</td></tr>';
      return;
    }

    pacientes.forEach(paciente => {
        let actionsHtml = `<button class="btn ghost" onclick="viewProfile(${paciente.id_paciente})">Ver Perfil</button>`;
        
        if (userRole === 'psicologo' || userRole === 'administrador') {
            actionsHtml += `<a href="/pacientes/expediente/${paciente.id_paciente}" class="btn">Ver Expediente</a>`;
        }

        if (userRole === 'psicologo') {
            actionsHtml += `<div class="dropdown">
                                <button class="btn dropdown-toggle">Cambiar Estado</button>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item" data-id="${paciente.id_paciente}" data-estado="en tratamiento">En Tratamiento</a>
                                    <a href="#" class="dropdown-item" data-id="${paciente.id_paciente}" data-estado="alta">Dar de Alta</a>
                                    <a href="#" class="dropdown-item" data-id="${paciente.id_paciente}" data-estado="suspendido">Suspender</a>
                                </div>
                            </div>`;
        }

        if (userRole === 'administrador' || userRole === 'recepcionista') {
            actionsHtml += `<button class="btn btn-edit" onclick="openEditPatientModal(${paciente.id_paciente})">Editar</button>`;
            actionsHtml += `<button class="btn btn-danger" onclick="deletePatient(${paciente.id_paciente})">Eliminar</button>`;
        }

        const ultimaCitaTd = `
            <td class="ultima-cita-cell"
                data-estado-cita="${paciente.estado_cita || ''}"
                data-monto-pago="${paciente.monto_pago || ''}"
                data-estado-pago="${paciente.estado_pago || ''}">
                ${paciente.ultima_cita || '-'}
            </td>
        `;

        const row = `
            <tr>
              <td>${paciente.id_paciente}</td>
              <td>${paciente.nombres} ${paciente.apellidos}</td>
              <td>${paciente.dni}</td>
              <td class="status-cell">
                  <span class="status-badge status-${paciente.estado.replace(' ', '-')}">
                      ${paciente.estado}
                  </span>
              </td>
              ${ultimaCitaTd}
              <td class="actions-cell">${actionsHtml}</td>
            </tr>
        `;
        patientsTable.innerHTML += row;
    });
  };

  const search = async (searchTerm) => {
    try {
      const response = await fetch(`/api/pacientes/buscar?term=${encodeURIComponent(searchTerm)}`);
      const pacientes = await response.json();
      renderTable(pacientes);
    } catch (error) {
      console.error('Error en la búsqueda:', error);
      patientsTable.innerHTML = '<tr><td colspan="6">Error al cargar los datos.</td></tr>';
    }
  };

  const debouncedSearch = debounce(search, 300);

  searchInput.addEventListener("input", (event) => {
    debouncedSearch(event.target.value);
  });

  // --- Lógica para el Perfil del Paciente ---
  const profileDialog = document.getElementById("profileDialog");
  const closeProfileBtn = document.getElementById("closeProfileBtn");

  const populateProfile = (data) => {
    document.getElementById("profile-id_paciente").textContent = data.id_paciente;
    document.getElementById("profile-nombre_completo").textContent = data.nombre_completo;
    document.getElementById("profile-dni").textContent = data.dni;
    document.getElementById("profile-email").textContent = data.email;
    
    const estadoBadge = document.getElementById("profile-estado");
    estadoBadge.textContent = data.estado;
    estadoBadge.className = `status-badge status-${data.estado.toLowerCase().replace(' ', '-')}`;

    const facturacionDiv = document.getElementById("profile-facturacion");
    let facturacionHTML = `<p><strong>Tipo:</strong> ${data.facturacion.tipo}</p>`;
    if (data.facturacion.tipo === 'Otro responsable') {
      facturacionHTML += `<p><strong>Nombre:</strong> ${data.facturacion.nombre}</p>`;
      facturacionHTML += `<p><strong>DNI:</strong> ${data.facturacion.dni}</p>`;
    } else if (data.facturacion.tipo === 'Empresa') {
      facturacionHTML += `<p><strong>Razón Social:</strong> ${data.facturacion.razon_social}</p>`;
      facturacionHTML += `<p><strong>RUC:</strong> ${data.facturacion.ruc}</p>`;
    }
    facturacionDiv.innerHTML = facturacionHTML;
  };

  window.viewProfile = async (id) => {
    try {
      const response = await fetch(`/pacientes/ver/${id}`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const result = await response.json();

      if (result.success) {
        populateProfile(result.data);
        profileDialog.showModal();
      } else {
        alert("Error al cargar el perfil: " + result.message);
      }
    } catch (error) {
      console.error('Error al obtener el perfil del paciente:', error);
      alert("No se pudo cargar el perfil del paciente.");
    }
  };

  // Cerrar el diálogo de perfil
  closeProfileBtn.addEventListener("click", () => profileDialog.close());

  profileDialog.addEventListener("click", (event) => {
    if (event.target === profileDialog) {
      profileDialog.close();
    }
  });

  window.deletePatient = async (id) => {
    if (!confirm(`¿Estás seguro de que quieres eliminar al paciente con ID ${id}?`)) {
      return;
    }

    try {
      const response = await fetch(`/pacientes/eliminar/${id}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        }
      });

      const result = await response.json();

      if (result.success) {
        alert("Paciente eliminado con éxito.");
        window.location.reload();
      } else {
        alert("Error al eliminar el paciente: " + result.message);
      }
    } catch (error) {
      console.error('Error de red:', error);
      alert("Ocurrió un error de red. Inténtalo de nuevo.");
    }
  };

    document.getElementById('patientsTable').addEventListener('click', async (event) => {
        const target = event.target;
        
        // Handle status change dropdown
        if (target.classList.contains('dropdown-item')) {
            event.preventDefault();
            const id_paciente = target.dataset.id;
            const estado = target.dataset.estado;

            if (confirm(`¿Estás seguro de cambiar el estado del paciente a "${estado}"?`)) {
                try {
                    const response = await fetch('/pacientes/actualizarEstado', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ id_paciente, estado })
                    });
                    const result = await response.json();
                    if (result.success) {
                        alert(result.message);
                        window.location.reload(); 
                    } else {
                        alert(`Error: ${result.message}`);
                    }
                } catch (error) {
                    console.error('Error al actualizar el estado:', error);
                    alert('Error al conectar con el servidor para actualizar el estado.');
                }
            }
        }

        // Handle tooltip for last appointment
        const cell = target.closest('.ultima-cita-cell');
        if (cell) {
            event.stopPropagation();
            if (tooltip.classList.contains('hidden')) {
                showTooltip(cell);
            } else {
                hideTooltip();
            }
        }
    });

    const tooltip = document.getElementById('cita-tooltip');
    const showTooltip = (cell) => {
        const estadoCita = cell.dataset.estadoCita || 'No disponible';
        const montoPago = cell.dataset.montoPago ? `$${cell.dataset.montoPago}` : 'No disponible';
        const estadoPago = cell.dataset.estadoPago || 'No disponible';

        const estadoCitaSpan = document.getElementById('tooltip-estado-cita');
        estadoCitaSpan.textContent = estadoCita;
        estadoCitaSpan.className = `status-badge status-${estadoCita.replace(' ', '-')}`;

        document.getElementById('tooltip-monto-pago').textContent = montoPago;

        const estadoPagoSpan = document.getElementById('tooltip-estado-pago');
        estadoPagoSpan.textContent = estadoPago;
        estadoPagoSpan.className = `status-badge status-${estadoPago.replace(' ', '-')}`;

        const rect = cell.getBoundingClientRect();
        tooltip.style.left = `${rect.left + window.scrollX}px`;
        tooltip.style.top = `${rect.bottom + window.scrollY}px`;
        tooltip.classList.remove('hidden');
    };

    const hideTooltip = () => {
        tooltip.classList.add('hidden');
    };

    document.addEventListener('click', (e) => {
        if (!e.target.closest('.ultima-cita-cell') && !e.target.closest('#cita-tooltip')) {
            hideTooltip();
        }
    });

    // --- Lógica para Editar Paciente ---
    const editDialog = document.getElementById("editDialog");
    const editForm = document.getElementById("editForm");
    const cancelEditBtn = document.getElementById("cancelEditBtn");
    const editProfileBtn = document.getElementById("editProfileBtn");

    // Abrir el diálogo de edición y cargar datos
    window.openEditPatientModal = async (id_paciente) => {
        try {
            const response = await fetch(`/pacientes/ver/${id_paciente}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();

            if (result.success) {
                const paciente = result.data;
                document.getElementById("edit_id_paciente").value = paciente.id_paciente;
                document.getElementById("edit_paciente_dni").value = paciente.dni;
                document.getElementById("edit_paciente_nombres").value = paciente.nombre_completo.split(' ')[0]; // Assuming first word is name
                document.getElementById("edit_paciente_apellidos").value = paciente.nombre_completo.split(' ').slice(1).join(' '); // Assuming rest are surnames
                document.getElementById("edit_paciente_email").value = paciente.email === 'No registrado' ? '' : paciente.email;
                
                editDialog.showModal();
            } else {
                alert("Error al cargar los datos del paciente para edición: " + result.message);
            }
        } catch (error) {
            console.error('Error al obtener el paciente para edición:', error);
            alert("No se pudo cargar el paciente para edición.");
        }
    };

    // Cerrar el diálogo de edición
    cancelEditBtn.addEventListener("click", () => {
        editDialog.close();
    });

    editDialog.addEventListener("click", (event) => {
        if (event.target === editDialog) {
            editDialog.close();
        }
    });

    // Manejar el envío del formulario de edición
    editForm.addEventListener("submit", async (event) => {
        event.preventDefault();

        const id_paciente = document.getElementById("edit_id_paciente").value;
        const formData = new FormData(editForm);
        const data = Object.fromEntries(formData.entries());

        try {
            const response = await fetch(`/pacientes/actualizar/${id_paciente}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            if (result.success) {
                alert("¡Paciente actualizado con éxito!");
                editDialog.close();
                window.location.reload(); 
            } else {
                alert("Error al actualizar el paciente: " + result.message);
            }
        } catch (error) {
            console.error('Error de red al actualizar paciente:', error);
            alert("Ocurrió un error de red al actualizar el paciente.");
        }
    });

    // Link editProfileBtn to openEditPatientModal
    editProfileBtn.addEventListener("click", () => {
        const id_paciente = document.getElementById("profile-id_paciente").textContent;
        profileDialog.close(); // Close profile dialog first
        openEditPatientModal(parseInt(id_paciente));
    });
});

