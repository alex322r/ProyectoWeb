<?php

namespace App\Models;

use PDO;
use Exception;

class PlanModel {

    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function crearPlan(array $data) {
        $query = "INSERT INTO plan (nombre, descripcion, numero_sesiones, precio, descuento, duracion_meses, activo) 
                  VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                $data['nombre'],
                $data['descripcion'] ?? null,
                $data['numero_sesiones'],
                $data['precio'],
                $data['descuento'] ?? 0.00,
                $data['duracion_meses'],
                $data['activo'] ?? 1
            ]);
            return ['success' => true, 'message' => 'Plan creado exitosamente.', 'id_plan' => $this->pdo->lastInsertId()];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al crear el plan: ' . $e->getMessage()];
        }
    }

    public function listarPlanes() {
        $query = "SELECT * FROM plan";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al listar planes: ' . $e->getMessage()];
        }
    }

    public function obtenerPlanPorId(int $id_plan) {
        $query = "SELECT * FROM plan WHERE id_plan = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_plan]);
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al obtener el plan: ' . $e->getMessage()];
        }
    }

    public function editarPlan(int $id_plan, array $data) {
        $query = "UPDATE plan SET nombre = ?, descripcion = ?, numero_sesiones = ?, precio = ?, descuento = ?, duracion_meses = ?, activo = ? WHERE id_plan = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                $data['nombre'],
                $data['descripcion'] ?? null,
                $data['numero_sesiones'],
                $data['precio'],
                $data['descuento'] ?? 0.00,
                $data['duracion_meses'],
                $data['activo'] ?? 1,
                $id_plan
            ]);
            return ['success' => true, 'message' => 'Plan editado exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al editar el plan: ' . $e->getMessage()];
        }
    }

    public function eliminarPlan(int $id_plan) {
        $query = "DELETE FROM plan WHERE id_plan = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_plan]);
            return ['success' => true, 'message' => 'Plan eliminado exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al eliminar el plan: ' . $e->getMessage()];
        }
    }

    public function activarPlan(int $id_plan) {
        $query = "UPDATE plan SET activo = 1 WHERE id_plan = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_plan]);
            return ['success' => true, 'message' => 'Plan activado exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al activar el plan: ' . $e->getMessage()];
        }
    }

    public function inactivarPlan(int $id_plan) {
        $query = "UPDATE plan SET activo = 0 WHERE id_plan = ?";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_plan]);
            return ['success' => true, 'message' => 'Plan inactivado exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al inactivar el plan: ' . $e->getMessage()];
        }
    }
}
