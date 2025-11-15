<?php

namespace App\Controllers;

use App\Models\PlanModel;
use PDO;
use Exception;

class PlanesController {

    private $pdo;
    private $planModel;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
        $this->planModel = new PlanModel($pdo);
    }

    public function listar() {
        $planes = $this->planModel->listarPlanes();
        return $planes;
    }

    public function crear() {
        session_start();

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            $_SESSION['error_message'] = 'Método no permitido.';
            header('Location: /planes');
            exit;
        }
        
        $data = $_POST;

        // Validaciones básicas
        if (empty($data['nombre']) || empty($data['numero_sesiones']) || empty($data['precio']) || empty($data['duracion_meses'])) {
            $_SESSION['error_message'] = 'Todos los campos obligatorios deben ser llenados.';
            header('Location: /planes');
            exit;
        }

        try {
            $result = $this->planModel->crearPlan($data);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'crear_plan', $result['id_plan'], 'plan', $data);
                $_SESSION['success_message'] = 'Plan creado exitosamente.';
                header('Location: /planes');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /planes');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /planes');
            exit;
        }
    }

    public function editar($id) {
        session_start();

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            $_SESSION['error_message'] = 'Método no permitido.';
            header('Location: /planes');
            exit;
        }

        $data = $_POST;

        // Validaciones básicas
        if (empty($data['nombre']) || empty($data['numero_sesiones']) || empty($data['precio']) || empty($data['duracion_meses'])) {
            $_SESSION['error_message'] = 'Todos los campos obligatorios deben ser llenados.';
            header('Location: /planes');
            exit;
        }

        try {
            $result = $this->planModel->editarPlan($id, $data);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'editar_plan', $id, 'plan', $data);
                $_SESSION['success_message'] = 'Plan actualizado exitosamente.';
                header('Location: /planes');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /planes');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /planes');
            exit;
        }
    }

    public function eliminar($id) {
        session_start();

        try {
            $result = $this->planModel->eliminarPlan($id);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'eliminar_plan', $id, 'plan');
                $_SESSION['success_message'] = 'Plan eliminado exitosamente.';
                header('Location: /planes');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /planes');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /planes');
            exit;
        }
    }

    public function obtener($id) {
        try {
            $plan = $this->planModel->obtenerPlanPorId($id);

            if ($plan) {
                header('Content-Type: application/json');
                echo json_encode($plan);
                exit;
            } else {
                http_response_code(404);
                echo json_encode(['message' => 'Plan no encontrado.']);
                exit;
            }
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['message' => $e->getMessage()]);
            exit;
        }
    }

    public function activar($id) {
        session_start();

        try {
            $result = $this->planModel->activarPlan($id);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'activar_plan', $id, 'plan');
                $_SESSION['success_message'] = 'Plan activado exitosamente.';
                header('Location: /planes');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /planes');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /planes');
            exit;
        }
    }

    public function inactivar($id) {
        session_start();

        try {
            $result = $this->planModel->inactivarPlan($id);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'inactivar_plan', $id, 'plan');
                $_SESSION['success_message'] = 'Plan inactivado exitosamente.';
                header('Location: /planes');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /planes');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /planes');
            exit;
        }
    }
}
