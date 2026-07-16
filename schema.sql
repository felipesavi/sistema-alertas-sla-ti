## 1. Crear la base de datos

CREATE DATABASE operaciones_ti;
GO
USE operaciones_ti;


## 2. Crear la tabla de tickets

CREATE TABLE tickets_soporte (
    id_ticket INT IDENTITY(1000,1) PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    descripcion_falla VARCHAR(255) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Abierto',
    fecha_creacion DATETIME NOT NULL,
    sla_horas INT DEFAULT 4 -- El límite de tiempo en horas para resolverlo
);


## 3. Insertar datos de prueba (Simulando tickets pasados y recientes)
Usamos DATEADD y GETDATE() para que las fechas siempre sean relativas al momento en que ejecutes el script.

INSERT INTO tickets_soporte (cliente, descripcion_falla, estado, fecha_creacion, sla_horas)
VALUES
('Empresa Alpha', 'Caída de base de datos principal', 'Abierto', DATEADD(hour, -5, GETDATE()), 4), -- VENCIDO (Lleva 5 horas)
('Banco Beta', 'Error 500 en login', 'Abierto', DATEADD(hour, -2, GETDATE()), 4), -- EN TIEMPO (Lleva 2 horas)
('Seguros Gamma', 'API no responde', 'Cerrado', DATEADD(hour, -10, GETDATE()), 4), -- CERRADO (No nos importa)
('Financiera Delta', 'Lentitud extrema en transacciones', 'Abierto', DATEADD(hour, -6, GETDATE()), 4); -- VENCIDO (Lleva 6 horas)
