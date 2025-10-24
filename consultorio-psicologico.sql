/* Consultorio Psicologico Database */
-- Mysql
-- create database consultorio_psicologico if not exists;

CREATE DATABASE IF NOT EXISTS consultorio_psicologico;
USE consultorio_psicologico;

-- DROP TABLE IF EXISTS empleado;
-- DROP TABLE IF EXISTS cliente;
/*DROP TABLE IF EXISTS persona_natural;
DROP TABLE IF EXISTS persona_juridica;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS seguro;
DROP TABLE IF EXISTS paciente_seguro;
DROP TABLE IF EXISTS historial_clinico;
DROP TABLE IF EXISTS cita;
DROP TABLE IF EXISTS diagnostico;
DROP TABLE IF EXISTS tratamiento;
DROP TABLE IF EXISTS plan;
DROP TABLE IF EXISTS plan_paciente;
DROP TABLE IF EXISTS pago;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS transaccion;
DROP TABLE IF EXISTS caja;*/

-- tabla empleado
CREATE TABLE persona(
	id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni CHAR(8) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
	fecha_nacimiento DATE
);
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    rol ENUM('psicologo', 'recepcionista', 'cajero', 'administrador') NOT NULL,
    colegiatura VARCHAR(50),
    especialidad VARCHAR(100),
    usuario VARCHAR(50) UNIQUE NOT NULL,
    clave VARCHAR(255) NOT NULL,
    intentos_fallidos INT DEFAULT 0,
    bloqueado_hasta DATETIME,
    FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
) ENGINE=InnoDB;

-- tabla cliente

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    tipo ENUM('natural', 'juridica') NOT NULL,
	razon_social VARCHAR(200),
    ruc CHAR(11) UNIQUE,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    representante_legal VARCHAR(100),
    FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
) ENGINE=InnoDB;

-- tabla paciente
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    estado ENUM('en tratamiento', 'alta', 'suspendido') DEFAULT 'en tratamiento',
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
) ENGINE=InnoDB;

-- tabla historial_clinico

CREATE TABLE historial_clinico (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    antecedentes_medicos TEXT,
    plan_terapeutico TEXT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
) ENGINE=InnoDB;

-- table cita 

CREATE TABLE cita (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_empleado_psicologo INT,
    fecha_hora DATETIME NOT NULL,
    motivo_consulta TEXT,
    estado ENUM('programada', 'completada', 'cancelada', 'no asistio') DEFAULT 'programada',
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_empleado_psicologo) REFERENCES empleado(id_empleado)
) ENGINE=InnoDB;

-- tabla recordatorio
CREATE TABLE recordatorio(
	id_recordatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT,
    mensaje TEXT,
    fecha DATETIME,
    medio ENUM('email', 'sms', 'whatsApp'),
    estado ENUM('pendiente','enviado'),
    FOREIGN KEY (id_cita) REFERENCES cita (id_cita)
);

-- tabla mensaje
CREATE TABLE mensaje(
	id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    id_emisor INT,
    id_receptor INT,
    contenido VARCHAR(256),
    fecha_envio DATETIME,
    leido BOOLEAN,
    FOREIGN KEY (id_emisor) REFERENCES empleado (id_empleado),
	FOREIGN KEY (id_receptor) REFERENCES empleado (id_empleado)
);
-- table diagnostico
CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT,
    id_historial INT,
    codigo_diagnostico VARCHAR(20) UNIQUE NOT NULL,
    descripcion TEXT,
    fecha DATE NOT NULL,
    severidad ENUM('leve', 'moderado', 'grave') NOT NULL,
    estado ENUM('activo', 'resuelto', 'pendiente') DEFAULT 'activo',
    FOREIGN KEY (id_cita) REFERENCES cita(id_cita),
    FOREIGN KEY (id_historial) REFERENCES historial_clinico(id_historial)
) ENGINE=InnoDB;

-- tabla consulta
CREATE TABLE consulta(
	id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_diagnostico INT,
    duracion_minuto INT NOT NULL,
    FOREIGN KEY (id_diagnostico) REFERENCES diagnostico (id_diagnostico)
);

-- tabla tratamiento

CREATE TABLE tratamiento (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_diagnostico INT,
    descripcion TEXT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado ENUM('activo', 'completado', 'suspendido') DEFAULT 'activo',
    FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico)
) ENGINE=InnoDB;

-- tabla plan
CREATE TABLE plan (
    id_plan INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    numero_sesiones INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    descuento DECIMAL(5,2) DEFAULT 0.00,
    duracion_meses INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- tabla plan_paciente
CREATE TABLE plan_paciente (
    id_plan_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_plan INT,
    id_paciente INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    vigente BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_plan) REFERENCES plan(id_plan),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
) ENGINE=InnoDB;

-- tabla metodo pago
CREATE TABLE metodo_pago(
	id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('efectivo', 'tarjeta', 'transferencia', 'billetera digital') NOT NULL
);

-- tabla pago
CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT,
    id_plan_paciente INT,
    id_metodo_pago int,
    monto DECIMAL(10,2) NOT NULL,
    monto_cubierto_seguro DECIMAL(10,2) DEFAULT 0.00,
    monto_pagado_paciente DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'completado', 'cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (id_cita) REFERENCES cita(id_cita),
    FOREIGN KEY (id_plan_paciente) REFERENCES plan_paciente(id_plan_paciente),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
) ENGINE=InnoDB;    

-- tabla comprobante de pago
CREATE TABLE comprobante_pago (
    id_comprobante_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT,
    numero_comprobante_pago VARCHAR(20) UNIQUE NOT NULL,
    numero_serie VARCHAR(20) NOT NULL,
    fecha_emision DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipo ENUM('boleta', 'factura'),
    estado ENUM('emitida', 'anulada') DEFAULT 'emitida',
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
) ENGINE=InnoDB;

-- tabla caja
CREATE TABLE caja (
    id_caja INT AUTO_INCREMENT PRIMARY KEY,
    saldo_inicial DECIMAL(10,2) NOT NULL,
    saldo_final DECIMAL(10,2) NOT NULL,
    fecha_apertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_cierre DATETIME
) ENGINE=InnoDB;

-- tabla transaccion
CREATE TABLE transaccion (
	id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
	id_caja INT,
	id_pago INT,
	tipo ENUM('ingreso', 'egreso') NOT NULL,
	monto DECIMAL(10,2) NOT NULL,
	fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_caja) REFERENCES caja(id_caja),
	FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
    ) ENGINE=InnoDB;    


-- table seguro
CREATE TABLE seguro (
    id_seguro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    cobertura DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

-- tabla paciente_seguro
CREATE TABLE paciente_seguro (
    id_paciente_seguro INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_seguro INT,
    numero_poliza VARCHAR(50) UNIQUE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_seguro) REFERENCES seguro(id_seguro)
) ENGINE=InnoDB;

-- tabla recurso
CREATE TABLE recurso(
	id_recurso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    tipo ENUM('prueba', 'material', 'libro', 'otro'),
    cantidad_total INT,
    cantidad_disponible INT
);

-- tabla uso de recurso
CREATE TABLE uso_recurso(
	id_uso_recurso INT AUTO_INCREMENT PRIMARY KEY,
    id_recurso INT,
    id_cita INT,
    cantidad_usada INT,
    observaciones VARCHAR (50),
    FOREIGN KEY (id_recurso) REFERENCES recurso (id_recurso),
    FOREIGN KEY (id_cita) REFERENCES cita (id_cita)
);



