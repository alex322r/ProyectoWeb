<?php

namespace App\Controllers;

use App\Models\PagoModel;
use PDO;

class PagoController
{
    private $pagoModel;

    public function __construct(PDO $pdo)
    {
        $this->pagoModel = new PagoModel($pdo);
    }

    public function index()
    {
        $metodos_pago = $this->pagoModel->getMetodosDePago();
        view('pagos', [
            'titulo' => 'Gestión de Pagos',
            'paginaActiva' => 'pagos',
            'metodos_pago' => $metodos_pago
        ]);
    }

    public function historial($id_paciente)
    {
        header('Content-Type: application/json');
        $historial = $this->pagoModel->getHistorialPagos($id_paciente);

        echo json_encode([
            'success' => true,
            'data' => $historial,
        ]);
    }

    public function deudas($id_paciente)
    {
        header('Content-Type: application/json');
        $citas = $this->pagoModel->getCitasPendientes($id_paciente);
        $planes = $this->pagoModel->getPlanesPendientes($id_paciente);

        echo json_encode([
            'success' => true,
            'data' => [
                'citas' => $citas,
                'planes' => $planes,
            ],
        ]);
    }

    public function crear()
    {
        header('Content-Type: application/json');
        $data = json_decode(file_get_contents('php://input'), true);

        $result = $this->pagoModel->crearPago($data);

        if ($result['success']) {
            echo json_encode(['success' => true, 'message' => 'Pago creado exitosamente.']);
        } else {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => $result['message']]);
        }
    }

    public function reportes()
    {
        $pagos = $this->pagoModel->getPagosDelDia();

        error_log('Pagos del día: ' . print_r($pagos, true));

        return [
            'view' => 'reportes_caja.php',
            'titulo' => 'Reporte de Caja',
            'paginaActiva' => 'reportes',
            'pagos' => $pagos,
        ];
    }
}