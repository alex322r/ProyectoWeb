console.log("pacientes")

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


  // Manejar el envío del formulario
  form.addEventListener("submit", (event) => {
    event.preventDefault(); // ¡MUY IMPORTANTE! Evita que la página se recargue

    // 1. Crear un objeto con los datos
    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    console.log("Datos a enviar:", data);

    // 2. Aquí llamarías a tu backend (Paso 1, 2 y 3 de nuestra conversación anterior)
    // Ejemplo de la lógica que ejecutarías:

    // PASO 1: Crear/obtener Persona-Paciente
    // const idPersonaPaciente = await crearPersona(data.paciente_dni, data.paciente_nombres...);

    // PASO 2: Crear/obtener Cliente
    let idCliente;
    // if (data.billingType === "same") {
    //     idCliente = await crearClienteNatural(idPersonaPaciente);
    // } else if (data.billingType === "other") {
    //     const idPersonaCliente = await crearPersona(data.cliente_dni, data.cliente_nombres...);
    //     idCliente = await crearClienteNatural(idPersonaCliente);
    // } else if (data.billingType === "company") {
    //     idCliente = await crearClienteJuridico(data.cliente_ruc, data.cliente_razon_social);
    // }

    // PASO 3: Crear Paciente
    // await crearPaciente(idPersonaPaciente, idCliente);

    // 3. Simular éxito
    alert("¡Paciente registrado con éxito!");

    // 4. Cerrar el modal y limpiar
    dialog.close();
    form.reset();
  });

});
