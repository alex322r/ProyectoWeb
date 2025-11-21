<?php

namespace App\Models;

use PDO;
use Exception;

class PacienteModel {
    private $pdo;
    private $personaModel;

    public function __construct(PDO $pdo) {
        $this->pdo = $pdo;
        $this->personaModel = new PersonaModel($pdo);
    }

    private function findOrCreatePersona($dni, $nombres, $apellidos, $email = null) {
        $persona = $this->personaModel->findByDni($dni);
        if ($persona) {
            return $persona['id_persona'];
        } else {
            $result = $this->personaModel->crearPersona([
                'dni' => $dni,
                'nombres' => $nombres,
                'apellidos' => $apellidos,
                'email' => $email
            ]);
            if ($result['success']) {
                return $result['id_persona'];
            } else {
                throw new Exception($result['message']);
            }
        }
    }

    private function findOrCreateClienteFromPersona($id_persona) {
        $stmt = $this->pdo->prepare("SELECT id_cliente FROM cliente WHERE id_persona = :id_persona AND tipo = 'natural'");
        $stmt->execute([':id_persona' => $id_persona]);
        $cliente = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($cliente) {
            return $cliente['id_cliente'];
        } else {
            $stmt = $this->pdo->prepare("INSERT INTO cliente (id_persona, tipo) VALUES (:id_persona, 'natural')");
            $stmt->execute([':id_persona' => $id_persona]);
            return $this->pdo->lastInsertId();
        }
    }

    private function findOrCreateClienteEmpresa($ruc, $razon_social) {
        $stmt = $this->pdo->prepare("SELECT id_cliente FROM cliente WHERE ruc = :ruc AND tipo = 'juridica'");
        $stmt->execute([':ruc' => $ruc]);
        $cliente = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($cliente) {
            return $cliente['id_cliente'];
        } else {
            $stmt = $this->pdo->prepare("INSERT INTO cliente (ruc, razon_social, tipo) VALUES (:ruc, :razon_social, 'juridica')");
            $stmt->execute([':ruc' => $ruc, ':razon_social' => $razon_social]);
            return $this->pdo->lastInsertId();
        }
    }

    public function crearPaciente($data) {
        $this->pdo->beginTransaction();
        try {
            // 1. Crear o verificar la persona (paciente)
            $paciente_id_persona = $this->findOrCreatePersona(
                $data['paciente_dni'],
                $data['paciente_nombres'],
                $data['paciente_apellidos'],
                $data['paciente_email']
            );

            // 2. Determinar el cliente_id
            $cliente_id = null;
            switch ($data['billingType']) {
                case 'same':
                    $cliente_id = $this->findOrCreateClienteFromPersona($paciente_id_persona);
                    break;
                case 'other':
                    $responsable_id_persona = $this->findOrCreatePersona(
                        $data['cliente_dni'],
                        $data['cliente_nombres'],
                        '' // Apellidos no presentes en el formulario para 'otro'
                    );
                    $cliente_id = $this->findOrCreateClienteFromPersona($responsable_id_persona);
                    break;
                case 'company':
                    $cliente_id = $this->findOrCreateClienteEmpresa(
                        $data['cliente_ruc'],
                        $data['cliente_razon_social']
                    );
                    break;
            }

            // 3. Crear el paciente en la tabla 'paciente'
            $stmt = $this->pdo->prepare(
                "INSERT INTO paciente (id_persona, id_cliente, estado) 
                 VALUES (:id_persona, :id_cliente, 'en tratamiento')"
            );
            $stmt->execute([
                ':id_persona' => $paciente_id_persona,
                ':id_cliente' => $cliente_id
            ]);
            
            $this->pdo->commit();

            return ['success' => true, 'message' => 'Paciente registrado con éxito.'];

        } catch (Exception $e) {
            $this->pdo->rollBack();
            // Loggear el error real en el servidor
            error_log("Error al crear paciente: " . $e->getMessage());
            // Enviar un mensaje genérico al cliente
            throw new Exception('Hubo un problema al registrar el paciente. Por favor, intente de nuevo.');
        }
    }    
    
