<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Buscar Historial Clínico</h3>
                    <h6 class="font-weight-normal mb-0">Busca pacientes para ver su historial clínico.</h6>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <input type="text" id="buscarPacienteHistorial" class="form-control" placeholder="Buscar paciente por nombre o DNI...">
                    </div>
                    <div id="historial-results" class="mt-4">
                        <!-- Search results will be displayed here -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php ob_start(); ?>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('buscarPacienteHistorial');
    const resultsContainer = document.getElementById('historial-results');

    searchInput.addEventListener('keyup', function() {
        const searchTerm = this.value;

        if (searchTerm.length > 2) {
            fetch(`/api/pacientes/buscar?term=${searchTerm}`)
                .then(response => response.json())
                .then(data => {
                    resultsContainer.innerHTML = '';
                    if (data.length > 0) {
                        const table = document.createElement('table');
                        table.className = 'table table-striped';
                        table.innerHTML = `
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>DNI</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${data.map(paciente => `
                                    <tr>
                                        <td>${paciente.nombres} ${paciente.apellidos}</td>
                                        <td>${paciente.dni}</td>
                                        <td>
                                            <a href="/pacientes/expediente/${paciente.id_paciente}" class="btn btn-primary">Ver Historial</a>
                                        </td>
                                    </tr>
                                `).join('')}
                            </tbody>
                        `;
                        resultsContainer.appendChild(table);
                    } else {
                        resultsContainer.innerHTML = '<p>No se encontraron pacientes.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error fetching search results:', error);
                    resultsContainer.innerHTML = '<p>Error al buscar pacientes.</p>';
                });
        } else {
            resultsContainer.innerHTML = '';
        }
    });
});
</script>
<?php $scripts = ob_get_clean(); ?>
