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

  public function getSystemStatus()
  {
    try {
      $cpuLoad = sys_getloadavg();

      // RAM usage
      $memInfo = file_get_contents('/proc/meminfo');
      preg_match('/MemTotal:\s+(\d+)/', $memInfo, $memTotal);
      preg_match('/MemFree:\s+(\d+)/', $memInfo, $memFree);
      preg_match('/Buffers:\s+(\d+)/', $memInfo, $memBuffers);
      preg_match('/Cached:\s+(\d+)/', $memInfo, $memCached);

      $totalRam = intval($memTotal[1]);
      $freeRam = intval($memFree[1]) + intval($memBuffers[1]) + intval($memCached[1]);
      $usedRam = $totalRam - $freeRam;
      $ramUsage = ($usedRam / $totalRam) * 100;

      // Disk usage
      $diskTotal = disk_total_space('/');
      $diskFree = disk_free_space('/');
      $diskUsed = $diskTotal - $diskFree;
      $diskUsage = ($diskUsed / $diskTotal) * 100;

      $data = [
        'cpu' => [
          'load' => $cpuLoad,
        ],
        'ram' => [
          'total' => $totalRam,
          'free' => $freeRam,
          'used' => $usedRam,
          'usage' => round($ramUsage, 2),
        ],
        'disk' => [
          'total' => $diskTotal,
          'free' => $diskFree,
          'used' => $diskUsed,
          'usage' => round($diskUsage, 2),
        ],
      ];

      header('Content-Type: application/json');
      echo json_encode($data);
    } catch (Exception $e) {
      header('Content-Type: application/json', true, 500);
      echo json_encode(['error' => 'Could not get system status', 'details' => $e->getMessage()]);
    }
  }
  public function getApplicationLogs()
  {
    $logFilePath = '/home/alexis/error.log';

    $logs = [];
    if (is_readable($logFilePath)) {
      $file = fopen($logFilePath, 'r');
      if ($file) {
        while (($line = fgets($file)) !== false) {
          // Try to parse the line with a regex
          if (preg_match('/^\[(.*?)\]\s*(.*)$/', $line, $matches)) {
            $logs[] = [
              'timestamp' => $matches[1],
              'message' => trim($matches[2])
            ];
          } else {
            // If the line doesn't match the expected format, try a different regex
            if (preg_match('/^(\d{4}[-\/]\d{2}[-\/]\d{2}(\s\d{2}:\d{2}:\d{2})?)\s*(.*)$/', trim($line), $matches)) {
              $logs[] = [
                'timestamp' => $matches[1],
                'message' => trim($matches[3])
              ];
            } else {
              // If no timestamp is found, treat the whole line as a message
              $logs[] = [
                'timestamp' => '',
                'message' => trim($line)
              ];
            }
          }
        }
        fclose($file);
      }
      $logs = array_reverse($logs); // Show most recent logs first
    } else {
      $logs[] = ['timestamp' => '', 'message' => 'Could not read error log file. Please check permissions or path.'];
    }

    $stmt = $this->pdo->query("SELECT * FROM access_logs ORDER BY timestamp DESC LIMIT 100");
    $accessLogs = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmt = $this->pdo->query("SELECT al.*, p.nombres, p.apellidos FROM audit_logs al LEFT JOIN empleado e ON al.user_id = e.id_empleado LEFT JOIN persona p ON e.id_persona = p.id_persona ORDER BY al.timestamp DESC LIMIT 100");
    $auditLogs = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return [
      'titulo' => 'Registros de Aplicación',
      'paginaActiva' => 'registros',
      'logs' => $logs,
      'accessLogs' => $accessLogs,
      'auditLogs' => $auditLogs
    ];
  }

}
