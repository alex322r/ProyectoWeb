<div class="view-header">
    <h3>Gestión de Pagos</h3>
    <p>Busque un paciente para registrar un pago de citas o planes.</p>
</div>

<div class="pagos-container">
    <div class="search-section">
        <label for="buscarPacientePagos">Buscar Paciente:</label>
        <div class="input-with-icon">
            <input type="text" id="buscarPacientePagos" placeholder="Buscar por nombre o DNI...">
            <i class="search-icon">🔍</i>
        </div>
        <div id="paciente-search-results" class="search-results"></div>
    </div>

    <div id="paciente-info-section" class="hidden">
        <h4>Paciente Seleccionado</h4>
        <div id="paciente-details">
            <!-- Los detalles del paciente se insertarán aquí -->
        </div>
    </div>

    <div id="deudas-section" class="hidden">
        <h4>Deudas Pendientes</h4>
        <div class="deudas-grid">
            <div class="deudas-list">
                <h5>Citas Pendientes de Pago</h5>
                <ul id="citas-pendientes-list">
                    <!-- Las citas pendientes se insertarán aquí -->
                </ul>
            </div>
            <div class="deudas-list">
                <h5>Planes Pendientes de Pago</h5>
                <ul id="planes-pendientes-list">
                    <!-- Los planes pendientes se insertarán aquí -->
                </ul>
            </div>
        </div>
    </div>

    <div id="historial-pagos-section" class="hidden">
        <h4>Historial de Pagos</h4>
        <ul id="historial-pagos-list">
            <!-- El historial de pagos se insertará aquí -->
        </ul>
    </div>
</div>

<dialog id="registrarPagoDialog">
    <form id="registrarPagoForm">
        <h2>Registrar Pago</h2>
        <input type="hidden" id="pago_tipo_deuda">
        <input type="hidden" id="pago_id_deuda">
        
        <p><strong>Deuda:</strong> <span id="pago_descripcion_deuda"></span></p>
        <p><strong>Monto Total:</strong> S/ <span id="pago_monto_total"></span></p>

        <label for="pago_monto">Monto a Pagar:</label>
        <input type="number" id="pago_monto" name="monto" step="0.10" required>

        <label for="pago_metodo">Método de Pago:</label>
        <select id="pago_metodo" name="id_metodo_pago" required>
            <!-- Opciones de métodos de pago se insertarán aquí -->
        </select>

        <div class="form-actions">
            <button type="button" id="cancelarPagoBtn">Cancelar</button>
            <button type="submit">Registrar Pago</button>
        </div>
    </form>
</dialog>

<script>
    const metodos_pago = <?php echo json_encode($metodos_pago ?? []); ?>;
</script>
<link rel="stylesheet" href="/css/pagos.css">
<script src="/js/pagos.js" type="module"></script>
