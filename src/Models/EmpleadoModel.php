<?php

namespace App\Models;

use PDO;
use Exception;

class EmpleadoModel {

  private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    // Métodos para gestionar usuarios (crear, editar, eliminar, listar, etc.)

    public function crearEmpleado(array $data) {
        // Lógica para crear un empleado
        
        $this->pdo->beginTransaction();

        // usando PereonaModel para crear la persona asociada al empleado
        $personaModel = new PersonaModel($this->pdo);
        $personaResult = $personaModel->crearPersona([
            'nombres' => $data['empleado_nombres'],
            'apellidos' => $data['empleado_apellidos'],
            'dni' => $data['empleado_dni'],
            'email' => $data['empleado_email'] ?? null,
            'direccion' => $data['empleado_direccion'] ?? null,
            'telefono' => $data['empleado_telefono'] ?? null,
            'fecha_nacimiento' => $data['empleado_fecha_nacimiento'] ?? null
        ]);
        if (!$personaResult['success']) {
            $this->pdo->rollBack();
            return ['success' => false, 'message' => 'Error al crear la persona para el empleado: ' . $personaResult['message']];
        } 
        $id_persona = $personaResult['id_persona'];

        // Ahora crear el empleado

        // default username and password if not provided
        if (empty($data['usuario'])) {
            $data['usuario'] = 'user' . $id_persona;
        }
        if (empty($data['clave'])) {
            $data['clave'] = 'password123';
        }

        $query = "INSERT INTO empleado(
            id_persona,
            rol,
            colegiatura,
            especialidad,
            usuario,
            clave
        ) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                $id_persona,
                $data['empleado_rol'],
                $data['colegiatura'] ?? null,
                $data['especialidad'] ?? null,
                $data['usuario'],
                password_hash($data['clave'], PASSWORD_BCRYPT)
            ]);

            $this->pdo->commit();
            // Retornar el ID del empleado creado
            return ['success' => true, 'message' => 'Empleado creado exitosamente.', 'id_empleado' => $this->pdo->lastInsertId()];
        } catch (Exception $e) {
            $this->pdo->rollBack();
            return ['success' => false, 'message' => 'Error al crear el empleado: ' . $e->getMessage()];
        }

    }

    public function listarEmpleados() {
        // Lógica para listar empleados

        $query = "SELECT 
                    e.id_empleado as id, 
                    p.dni, 
                    e.rol, 
                    e.usuario,
                    e.estado,
                    CONCAT(p.nombres, ' ', p.apellidos) as nombre_completo
                  FROM empleado e 
                  JOIN persona p ON e.id_persona = p.id_persona";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            // En un caso real, aquí se manejaría el error de forma más robusta
            return [];
        }
    }

    public function inactivarEmpleado($id_empleado) {
        $query = "UPDATE empleado SET estado = 'inactivo' WHERE id_empleado = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_empleado]);
            return ['success' => true, 'message' => 'Empleado inactivado exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al inactivar el empleado: ' . $e->getMessage()];
        }
    }

    public function activarEmpleado($id_empleado) {
        $query = "UPDATE empleado SET estado = 'activo' WHERE id_empleado = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_empleado]);
            return ['success' => true, 'message' => 'Empleado activado exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al activar el empleado: ' . $e->getMessage()];
        }
    }
    

    public function editarEmpleado($id_empleado, array $data) {
        // Lógica para editar un empleado

        $this->pdo->beginTransaction();

        try {
            // Primero, obtener el id_persona asociado
            $queryPersona = "SELECT id_persona FROM empleado WHERE id_empleado = ?";
            $stmtPersona = $this->pdo->prepare($queryPersona);
            $stmtPersona->execute([$id_empleado]);
            $empleado = $stmtPersona->fetch();

            if (!$empleado) {
                $this->pdo->rollBack();
                return ['success' => false, 'message' => 'Empleado no encontrado.'];
            }

            $id_persona = $empleado['id_persona'];

            // Actualizar datos en la tabla persona
            $personaModel = new PersonaModel($this->pdo);
            $personaResult = $personaModel->editarPersona($id_persona, [
                'nombres' => $data['empleado_nombres'],
                'apellidos' => $data['empleado_apellidos'],
                'dni' => $data['empleado_dni'],
                'email' => $data['empleado_email'] ?? null,
                'direccion' => $data['empleado_direccion'] ?? null,
                'telefono' => $data['empleado_telefono'] ?? null,
                'fecha_nacimiento' => $data['empleado_fecha_nacimiento'] ?? null
            ]);

            if (!$personaResult['success']) {
                $this->pdo->rollBack();
                return ['success' => false, 'message' => 'Error al editar la persona para el empleado: ' . $personaResult['message']];
            }

            // Actualizar datos en la tabla empleado
            $query = "UPDATE empleado SET 
                rol = ?, 
                colegiatura = ?, 
                especialidad = ?
                WHERE id_empleado = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                $data['empleado_rol'],
                $data['colegiatura'] ?? null,
                $data['especialidad'] ?? null,
                $id_empleado
            ]);

            // Si se proporciona un nuevo usuario, actualizarlo también
            if (!empty($data['usuario'])) {
                $queryUsuario = "UPDATE empleado SET usuario = ? WHERE id_empleado = ?";
                $stmtUsuario = $this->pdo->prepare($queryUsuario);
                $stmtUsuario->execute([
                    $data['usuario'],
                    $id_empleado
                ]);
            }
            
            // Si se proporciona una nueva clave, actualizarla también
            if (!empty($data['clave'])) {
                $queryClave = "UPDATE empleado SET clave = ? WHERE id_empleado = ?";
                $stmtClave = $this->pdo->prepare($queryClave);
                $stmtClave->execute([
                    password_hash($data['clave'], PASSWORD_BCRYPT),
                    $id_empleado
                ]);
            }

            $this->pdo->commit();
            return ['success' => true, 'message' => 'Empleado editado exitosamente.'];
        } catch (Exception $e) {
            $this->pdo->rollBack();
            return ['success' => false, 'message' => 'Error al editar el empleado: ' . $e->getMessage()];
        }

    }

    // eliminar Empleado 
    public function eliminarEmpleado($id_empleado) {
        // Lógica para eliminar un empleado

        $this->pdo->beginTransaction();

        try {
            // Primero, obtener el id_persona asociado
            $queryPersona = "SELECT id_persona FROM empleado WHERE id_empleado = ?";
            $stmtPersona = $this->pdo->prepare($queryPersona);
            $stmtPersona->execute([$id_empleado]);
            $empleado = $stmtPersona->fetch();

            if (!$empleado) {
                $this->pdo->rollBack();
                return ['success' => false, 'message' => 'Empleado no encontrado.'];
            }

            $id_persona = $empleado['id_persona'];

            // Eliminar el empleado
            $queryEliminarEmpleado = "DELETE FROM empleado WHERE id_empleado = ?";
            $stmtEliminarEmpleado = $this->pdo->prepare($queryEliminarEmpleado);
            $stmtEliminarEmpleado->execute([$id_empleado]);

            // Eliminar la persona asociada usando PersonaModel
            $personaModel = new PersonaModel($this->pdo);
            $personaResult = $personaModel->eliminarPersona($id_persona);
            if (!$personaResult['success']) {
                $this->pdo->rollBack();
                return ['success' => false, 'message' => 'Error al eliminar la persona asociada: ' . $personaResult['message']];
            }

            $this->pdo->commit();
            return ['success' => true, 'message' => 'Empleado eliminado exitosamente.'];
        } catch (Exception $e) {
            $this->pdo->rollBack();
            return ['success' => false, 'message' => 'Error al eliminar el empleado: ' . $e->getMessage()];
        }

    }

    public function obtenerEmpleadoPorId($id) {
        $query = "SELECT 
                    e.id_empleado as id, 
                    p.dni, 
                    e.rol, 
                    e.usuario,
                    CONCAT(p.nombres, ' ', p.apellidos) as nombre_completo,
                    p.email,
                    p.direccion,
                    p.telefono,
                    p.fecha_nacimiento
                  FROM empleado e 
                  JOIN persona p ON e.id_persona = p.id_persona
                  WHERE e.id_empleado = ?";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id]);
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            // En un caso real, aquí se manejaría el error de forma más robusta
            return null;
        }
    }

    public function getOnlineUsers() {
        $query = "SELECT 
                    e.id_empleado,
                    e.usuario,
                    e.rol,
                    CONCAT(p.nombres, ' ', p.apellidos) as nombre_completo,
                    e.last_activity
                  FROM empleado e
                  JOIN persona p ON e.id_persona = p.id_persona
                  WHERE e.last_activity > DATE_SUB(UTC_TIMESTAMP(), INTERVAL 5 MINUTE)";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            // Log the error or handle it as needed
            throw new Exception("Error al obtener usuarios en línea: " . $e->getMessage());
        }
    }

    public function getNuevosEmpleados() {
        $query = "SELECT 
                    e.id_empleado,
                    e.usuario,
                    e.rol,
                    CONCAT(p.nombres, ' ', p.apellidos) as nombre_completo,
                    e.fecha_registro
                  FROM empleado e
                  JOIN persona p ON e.id_persona = p.id_persona
                  WHERE e.fecha_registro >= DATE_SUB(UTC_TIMESTAMP(), INTERVAL 1 DAY)
                  ORDER BY e.fecha_registro DESC";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            throw new Exception("Error al obtener nuevos empleados: " . $e->getMessage());
        }
    }
}