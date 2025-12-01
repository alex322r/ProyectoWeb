<?php

namespace App\Controllers;
use App\Models\EmpleadoModel;
use PDO;
use Exception;

class EmpleadoController {

  private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function crear() {
        session_start();

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            $_SESSION['error_message'] = 'Método no permitido.';
            header('Location: /empleados');
            exit;
        }
        $data = $_POST;

        if (empty($data['empleado_dni'])) {
            $_SESSION['error_message'] = 'El DNI del empleado es obligatorio.';
            header('Location: /empleados');
            exit;
        }

        if (!preg_match('/^\d{8}$/', $data['empleado_dni'])) {
            $_SESSION['error_message'] = 'El DNI debe tener 8 dígitos.';
            header('Location: /empleados');
            exit;
        }

        if (!empty($data['empleado_email']) && !filter_var($data['empleado_email'], FILTER_VALIDATE_EMAIL)) {
            $_SESSION['error_message'] = 'El correo electrónico no es válido.';
            header('Location: /empleados');
            exit;
        }

        if (!empty($data['empleado_fecha_nacimiento'])) {
            $fecha_nacimiento = new \DateTime($data['empleado_fecha_nacimiento']);
            $hoy = new \DateTime();
            if ($fecha_nacimiento > $hoy) {
                $_SESSION['error_message'] = 'La fecha de nacimiento no puede ser en el futuro.';
                header('Location: /empleados');
                exit;
            }
        }

        if (empty($data['empleado_nombres']) || strlen(trim($data['empleado_nombres'])) < 2) {
            $_SESSION['error_message'] = 'El nombre es obligatorio y debe tener al menos 2 caracteres.';
            header('Location: /empleados');
            exit;
        }
        
        if (empty($data['empleado_apellidos']) || strlen(trim($data['empleado_apellidos'])) < 2) {
            $_SESSION['error_message'] = 'El apellido es obligatorio y debe tener al menos 2 caracteres.';
            header('Location: /empleados');
            exit;
        }

        if (!empty($data['empleado_direccion']) && strlen(trim($data['empleado_direccion'])) < 5) {
             $_SESSION['error_message'] = 'La dirección debe tener al menos 5 caracteres.';
             header('Location: /empleados');
             exit;
        }

        if (!empty($data['empleado_telefono']) && !preg_match('/^\d{7,15}$/', $data['empleado_telefono'])) {
             $_SESSION['error_message'] = 'El teléfono debe tener entre 7 y 15 dígitos.';
             header('Location: /empleados');
             exit;
        }

        // Generar usuario automáticamente: nombre.apellido
        if (empty($data['usuario'])) {
            $nombre = explode(' ', trim($data['empleado_nombres']))[0];
            $apellido = explode(' ', trim($data['empleado_apellidos']))[0];
            $usuarioBase = strtolower($nombre . '.' . $apellido);
            $usuarioBase = preg_replace('/[^a-z0-9.]/', '', $usuarioBase); // Sanitize
            $data['usuario'] = $usuarioBase;
        }

