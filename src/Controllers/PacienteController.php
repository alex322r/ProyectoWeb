<?php

namespace App\Controllers;

use App\Models\PacienteModel;
use PDO;
use Exception;

class PacienteController {

  private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function crear() {
        header('Content-Type: application/json');

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
            return;
        }

        $data = json_decode(file_get_contents('php://input'), true);

        if (empty($data['paciente_dni'])) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'El DNI del paciente es obligatorio.']);
            return;
        }

        try {
            $pacienteModel = new PacienteModel($this->pdo);
            $result = $pacienteModel->crearPaciente($data);

            echo json_encode($result);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
    public function buscar() {
        header('Content-Type: application/json');
        $searchTerm = $_GET['term'] ?? '';

        $pacienteModel = new PacienteModel($this->pdo);
        $pacientes = $pacienteModel->listarPacientes($searchTerm);

        echo json_encode($pacientes);
    }

    public function ver($id) {
        header('Content-Type: application/json');
        
        if (!isset($id) || !is_numeric($id)) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'ID de paciente no válido.']);
            return;
        }

        try {
            $pacienteModel = new PacienteModel($this->pdo);
            $paciente = $pacienteModel->getById((int)$id);

            if ($paciente) {
                echo json_encode(['success' => true, 'data' => $paciente]);
            } else {
                http_response_code(404);
                echo json_encode(['success' => false, 'message' => 'Paciente no encontrado.']);
            }
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error del servidor: ' . $e->getMessage()]);
        }
    }



    public function listar() {
        $pacienteModel = new PacienteModel($this->pdo);
        return $pacienteModel->listarPacientes();
    }
}