<?php

namespace App\Controllers;

use PDO;

class HistorialController
{
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function index()
    {
        view('buscar_historial', [
            'titulo' => 'Buscar Historial Clínico',
            'paginaActiva' => 'buscar_historial'
        ]);
    }
}
