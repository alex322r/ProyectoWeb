document.addEventListener("DOMContentLoaded", () => {
    const errorDialog = document.getElementById('errorDialog');
    const errorDialogP = errorDialog ? errorDialog.querySelector('p') : null;
    const closeErrorDialogBtn = document.getElementById('closeErrorDialog');

    if (closeErrorDialogBtn) {
        closeErrorDialogBtn.addEventListener('click', () => {
            errorDialog.close();
        });
    }

    function showErrorDialog(message) {
        if (errorDialog && errorDialogP) {
            errorDialogP.textContent = message;
            errorDialog.showModal();
        } else {
            console.error("Error: #errorDialog or its <p> element not found.");
            alert(message); // Fallback to alert if dialog not found
        }
    }

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

    form.addEventListener('submit', (e) => {
        const dni = form.querySelector('#empleado_dni').value;
        const nombres = form.querySelector('#empleado_nombres').value;
        const apellidos = form.querySelector('#empleado_apellidos').value;
        const email = form.querySelector('#empleado_email').value;
        const direccion = form.querySelector('#empleado_direccion').value;
        const telefono = form.querySelector('#empleado_telefono').value;
        const fechaNacimiento = form.querySelector('#empleado_fecha_nacimiento').value;

        if (!/^\d{8}$/.test(dni)) {
            e.preventDefault();
            showErrorDialog("El DNI debe tener 8 dígitos.");
            return;
        }

        if (nombres.trim().length < 2) {
            e.preventDefault();
            showErrorDialog("El nombre debe tener al menos 2 caracteres.");
            return;
        }

        if (apellidos.trim().length < 2) {
            e.preventDefault();
            showErrorDialog("El apellido debe tener al menos 2 caracteres.");
            return;
        }

        if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            e.preventDefault();
            showErrorDialog("El formato del correo electrónico no es válido.");
            return;
        }

        if (direccion && direccion.trim().length < 5) {
            e.preventDefault();
            showErrorDialog("La dirección debe tener al menos 5 caracteres.");
            return;
        }

        if (telefono && !/^\d{7,15}$/.test(telefono)) {
            e.preventDefault();
            showErrorDialog("El teléfono debe tener entre 7 y 15 dígitos.");
            return;
        }

        if (fechaNacimiento) {
            const fecha = new Date(fechaNacimiento);
            const hoy = new Date();
            if (fecha > hoy) {
                e.preventDefault();
                showErrorDialog("La fecha de nacimiento no puede ser futura.");
                return;
            }
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
            form.querySelector('#empleado_nombres').value = data.nombres;
            form.querySelector('#empleado_apellidos').value = data.apellidos;
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
            showErrorDialog("No se pudo cargar el perfil del empleado para editar.");
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
            showErrorDialog("No se pudo cargar el perfil del empleado.");
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