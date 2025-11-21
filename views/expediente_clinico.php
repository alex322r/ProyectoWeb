<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Expediente Clínico</h3>
                    <h6 class="font-weight-normal mb-0">Historial completo del paciente.</h6>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <?php if (isset($paciente) && $paciente): ?>
                        <h4 class="card-title">Paciente: <?php echo htmlspecialchars($paciente['nombres'] . ' ' . $paciente['apellidos']); ?></h4>
                        <p><strong>Email:</strong> <?php echo htmlspecialchars($paciente['email']); ?></p>
                        <p><strong>Teléfono:</strong> <?php echo htmlspecialchars($paciente['telefono']); ?></p>
                        <!--
                        <hr>

                        <h4 class="card-title mt-4">Información del Historial Clínico</h4>
                        <?php if (isset($historial) && $historial): ?>
                            <div class="mb-4">
                                <h5>Antecedentes Médicos</h5>
                                <p><?php echo nl2br(htmlspecialchars($historial['antecedentes_medicos'])); ?></p>
                            </div>
                            <div>
                                <h5>Plan Terapéutico</h5>
                                <p><?php echo nl2br(htmlspecialchars($historial['plan_terapeutico'])); ?></p>
                            </div>

                            <hr>

                            <h4 class="card-title mt-4">Diagnóstico</h4>
                            <form method="POST" action="/pacientes/expediente/<?php echo $paciente['id_paciente']; ?>">
                                <input type="hidden" name="id_historial" value="<?php echo $historial['id_historial']; ?>">
                                <?php if (isset($citas) && !empty($citas)): ?>
                                    <input type="hidden" name="id_cita" value="<?php echo $citas[0]['id_cita']; ?>">
                                <?php endif; ?>
                                <div class="form-group">
                                    <label for="codigo_diagnostico">Código de Diagnóstico</label>
                                    <input type="text" class="form-control" id="codigo_diagnostico" name="codigo_diagnostico" value="<?php echo htmlspecialchars($diagnostico['codigo_diagnostico'] ?? ''); ?>">
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <textarea class="form-control" id="descripcion" name="descripcion" rows="4"><?php echo htmlspecialchars($diagnostico['descripcion'] ?? ''); ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="severidad">Severidad</label>
                                    <select class="form-control" id="severidad" name="severidad">
                                        <option value="leve" <?php echo (isset($diagnostico['severidad']) && $diagnostico['severidad'] === 'leve') ? 'selected' : ''; ?>>Leve</option>
                                        <option value="moderado" <?php echo (isset($diagnostico['severidad']) && $diagnostico['severidad'] === 'moderado') ? 'selected' : ''; ?>>Moderado</option>
                                        <option value="grave" <?php echo (isset($diagnostico['severidad']) && $diagnostico['severidad'] === 'grave') ? 'selected' : ''; ?>>Grave</option>
                                    </select>
                                </div>
                                 <div class="form-group">
                                    <label for="estado">Estado</label>
                                    <select class="form-control" id="estado" name="estado">
                                        <option value="activo" <?php echo (isset($diagnostico['estado']) && $diagnostico['estado'] === 'activo') ? 'selected' : ''; ?>>Activo</option>
                                        <option value="resuelto" <?php echo (isset($diagnostico['estado']) && $diagnostico['estado'] === 'resuelto') ? 'selected' : ''; ?>>Resuelto</option>
                                        <option value="pendiente" <?php echo (isset($diagnostico['estado']) && $diagnostico['estado'] === 'pendiente') ? 'selected' : ''; ?>>Pendiente</option>
                                    </select>
                                </div>
                                <input type="hidden" name="fecha" value="<?php echo date('Y-m-d'); ?>">
                                <button type="submit" class="btn btn-primary">Guardar Diagnóstico</button>
                            </form>
 

                            <p>No hay historial clínico registrado para este paciente.</p>
                        <?php endif; ?>
                         --> 
                        <hr>

                        <h4 class="card-title mt-4">Historial de Citas</h4>
                        <?php if (isset($citas) && !empty($citas)): ?>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Fecha y Hora</th>
                                            <th>Psicólogo</th>
                                            <th>Motivo de Consulta</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($citas as $cita): ?>
                                            <tr>
                                                <td><?php echo htmlspecialchars($cita['fecha_hora']); ?></td>
                                                <td><?php echo htmlspecialchars($cita['nombre_psicologo']); ?></td>
                                                <td><?php echo htmlspecialchars($cita['motivo_consulta']); ?></td>
                                                <td><?php echo htmlspecialchars($cita['estado']); ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        <?php else: ?>
                            <p>No hay citas registradas para este paciente.</p>
                        <?php endif; ?>
                    <?php else: ?>
                        <p>No se encontró información del paciente.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
