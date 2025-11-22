<div class="container">
    <div class="header-section">
        <h2>Documentos</h2>
        <div class="header-actions">
            <button class="btn ghost" onclick="location.reload()">🔄 Actualizar</button>
        </div>
    </div>
    
    <div class="card">
        <div class="card-header">
            <h3>Recibos y Facturas Recientes</h3>
        </div>
        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Paciente</th>
                        <th>Fecha</th>
                        <th>Concepto</th>
                        <th>Monto</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Mock Data -->
                    <tr>
                        <td>#REC-001</td>
                        <td>Juan Pérez</td>
                        <td>2023-10-25</td>
                        <td>Consulta Psicológica</td>
                        <td>$50.00</td>
                        <td><span class="status confirmed">Pagado</span></td>
                        <td>
                            <button class="btn ghost" onclick="openPrintModal('#REC-001', 'Juan Pérez', '2023-10-25', 'Consulta Psicológica', '$50.00')">🖨️ Imprimir</button>
                            <button class="btn ghost" onclick="sendInvoice('#REC-001')">📧 Enviar</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#REC-002</td>
                        <td>Maria Garcia</td>
                        <td>2023-10-24</td>
                        <td>Terapia de Pareja</td>
                        <td>$80.00</td>
                        <td><span class="status confirmed">Pagado</span></td>
                        <td>
                            <button class="btn ghost" onclick="openPrintModal('#REC-002', 'Maria Garcia', '2023-10-24', 'Terapia de Pareja', '$80.00')">🖨️ Imprimir</button>
                            <button class="btn ghost" onclick="sendInvoice('#REC-002')">📧 Enviar</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#REC-003</td>
                        <td>Carlos Lopez</td>
                        <td>2023-10-23</td>
                        <td>Evaluación Inicial</td>
                        <td>$60.00</td>
                        <td><span class="status pending">Pendiente</span></td>
                        <td>
                            <button class="btn ghost" onclick="openPrintModal('#REC-003', 'Carlos Lopez', '2023-10-23', 'Evaluación Inicial', '$60.00')">🖨️ Imprimir</button>
                            <button class="btn ghost" onclick="sendInvoice('#REC-003')">📧 Enviar</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Print Modal -->
<div id="printModal" class="modal-overlay hidden">
    <div class="modal-content receipt-modal">
        <button class="modal-close" onclick="closePrintModal()">×</button>
        <div class="receipt-preview">
            <div class="receipt-header">
                <h2>AVANCE</h2>
                <p>Consultorio Psicológico</p>
                <p>Calle Principal 123, Ciudad</p>
                <p>Tel: (555) 123-4567</p>
            </div>
            <div class="receipt-divider"></div>
            <div class="receipt-info">
                <div class="info-row">
                    <span>Recibo:</span>
                    <span id="modalReceiptId"></span>
                </div>
                <div class="info-row">
                    <span>Fecha:</span>
                    <span id="modalDate"></span>
                </div>
                <div class="info-row">
                    <span>Paciente:</span>
                    <span id="modalPatient"></span>
                </div>
            </div>
            <div class="receipt-divider"></div>
            <div class="receipt-items">
                <div class="item-row header">
                    <span>Descripción</span>
                    <span>Importe</span>
                </div>
                <div class="item-row">
                    <span id="modalConcept"></span>
                    <span id="modalAmount"></span>
                </div>
            </div>
            <div class="receipt-divider"></div>
            <div class="receipt-total">
                <span>Total:</span>
                <span id="modalTotal"></span>
            </div>
            <div class="receipt-footer">
                <p>¡Gracias por su confianza!</p>
            </div>
        </div>
        <div class="modal-actions">
            <button class="btn ghost" onclick="closePrintModal()">Cancelar</button>
            <button class="btn" onclick="printReceipt()">🖨️ Imprimir</button>
        </div>
    </div>
</div>

<script>
function openPrintModal(id, patient, date, concept, amount) {
    document.getElementById('modalReceiptId').textContent = id;
    document.getElementById('modalPatient').textContent = patient;
    document.getElementById('modalDate').textContent = date;
    document.getElementById('modalConcept').textContent = concept;
    document.getElementById('modalAmount').textContent = amount;
    document.getElementById('modalTotal').textContent = amount;
    
    const modal = document.getElementById('printModal');
    modal.classList.remove('hidden');
    // Trigger reflow
    void modal.offsetWidth;
    modal.classList.add('visible');
}

function closePrintModal() {
    const modal = document.getElementById('printModal');
    modal.classList.remove('visible');
    setTimeout(() => {
        modal.classList.add('hidden');
    }, 300);
}

function printReceipt() {
    // In a real app, this would trigger window.print() with specific styles
    // For now, we'll just simulate it
    const btn = document.querySelector('#printModal .btn:not(.ghost)');
    const originalText = btn.textContent;
    btn.textContent = 'Imprimiendo...';
    btn.disabled = true;
    
    setTimeout(() => {
        alert('Documento enviado a la impresora.');
        btn.textContent = originalText;
        btn.disabled = false;
        closePrintModal();
    }, 1000);
}

function sendInvoice(id) {
    if(confirm('¿Enviar factura ' + id + ' al correo del paciente?')) {
        alert('Factura enviada correctamente.');
    }
}
</script>