    public function listarPacientes($searchTerm = '') {
        $sql = "
            SELECT 
                p.id_paciente,
                pe.nombres,
                pe.apellidos,
                pe.dni,
                p.estado,
                c.id_cita AS ultima_cita_id,
                c.fecha_hora AS ultima_cita,
                c.estado AS estado_cita,
                pa.monto AS monto_pago,
                pa.estado AS estado_pago
            FROM 
                paciente p
            JOIN 
                persona pe ON p.id_persona = pe.id_persona
            LEFT JOIN
                cita c ON c.id_cita = (
                    SELECT MAX(c2.id_cita)
                    FROM cita c2
                    WHERE c2.id_paciente = p.id_paciente
                )
            LEFT JOIN
                pago pa ON c.id_cita = pa.id_cita
            WHERE p.estado != 'eliminado'
        ";

        $params = [];
        if (!empty($searchTerm)) {
            $sql .= " AND (pe.dni LIKE :term OR CONCAT(pe.nombres, ' ', pe.apellidos) LIKE :term)";
            $params[':term'] = '%' . $searchTerm . '%';
        }

        $sql .= " ORDER BY pe.apellidos, pe.nombres";

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al listar pacientes: " . $e->getMessage());
            return [];
        }
    }

    public function getById($id_paciente) {
        $sql = "
            SELECT
                p.id_paciente,
                p.estado,
                -- Datos del paciente (persona)
                pe_pac.dni AS paciente_dni,
                pe_pac.nombres AS paciente_nombres,
                pe_pac.apellidos AS paciente_apellidos,
                pe_pac.email AS paciente_email,
                -- Datos del cliente/responsable
                c.tipo AS cliente_tipo,
                c.ruc AS cliente_ruc,
                c.razon_social AS cliente_razon_social,
                -- Datos del responsable (persona)
                pe_resp.dni AS responsable_dni,
                pe_resp.nombres AS responsable_nombres,
                pe_resp.apellidos AS responsable_apellidos
            FROM
                paciente p
            JOIN
                persona pe_pac ON p.id_persona = pe_pac.id_persona
            LEFT JOIN
                cliente c ON p.id_cliente = c.id_cliente
            LEFT JOIN
                persona pe_resp ON c.id_persona = pe_resp.id_persona
            WHERE
                p.id_paciente = :id_paciente
        ";

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id_paciente' => $id_paciente]);
            $paciente = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$paciente) {
                return null;
            }

            // Simplificar la estructura de datos para el frontend
            $profile = [
                'id_paciente' => $paciente['id_paciente'],
                'nombre_completo' => $paciente['paciente_nombres'] . ' ' . $paciente['paciente_apellidos'],
                'dni' => $paciente['paciente_dni'],
                'email' => $paciente['paciente_email'] ?: 'No registrado',
                'estado' => ucfirst($paciente['estado']),
                'facturacion' => []
            ];

            switch ($paciente['cliente_tipo']) {
                case 'natural':
                    // Si el DNI del responsable es el mismo que el del paciente
                    if ($paciente['responsable_dni'] === $paciente['paciente_dni']) {
                        $profile['facturacion']['tipo'] = 'El mismo paciente';
                    } else {
                        $profile['facturacion']['tipo'] = 'Otro responsable';
                        $profile['facturacion']['nombre'] = $paciente['responsable_nombres'] . ' ' . $paciente['responsable_apellidos'];
                        $profile['facturacion']['dni'] = $paciente['responsable_dni'];
                    }
                    break;
                case 'juridica':
                    $profile['facturacion']['tipo'] = 'Empresa';
                    $profile['facturacion']['razon_social'] = $paciente['cliente_razon_social'];
                    $profile['facturacion']['ruc'] = $paciente['cliente_ruc'];
                    break;
                default:
                    $profile['facturacion']['tipo'] = 'No especificado';
                    break;
            }

            return $profile;

        } catch (Exception $e) {
            error_log("Error al obtener paciente por ID: " . $e->getMessage());
            return null;
        }
    }

    public function getUltimosPacientes($limit) {
        $sql = "
            SELECT 
                p.id_paciente,
                pe.nombres,
                pe.apellidos,
                pe.dni,
                p.estado
            FROM 
                paciente p
            JOIN 
                persona pe ON p.id_persona = pe.id_persona
            ORDER BY 
                p.id_paciente DESC
            LIMIT :limit
        ";

        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Error al listar los ultimos pacientes: " . $e->getMessage());
            return [];
        }
    }

    public function updateEstadoPaciente($id_paciente, $estado) {
        $validStates = ['en tratamiento', 'alta', 'suspendido', 'eliminado'];
        if (!in_array($estado, $validStates)) {
            throw new Exception("Estado inválido proporcionado: " . $estado);
        }

        $sql = "UPDATE paciente SET estado = :estado WHERE id_paciente = :id_paciente";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':estado' => $estado,
                ':id_paciente' => $id_paciente
            ]);
            return ['success' => true, 'message' => 'Estado del paciente actualizado con éxito.'];
        } catch (Exception $e) {
            error_log("Error al actualizar el estado del paciente: " . $e->getMessage());
            return ['success' => false, 'message' => 'Error al actualizar el estado del paciente.'];
        }
    }

    public function delete($id_paciente) {
        return $this->updateEstadoPaciente($id_paciente, 'eliminado');
    }

    public function actualizarPaciente($id_paciente, $data) {
        $this->pdo->beginTransaction();
        try {
            // 1. Obtener el id_persona del paciente
            $stmt = $this->pdo->prepare("SELECT id_persona FROM paciente WHERE id_paciente = :id_paciente");
            $stmt->execute([':id_paciente' => $id_paciente]);
            $paciente = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$paciente) {
                throw new Exception("Paciente no encontrado.");
            }
            $id_persona = $paciente['id_persona'];

            // 2. Actualizar la información en la tabla 'persona'
            $personaModel = new PersonaModel($this->pdo);
            $result = $personaModel->actualizarPersona($id_persona, [
                'dni' => $data['dni'],
                'nombres' => $data['nombres'],
                'apellidos' => $data['apellidos'],
                'email' => $data['email']
            ]);

            if (!$result['success']) {
                throw new Exception($result['message']);
            }

            $this->pdo->commit();
            return ['success' => true, 'message' => 'Paciente actualizado con éxito.'];

        } catch (Exception $e) {
            $this->pdo->rollBack();
            error_log("Error al actualizar paciente: " . $e->getMessage());
            return ['success' => false, 'message' => 'Hubo un problema al actualizar el paciente.'];
        }
    }
}
