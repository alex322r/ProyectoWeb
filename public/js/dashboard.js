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

actualizarEstadoDB()

