<?php

namespace App\Controllers;

use App\Models\CitaModel;
use App\Models\PacienteModel;
use PDO;

class ReportesController
{
    private $pdo;
    private $citaModel;
    private $pacienteModel;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
        $this->citaModel = new CitaModel($pdo);
        $this->pacienteModel = new PacienteModel($pdo);
    }

    public function index()
    {
        $ultimasCitas = $this->citaModel->getUltimasCitas(10);

        return [
            'titulo' => 'Reportes',
            'paginaActiva' => 'reportes',
            'ultimasCitas' => $ultimasCitas,
        ];
    }

    public function pacientes()
    {
        $ultimosPacientes = $this->pacienteModel->getUltimosPacientes(10);

        return [
            'view' => 'reportes_pacientes.php',
            'titulo' => 'Reporte de Pacientes',
            'paginaActiva' => 'reportes',
            'ultimosPacientes' => $ultimosPacientes,
        ];
    }
}
