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
        // Aquí podrías agregar una función para recargar la lista de pacientes
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

  const renderTable = (pacientes) => {
    patientsTable.innerHTML = ''; // Limpiar la tabla

    if (pacientes.length === 0) {
      patientsTable.innerHTML = '<tr><td colspan="6">No se encontraron pacientes.</td></tr>';
      return;
    }

    pacientes.forEach(paciente => {
      const row = `
        <tr>
          <td>${paciente.id_paciente}</td>
          <td>${paciente.nombres} ${paciente.apellidos}</td>
          <td>${paciente.dni}</td>
          <td>-</td>
          <td>${paciente.ultima_cita || '-'}</td>
          <td><button class="btn ghost" onclick="viewProfile(${paciente.id_paciente})">Ver Perfil</button></td>
        </tr>
      `;
      patientsTable.innerHTML += row;
    });
  };

  const search = async (searchTerm) => {
    try {
      const response = await fetch(`/pacientes/buscar?term=${encodeURIComponent(searchTerm)}`);
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
});
