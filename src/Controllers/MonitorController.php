<?php 

namespace App\Controllers;

use PDO;

class MonitorController
{

  private $pdo;

  public function __construct(PDO $pdo)
  {
    $this->pdo = $pdo;
  }

  public function getStatus()
  {

    $estado = $this->obtenerEstadoServidor($this->pdo);
    $procesos = $this->obtenerProcesos($this->pdo);

    $data = [
      'estado' => $estado,
      'procesos' => $procesos

    ];

    header('Content-Type; application/json');
    echo json_encode($data);
  }

  private function obtenerEstadoServidor(PDO $pdo): array
  {

    $metricas_deseadas = ['Uptime', 'Threads_connected', 'Threads_running', 'Queries', 'Connections'];
    $in_placeholders = implode(',', array_fill(0, count($metricas_deseadas), '?'));
        
    $sql = "SHOW GLOBAL STATUS WHERE Variable_name IN ($in_placeholders)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($metricas_deseadas);
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
    $estado = [];
    foreach ($resultado as $fila) {
      $estado[$fila['Variable_name']] = $fila['Value'];
    }
    $estado['Estado_Conexion'] = 'online';
    return $estado;
  }
  private function obtenerProcesos(PDO $pdo): array
  
  {
        $stmt = $pdo->query("SHOW FULL PROCESSLIST");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
  
  }

}
