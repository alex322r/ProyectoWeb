<?php

namespace App\Controllers;

use PDO;

class AgendaController
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function index()
    {
        view('agenda', [
            'titulo' => 'Agenda de Citas',
            'paginaActiva' => 'agenda'
        ]);
    }

    public function citas()
    {
        view('citas', [
            'titulo' => 'Gestión de Citas',
            'paginaActiva' => 'citas'
        ]);
    }

    public function getAppointments()
    {
        header('Content-Type: application/json');
        try {
            $userRole = $_SESSION['user_role'] ?? '';
            $userId = $_SESSION['user_id'] ?? 0;

            $sql = "
                SELECT 
                    c.id_cita AS id,
                    CONCAT(p.nombres, ' ', p.apellidos) AS title,
                    c.fecha_hora AS start,
                    DATE_ADD(c.fecha_hora, INTERVAL 1 HOUR) AS end,
                    c.estado AS status,
                    c.id_empleado_psicologo,
                    pa.id_paciente
                FROM 
                    cita c
                JOIN 
                    paciente pa ON c.id_paciente = pa.id_paciente
                JOIN 
                    persona p ON pa.id_persona = p.id_persona
            ";

            if ($userRole === 'psicologo') {
                $sql .= " WHERE c.id_empleado_psicologo = :user_id";
            }
            
            $stmt = $this->pdo->prepare($sql);

            if ($userRole === 'psicologo') {
                $stmt->execute(['user_id' => $userId]);
            } else {
                $stmt->execute();
            }

            $appointments = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($appointments as &$appointment) {
                switch ($appointment['status']) {
                    case 'programada':
                        $appointment['color'] = '#4CAF50'; // Green
                        break;
                    case 'confirmada':
                        $appointment['color'] = '#2196F3'; // Blue
                        break;
                    case 'cancelada':
                        $appointment['color'] = '#F44336'; // Red
                        break;
                    case 'completada':
                        $appointment['color'] = '#9E9E9E'; // Gray
                        break;
                    default:
                        $appointment['color'] = '#FF9800'; // Orange
                        break;
                }
            }

            echo json_encode($appointments);
        } catch (\PDOException $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Error al obtener citas: ' . $e->getMessage()]);
        }
    }

    public function create()
    {
        header('Content-Type: application/json');
        
        $patientId = $_POST['patientId'] ?? '';
        $date = $_POST['date'] ?? '';
        $time = $_POST['time'] ?? '';
        $psychologistId = $_POST['psychologist'] ?? '';

        if (empty($patientId) || empty($date) || empty($time) || empty($psychologistId)) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Faltan datos obligatorios.']);
            return;
        }

        try {
            $fecha_hora = $date . ' ' . $time;
            $citaModel = new \App\Models\CitaModel($this->pdo);

            if (!$citaModel->isTimeSlotAvailable($psychologistId, $fecha_hora)) {
                http_response_code(409);
                echo json_encode(['success' => false, 'message' => 'El horario seleccionado ya no está disponible.']);
                return;
            }

            $data = [
                'id_paciente' => $patientId,
                'id_empleado_psicologo' => $psychologistId,
                'fecha_hora' => $fecha_hora,
                'estado' => 'programada',
                'motivo_consulta' => 'Consulta general'
            ];

            $result = $citaModel->createCita($data);
            if ($result['success']) {
                http_response_code(201);
                echo json_encode($result);
            } else {
                throw new \Exception($result['message']);
            }
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function update($id)
    {
        header('Content-Type: application/json');
        
        $patientId = $_POST['patientId'] ?? '';
        $date = $_POST['date'] ?? '';
        $time = $_POST['time'] ?? '';
        $psychologistId = $_POST['psychologist'] ?? '';
        $status = $_POST['status'] ?? '';

        if (empty($patientId) || empty($date) || empty($time) || empty($psychologistId) || empty($status)) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Faltan datos obligatorios.']);
            return;
        }

        try {
            $fecha_hora = $date . ' ' . $time;
            $citaModel = new \App\Models\CitaModel($this->pdo);

            if (!$citaModel->isTimeSlotAvailable($psychologistId, $fecha_hora, $id)) {
                http_response_code(409);
                echo json_encode(['success' => false, 'message' => 'El nuevo horario seleccionado no está disponible.']);
                return;
            }

            $data = [
                'id_paciente' => $patientId,
                'id_empleado_psicologo' => $psychologistId,
                'fecha_hora' => $fecha_hora,
                'estado' => $status,
                'motivo_consulta' => 'Consulta general'
            ];

            $result = $citaModel->updateCita($id, $data);
            if ($result['success']) {
                echo json_encode($result);
            } else {
                throw new \Exception($result['message']);
            }
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function cancel($id)
    {
        header('Content-Type: application/json');

        try {
            $citaModel = new \App\Models\CitaModel($this->pdo);
            $result = $citaModel->cancelCita($id);
            if ($result['success']) {
                echo json_encode($result);
            } else {
                throw new \Exception($result['message']);
            }
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function delete($id)
    {
        header('Content-Type: application/json');

        try {
            $citaModel = new \App\Models\CitaModel($this->pdo);
            $result = $citaModel->deleteCita($id);
            if ($result['success']) {
                echo json_encode($result);
            } else {
                throw new \Exception($result['message']);
            }
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function get($id)
    {
        header('Content-Type: application/json');
        try {
            $citaModel = new \App\Models\CitaModel($this->pdo);
            $cita = $citaModel->getById($id);
            if ($cita) {
                echo json_encode($cita);
            } else {
                http_response_code(404);
                echo json_encode(['error' => 'Cita no encontrada.']);
            }
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Error al obtener la cita: ' . $e->getMessage()]);
        }
    }
}
