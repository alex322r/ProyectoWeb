<?php

namespace App\Models;

use PDO;
use Exception;

class PagoModel {
    private $pdo;

    public function __construct(PDO $pdo) {
        $this->pdo = $pdo;
    }

    public function getMetodosDePago() {
        try {
            $stmt = $this->pdo->query("SELECT id_metodo_pago, tipo FROM metodo_pago ORDER BY tipo");
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al obtener metodos de pago: " . $e->getMessage());
            return [];
        }
    }

    public function getCitasPendientes($id_paciente) {
        $sql = "
            SELECT 
                c.id_cita,
                c.fecha_hora,
                c.motivo_consulta,
                COALESCE(pl.precio / pl.numero_sesiones, 50.00) AS monto_sugerido
            FROM cita c
            LEFT JOIN paciente pa ON c.id_paciente = pa.id_paciente
            LEFT JOIN plan_paciente pp ON pa.id_paciente = pp.id_paciente AND pp.vigente = 1
            LEFT JOIN plan pl ON pp.id_plan = pl.id_plan
            LEFT JOIN pago p ON c.id_cita = p.id_cita AND p.estado = 'completado'
            WHERE c.id_paciente = :id_paciente
              AND c.estado = 'programada'
              AND p.id_pago IS NULL
            ORDER BY c.fecha_hora ASC
        ";

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id_paciente' => $id_paciente]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al obtener citas pendientes: " . $e->getMessage());
            return [];
        }
    }

    public function getPlanesPendientes($id_paciente) {
        $sql = "
            SELECT
                pp.id_plan_paciente,
                pl.nombre AS nombre_plan,
                pl.precio AS monto_sugerido
            FROM plan_paciente pp
            JOIN plan pl ON pp.id_plan = pl.id_plan
            LEFT JOIN pago p ON pp.id_plan_paciente = p.id_plan_paciente AND p.estado = 'completado'
            WHERE pp.id_paciente = :id_paciente
              AND pp.vigente = 1
              AND p.id_pago IS NULL
            ORDER BY pp.fecha_inicio DESC
        ";

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id_paciente' => $id_paciente]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al obtener planes pendientes: " . $e->getMessage());
            return [];
        }
    }

    public function crearPagoPendiente($id_cita, $monto) {
        $sql = "
            INSERT INTO pago (id_cita, monto, monto_pagado_paciente, estado)
            VALUES (:id_cita, :monto, :monto_pagado_paciente, 'pendiente')
        ";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':id_cita' => $id_cita,
                ':monto' => $monto,
                ':monto_pagado_paciente' => 0.00 // Set to 0 as it is a pending payment
            ]);
            return ['success' => true, 'id_pago' => $this->pdo->lastInsertId()];
        } catch (Exception $e) {
            error_log("Error al crear pago pendiente: " . $e->getMessage());
            return ['success' => false, 'message' => 'Error al crear pago pendiente.'];
        }
    }

    public function crearPago($data) {
        $sql = "
            INSERT INTO pago (id_cita, id_plan_paciente, id_metodo_pago, monto, monto_pagado_paciente, estado)
            VALUES (:id_cita, :id_plan_paciente, :id_metodo_pago, :monto, :monto_pagado_paciente, 'completado')
        ";

        $this->pdo->beginTransaction();
        try {
            $stmt = $this->pdo->prepare($sql);
            
            $id_cita = null;
            $id_plan_paciente = null;

            if ($data['tipo_deuda'] === 'cita') {
                $id_cita = $data['id_deuda'];
            } elseif ($data['tipo_deuda'] === 'plan') {
                $id_plan_paciente = $data['id_deuda'];
            }

            $stmt->execute([
                ':id_cita' => $id_cita,
                ':id_plan_paciente' => $id_plan_paciente,
                ':id_metodo_pago' => $data['id_metodo_pago'],
                ':monto' => $data['monto'],
                ':monto_pagado_paciente' => $data['monto'],
            ]);
            
            // If it's a cita, update cita status
            if ($id_cita) {
                $stmt = $this->pdo->prepare("UPDATE cita SET estado = 'completada' WHERE id_cita = :id_cita");
                $stmt->execute([':id_cita' => $id_cita]);
            }

            $this->pdo->commit();
            return ['success' => true];

        } catch (Exception $e) {
            $this->pdo->rollBack();
            error_log("Error al crear el pago: " . $e->getMessage());
            return ['success' => false, 'message' => 'Error al crear el pago.'];
        }
    }
}
