<?php

namespace App\Models;

use PDO;
use Exception;
use App\Models\PagoModel; // Include PagoModel

class CitaModel
{
    private $pdo;
    private $pagoModel; // Declare pagoModel property

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
        $this->pagoModel = new PagoModel($pdo); // Instantiate PagoModel
    }

    public function getUltimasCitas($limit = 10)
    {
        $query = "SELECT 
                    c.id_cita,
                    c.fecha_hora,
                    CONCAT(p.nombres, ' ', p.apellidos) as nombre_paciente,
                    CONCAT(e_p.nombres, ' ', e_p.apellidos) as nombre_psicologo,
                    c.estado
                  FROM cita c
                  JOIN paciente pa ON c.id_paciente = pa.id_paciente
                  JOIN cliente cl ON pa.id_cliente = cl.id_cliente
                  JOIN persona p ON cl.id_persona = p.id_persona
                  JOIN empleado e ON c.id_empleado_psicologo = e.id_empleado
                  JOIN persona e_p ON e.id_persona = e_p.id_persona
                  ORDER BY c.fecha_hora DESC
                  LIMIT :limit";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (\Exception $e) {
            error_log("Error fetching last appointments: " . $e->getMessage());
            return [];
        }
    }
    public function getCitasByPacienteId($pacienteId)
    {
        $query = "SELECT 
                    c.id_cita,
                    c.fecha_hora,
                    CONCAT(e_p.nombres, ' ', e_p.apellidos) as nombre_psicologo,
                    c.motivo_consulta,
                    c.estado
                  FROM cita c
                  LEFT JOIN empleado e ON c.id_empleado_psicologo = e.id_empleado
                  LEFT JOIN persona e_p ON e.id_persona = e_p.id_persona
                  WHERE c.id_paciente = :pacienteId
                  ORDER BY c.fecha_hora DESC";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':pacienteId', $pacienteId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (\Exception $e) {
            error_log("Error fetching appointments for patient: " . $e->getMessage());
            return [];
        }
    }

    public function createCita($data) {
        $this->pdo->beginTransaction();
        try {
            $sql = "INSERT INTO cita (id_paciente, id_empleado_psicologo, fecha_hora, motivo_consulta, estado) 
                    VALUES (:id_paciente, :id_empleado_psicologo, :fecha_hora, :motivo_consulta, 'programada')";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':id_paciente' => $data['id_paciente'],
                ':id_empleado_psicologo' => $data['id_empleado_psicologo'],
                ':fecha_hora' => $data['fecha_hora'],
                ':motivo_consulta' => $data['motivo_consulta']
            ]);
            $id_cita = $this->pdo->lastInsertId();

            // Create a pending payment for the new appointment
            $pagoResult = $this->pagoModel->crearPagoPendiente(
                $id_cita, 
                $data['id_paciente'], 
                50.00, // Default monto, this could be dynamic
                'Pago pendiente por cita'
            );

            if (!$pagoResult['success']) {
                throw new Exception("Cita creada pero no se pudo generar el pago pendiente: " . $pagoResult['message']);
            }

            $this->pdo->commit();
            return ['success' => true, 'message' => 'Cita creada exitosamente y pago pendiente generado.', 'id_cita' => $id_cita];
        } catch (Exception $e) {
            $this->pdo->rollBack();
            error_log("Error al crear cita: " . $e->getMessage());
            return ['success' => false, 'message' => $e->getMessage()];
        }
    }

    public function updateCita($id_cita, $data) {
        $sql = "UPDATE cita SET id_paciente = :id_paciente, id_empleado_psicologo = :id_empleado_psicologo, 
                fecha_hora = :fecha_hora, motivo_consulta = :motivo_consulta, estado = :estado 
                WHERE id_cita = :id_cita";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':id_paciente' => $data['id_paciente'],
                ':id_empleado_psicologo' => $data['id_empleado_psicologo'],
                ':fecha_hora' => $data['fecha_hora'],
                ':motivo_consulta' => $data['motivo_consulta'],
                ':estado' => $data['estado'],
                ':id_cita' => $id_cita
            ]);
            return ['success' => true];
        } catch (\Exception $e) {
            error_log("Error updating appointment: " . $e->getMessage());
            return ['success' => false, 'message' => 'Error al actualizar la cita.'];
        }
    }

    public function deleteCita($id_cita) {
        $sql = "DELETE FROM cita WHERE id_cita = :id_cita";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id_cita' => $id_cita]);
            return ['success' => true];
        } catch (\Exception $e) {
            error_log("Error deleting appointment: " . $e->getMessage());
            return ['success' => false, 'message' => 'Error al eliminar la cita.'];
        }
    }

    public function cancelCita($id_cita) {
        $sql = "UPDATE cita SET estado = 'cancelada' WHERE id_cita = :id_cita";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id_cita' => $id_cita]);
            return ['success' => true];
        } catch (\Exception $e) {
            error_log("Error canceling appointment: " . $e->getMessage());
            return ['success' => false, 'message' => 'Error al cancelar la cita.'];
        }
    }

    public function isTimeSlotAvailable($id_empleado_psicologo, $fecha_hora, $id_cita = null) {
        // Assume a fixed duration of 1 hour for each appointment
        $start_time = date('Y-m-d H:i:s', strtotime($fecha_hora));
        $end_time = date('Y-m-d H:i:s', strtotime($fecha_hora . ' +1 hour'));

        $sql = "SELECT COUNT(*) FROM cita 
                WHERE id_empleado_psicologo = :id_empleado_psicologo 
                AND estado = 'programada'
                AND (
                    (fecha_hora >= :start_time AND fecha_hora < :end_time) OR
                    (ADDTIME(fecha_hora, '01:00:00') > :start_time AND ADDTIME(fecha_hora, '01:00:00') <= :end_time)
                )";
        
        $params = [
            ':id_empleado_psicologo' => $id_empleado_psicologo,
            ':start_time' => $start_time,
            ':end_time' => $end_time
        ];

        if ($id_cita) {
            $sql .= " AND id_cita != :id_cita";
            $params[':id_cita'] = $id_cita;
        }

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchColumn() == 0;
        } catch (\Exception $e) {
            error_log("Error checking time slot availability: " . $e->getMessage());
            return false;
        }
    }

    public function getById($id_cita)
    {
        $query = "SELECT 
                    id_cita,
                    id_paciente,
                    id_empleado_psicologo,
                    fecha_hora,
                    motivo_consulta,
                    estado
                  FROM cita
                  WHERE id_cita = :id_cita";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':id_cita', $id_cita, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch();
        } catch (\Exception $e) {
            error_log("Error fetching appointment by ID: " . $e->getMessage());
            return null;
        }
    }
}
