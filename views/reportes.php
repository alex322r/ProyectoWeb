<h1>Reportes</h1>

<div class="card">
    <div class="card-header">
        Últimas 10 Citas Agregadas
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha y Hora</th>
                    <th>Paciente</th>
                    <th>Psicólogo</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <?php if (isset($ultimasCitas) && !empty($ultimasCitas)): ?>
                    <?php foreach ($ultimasCitas as $cita): ?>
                        <tr>
                            <td><?= htmlspecialchars($cita['id_cita']) ?></td>
                            <td><?= htmlspecialchars($cita['fecha_hora']) ?></td>
                            <td><?= htmlspecialchars($cita['nombre_paciente']) ?></td>
                            <td><?= htmlspecialchars($cita['nombre_psicologo']) ?></td>
                            <td><?= htmlspecialchars($cita['estado']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="5" class="text-center">No hay citas para mostrar.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
