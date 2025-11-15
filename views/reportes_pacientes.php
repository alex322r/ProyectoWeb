<h1>Reporte de Pacientes</h1>

<div class="card">
    <div class="card-header">
        Últimos 10 Pacientes Agregados
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <?php if (isset($ultimosPacientes) && !empty($ultimosPacientes)): ?>
                    <?php foreach ($ultimosPacientes as $paciente): ?>
                        <tr>
                            <td><?= htmlspecialchars($paciente['id_paciente']) ?></td>
                            <td><?= htmlspecialchars($paciente['nombres']) ?></td>
                            <td><?= htmlspecialchars($paciente['apellidos']) ?></td>
                            <td><?= htmlspecialchars($paciente['dni']) ?></td>
                            <td><?= htmlspecialchars($paciente['estado']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="5" class="text-center">No hay pacientes para mostrar.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
