<?php

namespace App\Controllers;

use App\Models\PacienteModel;
use App\Models\CitaModel;
use App\Models\HistorialClinicoModel;
use App\Models\DiagnosticoModel;
use PDO;
use Exception;

class PacienteController {

  private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function verExpediente($id) {
        $pacienteModel = new PacienteModel($this->pdo);
        $paciente = $pacienteModel->getById((int)$id);

        $citaModel = new CitaModel($this->pdo);
        $citas = $citaModel->getCitasByPacienteId((int)$id);

        $historialClinicoModel = new HistorialClinicoModel($this->pdo);
        $historial = $historialClinicoModel->getHistorialByPacienteId((int)$id);

        $diagnostico = null;
        if ($historial && isset($historial['id_historial'])) {
            $diagnosticoModel = new DiagnosticoModel($this->pdo);
            $diagnostico = $diagnosticoModel->getByHistorialId($historial['id_historial']);
        }

        view('expediente_clinico', [
            'titulo' => 'Expediente Clínico',
            'paciente' => $paciente,
            'citas' => $citas,
            'historial' => $historial,
            'diagnostico' => $diagnostico,
            'paginaActiva' => 'pacientes'
        ]);
    }

    public function guardarExpediente($id) {
        header('Content-Type: application/json');

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
            return;
        }

        try {
            $diagnosticoModel = new DiagnosticoModel($this->pdo);
            $data = $_POST;

            $existingDiagnosis = $diagnosticoModel->getByHistorialId($data['id_historial']);

            if ($existingDiagnosis) {
                $diagnosticoModel->actualizar($existingDiagnosis['id_diagnostico'], $data);
            } else {
                $diagnosticoModel->crear($data);
            }
            
            header('Location: /pacientes/expediente/' . $id);
            exit();

        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function crear() {
        if (!isset($_SESSION['user_role']) || ($_SESSION['user_role'] !== 'recepcionista' && $_SESSION['user_role'] !== 'administrador')) {
            http_response_code(403);
            echo json_encode(['success' => false, 'message' => 'No tiene permisos para realizar esta acción.']);
            return;
        }

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
        
            public function actualizar($id) {
                if (!isset($_SESSION['user_role']) || !in_array($_SESSION['user_role'], ['administrador', 'recepcionista'])) {
                    http_response_code(403);
                    echo json_encode(['success' => false, 'message' => 'No tiene permisos para realizar esta acción.']);
                    return;
                }
        
                header('Content-Type: application/json');
        
                if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                    http_response_code(405);
                    echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
                    return;
                }
        
                $data = json_decode(file_get_contents('php://input'), true);
        
                // Validar que los datos necesarios están presentes
                if (empty($data['nombres']) || empty($data['apellidos']) || empty($data['dni']) || empty($data['email'])) {
                    http_response_code(400);
                    echo json_encode(['success' => false, 'message' => 'Nombres, apellidos, DNI y email son obligatorios.']);
                    return;
                }
        
                try {
                    $pacienteModel = new PacienteModel($this->pdo);
                    $result = $pacienteModel->actualizarPaciente((int)$id, $data);
        
                    if ($result['success']) {
                        echo json_encode(['success' => true, 'message' => 'Paciente actualizado con éxito.']);
                    } else {
                        http_response_code(500);
                        echo json_encode(['success' => false, 'message' => $result['message']]);
                    }
                } catch (Exception $e) {
                    http_response_code(500);
                    echo json_encode(['success' => false, 'message' => 'Error al actualizar el paciente: ' . $e->getMessage()]);
                }
            }
        
            public function listar() {
        $pacienteModel = new PacienteModel($this->pdo);
        return $pacienteModel->listarPacientes();
    }

    public function actualizarEstado() {
        if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'psicologo') {
            http_response_code(403);
            echo json_encode(['success' => false, 'message' => 'No tiene permisos para realizar esta acción.']);
            return;
        }

        header('Content-Type: application/json');

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
            return;
        }

        $data = json_decode(file_get_contents('php://input'), true);

        $id_paciente = $data['id_paciente'] ?? null;
        $estado = $data['estado'] ?? null;

        if (!$id_paciente || !$estado) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'ID de paciente y estado son obligatorios.']);
            return;
        }

        try {
            $pacienteModel = new PacienteModel($this->pdo);
            $result = $pacienteModel->updateEstadoPaciente((int)$id_paciente, $estado);
            echo json_encode($result);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error al actualizar el estado del paciente: ' . $e->getMessage()]);
        }
    }

    public function eliminar($id) {
        if (!isset($_SESSION['user_role']) || ($_SESSION['user_role'] !== 'administrador' && $_SESSION['user_role'] !== 'recepcionista')) {
            http_response_code(403);
            echo json_encode(['success' => false, 'message' => 'No tiene permisos para realizar esta acción.']);
            return;
        }

        header('Content-Type: application/json');

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
            return;
        }

        try {
            $pacienteModel = new PacienteModel($this->pdo);
            $result = $pacienteModel->delete((int)$id);
            echo json_encode($result);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error al eliminar el paciente: ' . $e->getMessage()]);
        }
    }
}