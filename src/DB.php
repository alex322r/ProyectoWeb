<?php

namespace App;

use PDO;
use PDOException;

class DB {
    private static $instance = null;
    private $pdo;

    private function __construct() {
        $config = Config::get('db');

        $host = $config['host'] ?? 'localhost';
        $db = $config['name'] ?? 'consultorio_psicologico';
        $user = $config['user'] ?? 'root';
        $pass = $config['pass'] ?? '';
        $charset = 'utf8mb4';

        $dsn = "mysql:host=$host;port=3306;dbname=$db;charset=$charset";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];

        try {
            $this->pdo = new PDO($dsn, $user, $pass, $options);
        } catch (PDOException $e) {
            throw new PDOException($e->getMessage(), (int)$e->getCode());
        }
    }

    public static function getInstance() {
        if (self::$instance == null) {
            self::$instance = new DB();
        }

        return self::$instance;
    }

    public function getConnection() {
        return $this->pdo;
    }
}
