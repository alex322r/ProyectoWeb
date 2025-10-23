
            <header class="main-header">
                <h1>Visión General del Sistema</h1>
                <div class="header-actions">
                    <div class="theme-toggler">
                        <span class="material-icons-sharp active">light_mode</span>
                        <span class="material-icons-sharp">dark_mode</span>
                    </div>
                    <p>Bienvenido, Administrador</p>
                </div>
            </header>

            <div class="widgets-grid">
                <div class="widget-card">
                    <h3 class="widget-title">Estado del Servidor</h3>
                    <div class="widget-content">
                        <p class="status-indicator">
                        <span class="status-circle <?= $online ? 'online' :  'offline' ?>"></span>
                        
                        <?= $online ? 'Online' : 'Offline' ?>
                        </p>
                        <small class="text-muted">Última comprobación: Hace 1 min</small>
                    </div>
                </div>

                <div class="widget-card">
                    <h3 class="widget-title">Uso de CPU</h3>
                    <div class="widget-content">
                        <p class="metric">35%</p>
                        <small class="text-muted">Carga normal</small>
                    </div>
                </div>

                <div class="widget-card">
                    <h3 class="widget-title">Usuarios Activos</h3>
                    <div class="widget-content">
                        <p class="metric">128</p>
                        <small class="text-muted">En los últimos 15 minutos</small>
                    </div>
                </div>

                <div class="widget-card">
                    <h3 class="widget-title">Errores Críticos (24h)</h3>
                    <div class="widget-content">
                        <p class="metric metric-danger">4</p>
                        <a href="#" class="widget-link">Ver detalles</a>
                    </div>
                </div>

                <div class="widget-card full-width">
                     <h3 class="widget-title">Últimos Registros</h3>
                     <div class="widget-content">
                        <table>
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Fecha de Registro</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Ana García</td>
                                    <td>ana.garcia@example.com</td>
                                    <td>Editor</td>
                                    <td>16/10/2025</td>
                                </tr>
                                 <tr>
                                    <td>Carlos Ruiz</td>
                                    <td>carlos.ruiz@example.com</td>
                                    <td>Visitante</td>
                                    <td>16/10/2025</td>
                                </tr>
                                <tr>
                                    <td>Luisa Fernandez</td>
                                    <td>luisa.f@example.com</td>
                                    <td>Visitante</td>
                                    <td>15/10/2025</td>
                                </tr>
                            </tbody>
                        </table>
                     </div>
                </div>
            </div>
            <script src="js/dashboard.js" type="module" ></script>
