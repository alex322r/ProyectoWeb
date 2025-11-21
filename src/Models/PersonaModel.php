<?php

namespace App\Models;
use PDO;
use Exception;

class PersonaModel {

  private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function crearPersona(array $data) {
        // Lógica para crear un empleado

        $query = "INSERT INTO persona(
            nombres,
            apellidos,
            dni,
            email,
            direccion,
            telefono,
            fecha_nacimiento
        ) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                $data['nombres'],
                $data['apellidos'],
                $data['dni'],
                $data['email'] ?? null,
                $data['direccion'] ?? null,
                $data['telefono'] ?? null,
                $data['fecha_nacimiento'] ?? null
            ]);

            // Retornar el ID de la persona creada
            return ['success' => true, 'message' => 'Persona creada exitosamente.', 'id_persona' => $this->pdo->lastInsertId()];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al crear la persona: ' . $e->getMessage()];
        }
    }

    public function actualizarPersona(int $id_persona, array $data) {
        $query = "UPDATE persona SET 
            nombres = ?, 
            apellidos = ?, 
            dni = ?, 
            email = ?
            WHERE id_persona = ?";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                $data['nombres'],
                $data['apellidos'],
                $data['dni'],
                $data['email'] ?? null,
                $id_persona
            ]);

            return ['success' => true, 'message' => 'Persona actualizada exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al actualizar la persona: ' . $e->getMessage()];
        }
    }

    // eliminar Persona

    public function findByDni(string $dni) {
        $query = "SELECT * FROM persona WHERE dni = ?";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$dni]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result ? $result : null;
        } catch (Exception $e) {
            // Manejar el error apropiadamente
            return null;
        }
    }

    public function eliminarPersona(int $id_persona) {
        $query = "DELETE FROM persona WHERE id_persona = ?";

        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([$id_persona]);

            return ['success' => true, 'message' => 'Persona eliminada exitosamente.'];
        } catch (Exception $e) {
            return ['success' => false, 'message' => 'Error al eliminar la persona: ' . $e->getMessage()];
        }
    }

}