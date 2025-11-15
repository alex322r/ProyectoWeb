document.addEventListener("DOMContentLoaded", () => {
    // --- 1. Seleccionar Elementos del DOM ---
    const registerDialog = document.getElementById("registerDialog");
    const openPlanesBtn = document.getElementById("openPlanesBtn");
    const cancelRegisterBtn = registerDialog.querySelector("#cancelBtn");
    const registerForm = document.getElementById("registerForm");

    const editDialog = document.getElementById("editDialog");
    const cancelEditBtn = editDialog.querySelector("#cancelEditBtn");
    const editForm = document.getElementById("editForm");

    const buscarPlanInput = document.getElementById("buscarPlan");
    const planesTableBody = document.getElementById("planesTable");

    // --- 2. Lógica para Abrir y Cerrar el Diálogo de Registro ---

    openPlanesBtn.addEventListener("click", () => {
        registerForm.reset(); // Limpia el formulario
        registerForm.action = "/planes/crear"; // Asegura que la acción sea la de crear
        registerDialog.querySelector('h2').textContent = "Registro de Plan"; // Restaura el título
        registerDialog.querySelector('button[type="submit"]').textContent = "Guardar Plan"; // Restaura el texto del botón
        registerDialog.showModal(); // Abre el diálogo
    });

    cancelRegisterBtn.addEventListener("click", () => {
        registerDialog.close();
    });

    registerDialog.addEventListener("click", (event) => {
        if (event.target === registerDialog) {
            registerDialog.close();
        }
    });

    // --- 3. Lógica para Abrir y Cerrar el Diálogo de Edición ---

    window.editPlan = async (id) => {
        try {
            const response = await fetch(`/planes/obtener/${id}`);
            if (!response.ok) {
                throw new Error("Error al obtener los datos del plan.");
            }
            const data = await response.json();

            // Llenar el formulario de edición con los datos del plan
            editForm.querySelector('#edit_id_plan').value = data.id_plan;
            editForm.querySelector('#edit_nombre').value = data.nombre;
            editForm.querySelector('#edit_descripcion').value = data.descripcion;
            editForm.querySelector('#edit_numero_sesiones').value = data.numero_sesiones;
            editForm.querySelector('#edit_precio').value = data.precio;
            editForm.querySelector('#edit_descuento').value = data.descuento;
            editForm.querySelector('#edit_duracion_meses').value = data.duracion_meses;
            editForm.querySelector('#edit_activo').checked = data.activo == 1;

            // Cambiar la acción del formulario
            editForm.action = `/planes/editar/${id}`;
            editDialog.showModal();
        } catch (error) {
            console.error(error);
            alert("No se pudo cargar el plan para editar.");
        }
    };

    cancelEditBtn.addEventListener("click", () => {
        editDialog.close();
    });

    editDialog.addEventListener("click", (event) => {
        if (event.target === editDialog) {
            editDialog.close();
        }
    });

    // --- 4. Lógica de Búsqueda ---
    buscarPlanInput.addEventListener("keyup", () => {
        const searchTerm = buscarPlanInput.value.toLowerCase();
        const rows = planesTableBody.querySelectorAll("tr");

        rows.forEach(row => {
            const nombre = row.children[1].textContent.toLowerCase(); // Columna del nombre
            if (nombre.includes(searchTerm)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    });
});
