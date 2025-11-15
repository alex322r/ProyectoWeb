<?php

namespace App\Controllers;

use PDO;

class DashboardController
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function getDashboardData()
    {
        $userRole = $_SESSION['user_role'] ?? 'invitado';

        if ($userRole === 'administrador') {
            return $this->getAdminDashboardData();
        } elseif ($userRole === 'recepcionista') {
            return $this->getReceptionistDashboardData();
        }

        return ['titulo' => 'Dashboard'];
    }

    private function getAdminDashboardData()
    {
        return [
            'titulo' => 'Dashboard de Administración',
            'paginaActiva' => 'dashboard'
        ];
    }

    private function getReceptionistDashboardData()
    {
        $proximasCitas = $this->getProximasCitas();
        return [
            'titulo' => 'Dashboard',
            'citasHoy' => 12, // Dato de ejemplo
            'ingresosDia' => 1220, // Dato de ejemplo
            'proximasCitas' => $proximasCitas,
            'paginaActiva' => 'dashboard'
        ];
    }

    private function getProximasCitas()
    {
        $query = "SELECT 
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
                  WHERE c.fecha_hora >= CURDATE()
                  ORDER BY c.fecha_hora ASC
                  LIMIT 5";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            // Log the error or handle it as needed
            error_log("Error fetching upcoming appointments: " . $e->getMessage());
            return [];
        }
    }
}
