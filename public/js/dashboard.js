// dashboard.js

function actualizarEstadoDB() {
  // Apuntando a la nueva ruta manejada por tu Front Controller

  const statusIndicator = document.querySelector(".status-indicator")

  fetch('/api/db-status')
    .then(response => response.json())
    .then(data => {

      if (statusIndicator) {
        statusIndicator.innerText = data.estado.Estado_Conexion;
      }


    })
    .catch(error => {
      console.error('Error al monitorear DB:', error);
    });
}


function actualizarUsuariosEnLinea() {
    const onlineUsersList = document.getElementById('online-users-list');

    // Solo ejecutar si el elemento existe en la página
    if (!onlineUsersList) {
        return;
    }

    fetch('/api/empleados/online')
        .then(response => {
            if (!response.ok) {
                throw new Error('La respuesta de la red no fue exitosa');
            }
            return response.json();
        })
        .then(users => {
            if (users.length > 0) {
                let tableHtml = `
                    <table>
                        <thead>
                            <tr>
                                <th>Usuario</th>
                                <th>Nombre Completo</th>
                                <th>Rol</th>
                            </tr>
                        </thead>
                        <tbody>
                `;
                users.forEach(user => {
                    tableHtml += `
                        <tr>
                            <td>${user.usuario}</td>
                            <td>${user.nombre_completo}</td>
                            <td>${user.rol}</td>
                        </tr>
                    `;
                });
                tableHtml += '</tbody></table>';
                onlineUsersList.innerHTML = tableHtml;
            } else {
                onlineUsersList.innerHTML = '<p>No hay usuarios en línea en este momento.</p>';
            }
        })
        .catch(error => {
            console.error('Error al obtener usuarios en línea:', error);
            onlineUsersList.innerHTML = '<p>Error al cargar la lista de usuarios.</p>';
        });
}

// Llamar a la función inmediatamente y luego cada 10 segundos
actualizarUsuariosEnLinea();
setInterval(actualizarUsuariosEnLinea, 10000);

function actualizarNuevosUsuarios() {
    const newUsersList = document.getElementById('new-users-list');

    if (!newUsersList) {
        return;
    }

    fetch('/api/empleados/nuevos')
        .then(response => {
            if (!response.ok) {
                throw new Error('La respuesta de la red no fue exitosa');
            }
            return response.json();
        })
        .then(users => {
            if (users.length > 0) {
                let tableHtml = `
                    <table>
                        <thead>
                            <tr>
                                <th>Usuario</th>
                                <th>Nombre Completo</th>
                                <th>Fecha Registro</th>
                            </tr>
                        </thead>
                        <tbody>
                `;
                users.forEach(user => {
                    // Formatear la fecha para que sea más legible
                    const fecha = new Date(user.fecha_registro + 'Z'); // Añadir Z para indicar que es UTC
                    const fechaFormateada = fecha.toLocaleString();

                    tableHtml += `
                        <tr>
                            <td>${user.usuario}</td>
                            <td>${user.nombre_completo}</td>
                            <td>${fechaFormateada}</td>
                        </tr>
                    `;
                });
                tableHtml += '</tbody></table>';
                newUsersList.innerHTML = tableHtml;
            } else {
                newUsersList.innerHTML = '<p>No hay nuevos registros en las últimas 24 horas.</p>';
            }
        })
        .catch(error => {
            console.error('Error al obtener nuevos usuarios:', error);
            newUsersList.innerHTML = '<p>Error al cargar la lista de nuevos usuarios.</p>';
        });
}

// Llamar a la función de nuevos usuarios al cargar la página
actualizarNuevosUsuarios();

function updateSystemStatus() {
  const systemStatusCard = document.getElementById('system-status-card');

  if (!systemStatusCard) {
    return;
  }

  fetch('/api/system-status')
    .then(response => response.json())
    .then(data => {
      const cpuLoad = data.cpu.load.map(l => l.toFixed(2)).join(', ');
      const ramUsage = data.ram.usage;
      const diskUsage = data.disk.usage;

      systemStatusCard.innerHTML = `
        <ul>
          <li><strong>Carga CPU:</strong> ${cpuLoad}</li>
          <li><strong>Uso de RAM:</strong> ${ramUsage}%</li>
          <li><strong>Uso de Disco:</strong> ${diskUsage}%</li>
        </ul>
      `;
    })
    .catch(error => {
      console.error('Error al obtener el estado del sistema:', error);
      systemStatusCard.innerHTML = '<p>Error al cargar el estado del sistema.</p>';
    });
}

// Llamar a las funciones de actualización al cargar la página y periódicamente
actualizarEstadoDB();
updateSystemStatus();
setInterval(actualizarEstadoDB, 10000);
setInterval(updateSystemStatus, 10000);

function actualizarIntentosFallidos() {
    const failedLoginsList = document.getElementById('failed-logins-list');

    if (!failedLoginsList) {
        return;
    }

    fetch('/api/auth/failed-logins')
        .then(response => response.json())
        .then(attempts => {
            if (attempts.length > 0) {
                let tableHtml = `
                    <table>
                        <thead>
                            <tr>
                                <th>Usuario</th>
                                <th>IP</th>
                                <th>Fecha y Hora</th>
                            </tr>
                        </thead>
                        <tbody>
                `;
                attempts.forEach(attempt => {
                    const fecha = new Date(attempt.fecha_intento + 'Z');
                    const fechaFormateada = fecha.toLocaleString();
                    tableHtml += `
                        <tr>
                            <td>${attempt.usuario}</td>
                            <td>${attempt.ip}</td>
                            <td>${fechaFormateada}</td>
                        </tr>
                    `;
                });
                tableHtml += '</tbody></table>';
                failedLoginsList.innerHTML = tableHtml;
            } else {
                failedLoginsList.innerHTML = '<p>No hay intentos de sesión fallidos registrados.</p>';
            }
        })
        .catch(error => {
            console.error('Error al obtener intentos de sesión fallidos:', error);
            failedLoginsList.innerHTML = '<p>Error al cargar la lista de intentos fallidos.</p>';
        });
}

actualizarIntentosFallidos();
