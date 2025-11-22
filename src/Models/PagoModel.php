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

    public function getHistorialPagos($id_paciente) {
        $sql = "
            SELECT 
                p.fecha_pago,
                p.monto_pagado_paciente,
                COALESCE(c.motivo_consulta, pl.nombre) as descripcion
            FROM pago p
            LEFT JOIN cita c ON p.id_cita = c.id_cita
            LEFT JOIN plan_paciente pp ON p.id_plan_paciente = pp.id_plan_paciente
            LEFT JOIN plan pl ON pp.id_plan = pl.id_plan
            WHERE c.id_paciente = :id_paciente OR pp.id_paciente = :id_paciente
            ORDER BY p.fecha_pago DESC
        ";

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id_paciente' => $id_paciente]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al obtener historial de pagos: " . $e->getMessage());
            return [];
        }
    }

    public function crearPagoPendiente($id_cita, $monto) {
        $sql = "
            INSERT INTO pago (id_cita, monto, monto_pagado_paciente, estado)
            VALUES (:id_cita, :monto, 0, 'pendiente')
        ";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':id_cita' => $id_cita,
                ':monto' => $monto,
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

    public function getPagosDelDia() {
        $sql = "
            SELECT 
                p.fecha_pago,
                p.monto_pagado_paciente,
                mp.tipo as metodo_pago,
                COALESCE(CONCAT(per_pac.nombres, ' ', per_pac.apellidos), CONCAT(per_emp.nombres, ' ', per_emp.apellidos)) as persona,
                COALESCE(c.motivo_consulta, pl.nombre) as descripcion
            FROM pago p
            LEFT JOIN cita c ON p.id_cita = c.id_cita
            LEFT JOIN paciente pac ON c.id_paciente = pac.id_paciente
            LEFT JOIN persona per_pac ON pac.id_persona = per_pac.id_persona
            LEFT JOIN plan_paciente pp ON p.id_plan_paciente = pp.id_plan_paciente
            LEFT JOIN plan pl ON pp.id_plan = pl.id_plan
            LEFT JOIN metodo_pago mp ON p.id_metodo_pago = mp.id_metodo_pago
            LEFT JOIN empleado emp ON p.id_empleado_caja = emp.id_empleado
            LEFT JOIN persona per_emp ON emp.id_persona = per_emp.id_persona
            WHERE DATE(p.fecha_pago) = CURDATE()
            ORDER BY p.fecha_pago DESC
        ";

        try {
            $stmt = $this->pdo->query($sql);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al obtener los pagos del día: " . $e->getMessage());
            return [];
        }
    }
}
