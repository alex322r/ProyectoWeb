<div class="container">
    <div class="header-section">
        <h2>Reportes de Caja - Pagos del Día</h2>
    </div>
    
    <div class="card">
        <div class="card-body">
            <?php if (!empty($pagos)): ?>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Fecha y Hora</th>
                                <th>Monto</th>
                                <th>Método de Pago</th>
                                <th>Persona</th>
                                <th>Descripción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($pagos as $pago): ?>
                                <tr>
                                    <td>
                                        <?php
                                            try {
                                                $date = new DateTime($pago['fecha'], new DateTimeZone('UTC'));
                                                $date->setTimezone(new DateTimeZone('America/Mexico_City'));
                                                echo htmlspecialchars($date->format('d/m/Y h:i A'));
                                            } catch (Exception $e) {
                                                echo htmlspecialchars($pago['fecha']);
                                            }
                                        ?>
                                    </td>
                                    <td><?php echo htmlspecialchars(number_format($pago['monto'], 2)); ?></td>
                                    <td><?php echo htmlspecialchars($pago['metodo_pago']); ?></td>
                                    <td><?php echo htmlspecialchars($pago['persona']); ?></td>
                                    <td><?php echo htmlspecialchars($pago['descripcion']); ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <div style="text-align: center; padding: 50px;">
                    <div style="font-size: 48px; margin-bottom: 20px;">🤔</div>
                    <h3>No hay pagos registrados para hoy.</h3>
                    <p class="text-muted">Vuelve más tarde o verifica los registros de otros días.</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>