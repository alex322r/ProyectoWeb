<?php

namespace App\Models;

use PDO;

class HistorialClinicoModel
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function getHistorialByPacienteId($pacienteId)
    {
        $query = "SELECT * FROM historial_clinico WHERE id_paciente = :pacienteId";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':pacienteId', $pacienteId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch();
        } catch (\Exception $e) {
            error_log("Error fetching clinical history: " . $e->getMessage());
            return null;
        }
    }
}
