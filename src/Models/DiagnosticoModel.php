<?php

namespace App\Models;

use PDO;

class DiagnosticoModel
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function getByHistorialId($historialId)
    {
        $query = "SELECT * FROM diagnostico WHERE id_historial = :historialId";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':historialId', $historialId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch();
        } catch (\Exception $e) {
            error_log("Error fetching diagnosis: " . $e->getMessage());
            return null;
        }
    }

    public function getByCitaId($citaId)
    {
        $query = "SELECT * FROM diagnostico WHERE id_cita = :citaId";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':citaId', $citaId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch();
        } catch (\Exception $e) {
            error_log("Error fetching diagnosis by cita: " . $e->getMessage());
            return null;
        }
    }

    public function crear($data)
    {
        $query = "INSERT INTO diagnostico (id_cita, id_historial, codigo_diagnostico, descripcion, fecha, severidad, estado) VALUES (:id_cita, :id_historial, :codigo_diagnostico, :descripcion, :fecha, :severidad, :estado)";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':id_cita', $data['id_cita'], PDO::PARAM_INT);
            $stmt->bindParam(':id_historial', $data['id_historial'], PDO::PARAM_INT);
            $stmt->bindParam(':codigo_diagnostico', $data['codigo_diagnostico']);
            $stmt->bindParam(':descripcion', $data['descripcion']);
            $stmt->bindParam(':fecha', $data['fecha']);
            $stmt->bindParam(':severidad', $data['severidad']);
            $stmt->bindParam(':estado', $data['estado']);
            return $stmt->execute();
        } catch (\Exception $e) {
            error_log("Error creating diagnosis: " . $e->getMessage());
            return false;
        }
    }

    public function actualizar($id_diagnostico, $data)
    {
        $query = "UPDATE diagnostico SET id_cita = :id_cita, id_historial = :id_historial, codigo_diagnostico = :codigo_diagnostico, descripcion = :descripcion, fecha = :fecha, severidad = :severidad, estado = :estado WHERE id_diagnostico = :id_diagnostico";
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':id_diagnostico', $id_diagnostico, PDO::PARAM_INT);
            $stmt->bindParam(':id_cita', $data['id_cita'], PDO::PARAM_INT);
            $stmt->bindParam(':id_historial', $data['id_historial'], PDO::PARAM_INT);
            $stmt->bindParam(':codigo_diagnostico', $data['codigo_diagnostico']);
            $stmt->bindParam(':descripcion', $data['descripcion']);
            $stmt->bindParam(':fecha', $data['fecha']);
            $stmt->bindParam(':severidad', $data['severidad']);
            $stmt->bindParam(':estado', $data['estado']);
            return $stmt->execute();
        } catch (\Exception $e) {
            error_log("Error updating diagnosis: " . $e->getMessage());
            return false;
        }
    }
}