        try {
            $empleadoModel = new EmpleadoModel($this->pdo);
            $result = $empleadoModel->crearEmpleado($data);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'crear_empleado', $result['id_empleado'], 'empleado', $data);
                header('Location: /empleados');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /empleados');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /empleados');
            exit;
        }
    }

    

    public function listar() {
        $empleadoModel = new EmpleadoModel($this->pdo);
        return $empleadoModel->listarEmpleados();
    }

    public function eliminar($id) {
        session_start();

        try {
            log_audit($this->pdo, $_SESSION['user_id'], 'eliminar_empleado', $id, 'empleado');
            $empleadoModel = new EmpleadoModel($this->pdo);
            $result = $empleadoModel->eliminarEmpleado($id);

            if ($result['success']) {
                $_SESSION['success_message'] = 'Empleado eliminado exitosamente.';
                header('Location: /empleados');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /empleados');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /empleados');
            exit;
        }
    }

    public function ver($id) {
        try {
            $empleadoModel = new EmpleadoModel($this->pdo);
            $empleado = $empleadoModel->obtenerEmpleadoPorId($id);

            if ($empleado) {
                header('Content-Type: application/json');
                echo json_encode($empleado);
                exit;
            } else {
                http_response_code(404);
                echo json_encode(['message' => 'Empleado no encontrado.']);
                exit;
            }
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['message' => $e->getMessage()]);
            exit;
        }
    }

    public function editar($id) {
        session_start();

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            $_SESSION['error_message'] = 'Método no permitido.';
            header('Location: /empleados');
            exit;
        }

        $data = $_POST;

        if (empty($data['empleado_dni'])) {
            $_SESSION['error_message'] = 'El DNI del empleado es obligatorio.';
            header('Location: /empleados');
            exit;
        }

        if (!preg_match('/^\d{8}$/', $data['empleado_dni'])) {
            $_SESSION['error_message'] = 'El DNI debe tener 8 dígitos.';
            header('Location: /empleados');
            exit;
        }

        if (!empty($data['empleado_email']) && !filter_var($data['empleado_email'], FILTER_VALIDATE_EMAIL)) {
            $_SESSION['error_message'] = 'El correo electrónico no es válido.';
            header('Location: /empleados');
            exit;
        }

        if (!empty($data['empleado_fecha_nacimiento'])) {
            $fecha_nacimiento = new \DateTime($data['empleado_fecha_nacimiento']);
            $hoy = new \DateTime();
            if ($fecha_nacimiento > $hoy) {
                $_SESSION['error_message'] = 'La fecha de nacimiento no puede ser en el futuro.';
                header('Location: /empleados');
                exit;
            }
        }

        if (empty($data['empleado_nombres']) || strlen(trim($data['empleado_nombres'])) < 2) {
            $_SESSION['error_message'] = 'El nombre es obligatorio y debe tener al menos 2 caracteres.';
            header('Location: /empleados');
            exit;
        }
        
        if (empty($data['empleado_apellidos']) || strlen(trim($data['empleado_apellidos'])) < 2) {
            $_SESSION['error_message'] = 'El apellido es obligatorio y debe tener al menos 2 caracteres.';
            header('Location: /empleados');
            exit;
        }

        if (!empty($data['empleado_direccion']) && strlen(trim($data['empleado_direccion'])) < 5) {
             $_SESSION['error_message'] = 'La dirección debe tener al menos 5 caracteres.';
             header('Location: /empleados');
             exit;
        }

        if (!empty($data['empleado_telefono']) && !preg_match('/^\d{7,15}$/', $data['empleado_telefono'])) {
             $_SESSION['error_message'] = 'El teléfono debe tener entre 7 y 15 dígitos.';
             header('Location: /empleados');
             exit;
        }

        try {
            $empleadoModel = new EmpleadoModel($this->pdo);
            $result = $empleadoModel->editarEmpleado($id, $data);

            if ($result['success']) {
                log_audit($this->pdo, $_SESSION['user_id'], 'editar_empleado', $id, 'empleado', $data);
                $_SESSION['success_message'] = 'Empleado actualizado exitosamente.';
                header('Location: /empleados');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /empleados');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /empleados');
            exit;
        }
    }

    public function getOnlineUsers() {
        try {
            $empleadoModel = new EmpleadoModel($this->pdo);
            $onlineUsers = $empleadoModel->getOnlineUsers();

            header('Content-Type: application/json');
            echo json_encode($onlineUsers);
            exit;
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['message' => $e->getMessage()]);
            exit;
        }
    }

    public function getNewUsers() {
        try {
            $empleadoModel = new EmpleadoModel($this->pdo);
            $nuevosEmpleados = $empleadoModel->getNuevosEmpleados();

            header('Content-Type: application/json');
            echo json_encode($nuevosEmpleados);
            exit;
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['message' => $e->getMessage()]);
            exit;
        }
    }

    public function inactivar($id) {
        session_start();

        try {
            log_audit($this->pdo, $_SESSION['user_id'], 'inactivar_empleado', $id, 'empleado');
            $empleadoModel = new EmpleadoModel($this->pdo);
            $result = $empleadoModel->inactivarEmpleado($id);

            if ($result['success']) {
                $_SESSION['success_message'] = 'Empleado inactivado exitosamente.';
                header('Location: /empleados');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /empleados');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /empleados');
            exit;
        }
    }

    public function activar($id) {
        session_start();

        try {
            log_audit($this->pdo, $_SESSION['user_id'], 'activar_empleado', $id, 'empleado');
            $empleadoModel = new EmpleadoModel($this->pdo);
            $result = $empleadoModel->activarEmpleado($id);

            if ($result['success']) {
                $_SESSION['success_message'] = 'Empleado activado exitosamente.';
                header('Location: /empleados');
                exit;
            } else {
                $_SESSION['error_message'] = $result['message'];
                header('Location: /empleados');
                exit;
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e->getMessage();
            header('Location: /empleados');
            exit;
        }
    }

    public function listarPsicologos() {
        header('Content-Type: application/json');
        try {
            $empleadoModel = new EmpleadoModel($this->pdo);
            $psicologos = $empleadoModel->listarPsicologos();
            echo json_encode($psicologos);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['message' => $e->getMessage()]);
        }
    }
}