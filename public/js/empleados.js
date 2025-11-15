document.addEventListener("DOMContentLoaded", () => {
    // --- 1. Seleccionar Elementos del DOM ---
    const dialog = document.getElementById("registerDialog");
    const openBtn = document.getElementById("openEmpleadosBtn");
    const cancelBtn = document.getElementById("cancelBtn");
    const form = document.getElementById("registerForm");

    // --- 2. Lógica para Abrir y Cerrar el Diálogo ---

    // Abrir el diálogo para un nuevo empleado
    openBtn.addEventListener("click", () => {
        form.reset(); // Limpia el formulario
        form.action = "/empleados/crear"; // Asegura que la acción sea la de crear
        form.querySelector('h2').textContent = "Registro de Empleado"; // Restaura el título
        form.querySelector('button[type="submit"]').textContent = "Guardar Empleado"; // Restaura el texto del botón
        dialog.showModal(); // Abre el diálogo
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

    window.editProfile = async (id) => {
        try {
            const response = await fetch(`/empleados/ver/${id}`);
            if (!response.ok) {
                throw new Error("Error al obtener los datos del empleado.");
            }
            const data = await response.json();

            // Llenar el formulario con los datos del empleado
            form.querySelector('#empleado_dni').value = data.dni;
            const [nombres, ...apellidos] = data.nombre_completo.split(' ');
            form.querySelector('#empleado_nombres').value = nombres;
            form.querySelector('#empleado_apellidos').value = apellidos.join(' ');
            form.querySelector('#empleado_email').value = data.email;
            form.querySelector('#empleado_direccion').value = data.direccion;
            form.querySelector('#empleado_telefono').value = data.telefono;
            form.querySelector('#empleado_fecha_nacimiento').value = data.fecha_nacimiento;
            form.querySelector('#empleado_rol').value = data.rol;

            // Cambiar la acción del formulario y el título del diálogo
            form.action = `/empleados/editar/${id}`;
            form.querySelector('h2').textContent = "Editar Empleado";
            form.querySelector('button[type="submit"]').textContent = "Actualizar Empleado";

            dialog.showModal();
        } catch (error) {
            console.error(error);
            alert("No se pudo cargar el perfil del empleado para editar.");
        }
    };

    const profileDialog = document.getElementById("profileDialog");
    const closeProfileBtn = document.getElementById("closeProfileBtn");
    const profileContent = document.getElementById("profileContent");

    window.viewProfile = async (id) => {
        try {
            const response = await fetch(`/empleados/ver/${id}`);
            if (!response.ok) {
                throw new Error("Error al obtener los datos del empleado.");
            }
            const data = await response.json();

            profileContent.innerHTML = `
                <h2>Perfil del Empleado</h2>
                <p><strong>ID:</strong> ${data.id}</p>
                <p><strong>DNI:</strong> ${data.dni}</p>
                <p><strong>Nombre Completo:</strong> ${data.nombre_completo}</p>
                <p><strong>Email:</strong> ${data.email}</p>
                <p><strong>Dirección:</strong> ${data.direccion}</p>
                <p><strong>Teléfono:</strong> ${data.telefono}</p>
                <p><strong>Fecha de Nacimiento:</strong> ${data.fecha_nacimiento}</p>
                <p><strong>Rol:</strong> ${data.rol}</p>
                <p><strong>Usuario:</strong> ${data.usuario}</p>
            `;
            profileDialog.showModal();
        } catch (error) {
            console.error(error);
            alert("No se pudo cargar el perfil del empleado.");
        }
    };

    closeProfileBtn.addEventListener("click", () => {
        profileDialog.close();
    });

    profileDialog.addEventListener("click", (event) => {
        if (event.target === profileDialog) {
            profileDialog.close();
        }
    });
});