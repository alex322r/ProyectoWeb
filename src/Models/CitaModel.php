<?php

namespace App\Models;

use PDO;

class CitaModel
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
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
}
