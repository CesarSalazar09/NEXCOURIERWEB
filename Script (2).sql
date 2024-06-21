CREATE SEQUENCE departamento_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Departamento (
cod_departamento CHAR(8) DEFAULT ('DEP' || LPAD(NEXTVAL('departamento_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
nombre_departamento VARCHAR NOT NULL,
descripcion VARCHAR NOT NULL
);

--TABLA PUESTO
CREATE SEQUENCE puesto_seq

INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Puesto (
cod_puesto CHAR(8) DEFAULT ('PST' || LPAD(NEXTVAL('puesto_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
nombre_puesto VARCHAR NOT NULL,
descripcion VARCHAR NOT NULL
);

--TABLA SUELDO
DROP SEQUENCE IF EXISTS sueldo_seq;
CREATE SEQUENCE sueldo_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999

START WITH 1
CACHE 1;
CREATE TABLE Sueldo (
cod_sueldo CHAR(8) DEFAULT ('SLD' || LPAD(NEXTVAL('sueldo_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
fecha_pago DATE NOT NULL,
periodo_pago INT NOT NULL
);
--1->Mensual
--2->Quincenal

--TABLA EMPLEADO
CREATE TABLE Empleado (
dni CHAR(8) PRIMARY KEY,
primer_nombre VARCHAR NOT NULL,
segundo_nombre VARCHAR NOT NULL,
primer_apellido VARCHAR NOT NULL,
segundo_apellido VARCHAR NOT NULL,

correo_empresa VARCHAR NOT NULL,
telefono CHAR(9) NOT NULL,
ubigeo INT NOT NULL,
nombre_direccion VARCHAR NOT NULL,
tipo_zona_direccion INT NOT NULL,
sueldo_base NUMERIC(7,3) NOT NULL,
fecha_contrato DATE NOT NULL,
asignacion_familiar BOOLEAN NOT NULL,
planilla BOOLEAN NOT NULL,
cod_puesto CHAR(8) DEFAULT ('PST' || LPAD(NEXTVAL('puesto_seq')::TEXT, 5, '0')) NOT NULL,
cod_sueldo CHAR(8) DEFAULT ('SLD' || LPAD(NEXTVAL('sueldo_seq')::TEXT, 5, '0')) NOT NULL,
cod_departamento CHAR(8) DEFAULT ('DEP' || LPAD(NEXTVAL('departamento_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_puesto) REFERENCES Puesto(cod_puesto),
FOREIGN KEY (cod_departamento) REFERENCES Departamento(cod_departamento),
FOREIGN KEY (cod_sueldo) REFERENCES Sueldo(cod_sueldo)
);
--1->Calle

--2->Avenida
--3->Jirón

--TABLA PLATAFORMA
DROP SEQUENCE IF EXISTS plataforma_seq;
CREATE SEQUENCE plataforma_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE plataforma (
cod_plataforma CHAR(8) DEFAULT ('PLT' || LPAD(NEXTVAL('plataforma_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
Cant_usos_exitosos INT NOT NULL,
cant_usos_totales INT NOT NULL
);

--TABLA TIPO_USUARIO
DROP SEQUENCE IF EXISTS tipo_usuario_seq;
CREATE SEQUENCE tipo_usuario_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE tipo_usuario (
cod_tipo_usuario CHAR(8) DEFAULT ('TPU' || LPAD(NEXTVAL('tipo_usuario_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
descripcion VARCHAR NOT NULL,
rol VARCHAR NOT NULL,
fecha_asignacion DATE NOT NULL
);
--1->Administrativo
--2->Administrador de Asistencia

--TABLA USUARIO
CREATE SEQUENCE usuario_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Usuario (
cod_usuario CHAR(8) DEFAULT ('USR' || LPAD(NEXTVAL('usuario_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
contraseña VARCHAR NOT NULL,
dni CHAR(8) NOT NULL,
cod_tipo_usuario CHAR(8) DEFAULT ('TPU' || LPAD(NEXTVAL('tipo_usuario_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (dni) REFERENCES Empleado(dni),
FOREIGN KEY (cod_tipo_usuario) REFERENCES tipo_usuario(cod_tipo_usuario)
);

--TABLA LOGIN

CREATE SEQUENCE login_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Login (
cod_login CHAR(8) DEFAULT ('LOG' || LPAD(NEXTVAL('login_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
Fecha_hora_inicio TIMESTAMP NOT NULL,
Fecha_hora_fin TIMESTAMP NOT NULL,
cod_plataforma CHAR(8) DEFAULT ('PLT' || LPAD(NEXTVAL('plataforma_seq')::TEXT, 5, '0')) NOT NULL,
cod_usuario CHAR(8) DEFAULT ('USR' || LPAD(NEXTVAL('usuario_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_plataforma) REFERENCES plataforma(cod_plataforma),
FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);

--TABLA COMUNICADO

CREATE SEQUENCE comunicado_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Comunicado (
cod_comunicado CHAR(8) DEFAULT ('COM' || LPAD(NEXTVAL('comunicado_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
descripcion VARCHAR NOT NULL,
url_documento VARCHAR NOT NULL,
fecha DATE NOT NULL,
cod_usuario CHAR(8) DEFAULT ('USR' || LPAD(NEXTVAL('usuario_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);

--TABLA CLIENTE EMPRESA
CREATE SEQUENCE Cliente_empresa_seq

INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Cliente_empresa (
cod_cliente CHAR(8) DEFAULT ('CLI' || LPAD(NEXTVAL('Cliente_empresa_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
nombre_cliente VARCHAR NOT NULL,
descripcion VARCHAR NOT NULL,
url_imagen VARCHAR NOT NULL,
cod_usuario CHAR(8) DEFAULT ('USR' || LPAD(NEXTVAL('usuario_seq')::TEXT, 5, '0')) ,
FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);

--TABLA ASISTENCIA
CREATE SEQUENCE asistencia_seq
INCREMENT BY 1

MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Asistencia (
cod_asistencia CHAR(8) DEFAULT ('AST' || LPAD(NEXTVAL('asistencia_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
fecha_hora_entrada TIMESTAMP NOT NULL,
fecha_hora_salida TIMESTAMP NOT NULL,
fecha_hora_inicio_refrigerio TIMESTAMP NOT NULL,
fecha_hora_termino_refrigerio TIMESTAMP NOT NULL,
cod_usuario CHAR(8) DEFAULT ('USR' || LPAD(NEXTVAL('usuario_seq')::TEXT, 5, '0')) ,
FOREIGN KEY (cod_usuario) REFERENCES Usuario(cod_usuario)
);

--TABLA REPORTE ASISTENCIA
CREATE SEQUENCE reporte_asistencia_seq
INCREMENT BY 1

MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Reporte_asistencia (
cod_reporte CHAR(8) DEFAULT ('RAS' || LPAD(NEXTVAL('reporte_asistencia_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
fecha_reporte DATE NOT NULL,
hora_reporte TIME NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_final DATE NOT NULL,
cod_asistencia CHAR(8) DEFAULT ('AST' || LPAD(NEXTVAL('asistencia_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_asistencia) REFERENCES Asistencia(cod_asistencia)
);

--TABLA REPORTE DE PAGOS
CREATE SEQUENCE reporte_pagos_seq
INCREMENT BY 1

MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;

CREATE TABLE Reporte_pagos (
cod_reporte CHAR(8) DEFAULT ('RPA' || LPAD(NEXTVAL('reporte_pagos_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
fecha_reporte DATE NOT NULL,
hora_reporte TIME NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_final DATE NOT NULL,
cod_sueldo CHAR(8) DEFAULT ('SLD' || LPAD(NEXTVAL('sueldo_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_sueldo) REFERENCES Sueldo(cod_sueldo)
);
--TABLA TIPO BENEFICIO
CREATE SEQUENCE tipo_beneficio_seq
INCREMENT BY 1

MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;

CREATE TABLE tipo_beneficio (
cod_tipo_beneficio CHAR(8) DEFAULT ('TIB' || LPAD(NEXTVAL('tipo_beneficio_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
descripcion VARCHAR NOT NULL,
categoria VARCHAR NOT NULL,
porcentaje FLOAT NOT NULL
);
--1-> Planilla
--2->Beneficio para bienestar

--TABLA BENEFICIO
CREATE SEQUENCE beneficio_seq
INCREMENT BY 1

MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Beneficio (
cod_beneficio CHAR(8) DEFAULT ('BEN' || LPAD(NEXTVAL('beneficio_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
estado_beneficio VARCHAR NOT NULL,
cod_sueldo CHAR(8) DEFAULT ('SLD' || LPAD(NEXTVAL('sueldo_seq')::TEXT, 5, '0')) NOT NULL,
cod_tipo_beneficio CHAR(8) DEFAULT ('TIB' || LPAD(NEXTVAL('tipo_beneficio_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_sueldo) REFERENCES Sueldo(cod_sueldo),
FOREIGN KEY (cod_tipo_beneficio) REFERENCES tipo_beneficio(cod_tipo_beneficio)
);

--TABLA TIPO DEDUCCION
CREATE SEQUENCE tipo_deduccion_seq

INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE tipo_deduccion (
cod_tipo_deduccion CHAR(8) DEFAULT ('TID' || LPAD(NEXTVAL('tipo_deduccion_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
descripcion VARCHAR NOT NULL,
categoria VARCHAR NOT NULL,
porcentaje FLOAT NOT NULL
);
--1->Aporte a AFP
--2->Aporte a EsSalud
--3->Deducciones voluntarias
--4->Descuentos por adelantos

--TABLA DEDUCCION
CREATE SEQUENCE deduccion_seq
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
START WITH 1
CACHE 1;
CREATE TABLE Deduccion (
cod_deduccion CHAR(8) DEFAULT ('DED' || LPAD(NEXTVAL('deduccion_seq')::TEXT, 5, '0')) NOT NULL PRIMARY KEY,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
estado_deduccion VARCHAR NOT NULL,
cod_sueldo CHAR(8) DEFAULT ('SLD' || LPAD(NEXTVAL('sueldo_seq')::TEXT, 5, '0')) NOT NULL,
cod_tipo_deduccion CHAR(8) DEFAULT ('TID' || LPAD(NEXTVAL('tipo_deduccion_seq')::TEXT, 5, '0')) NOT NULL,
FOREIGN KEY (cod_sueldo) REFERENCES Sueldo(cod_sueldo),
FOREIGN KEY (cod_tipo_deduccion) REFERENCES tipo_deduccion(cod_tipo_deduccion))



-- Insert into Departamento and retrieve generated keys
INSERT INTO Departamento (nombre_departamento, descripcion) VALUES
('Recursos Humanos', 'Gestiona el personal de la empresa') RETURNING cod_departamento;
INSERT INTO Departamento (nombre_departamento, descripcion) VALUES
('Finanzas', 'Gestiona las finanzas de la empresa') RETURNING cod_departamento;
INSERT INTO Departamento (nombre_departamento, descripcion) VALUES
('IT', 'Gestiona la tecnología y sistemas de la empresa') RETURNING cod_departamento;

-- Insert into Puesto and retrieve generated keys
INSERT INTO Puesto (nombre_puesto, descripcion) VALUES
('Gerente', 'Responsable de la gestión de un departamento') RETURNING cod_puesto;
INSERT INTO Puesto (nombre_puesto, descripcion) VALUES
('Analista', 'Analiza datos y produce informes') RETURNING cod_puesto;
INSERT INTO Puesto (nombre_puesto, descripcion) VALUES
('Desarrollador', 'Desarrolla y mantiene sistemas') RETURNING cod_puesto;

select * from Puesto
-- Insert into Sueldo and retrieve generated keys
INSERT INTO Sueldo (fecha_pago, periodo_pago) VALUES
('2023-06-01', 1) RETURNING cod_sueldo;
INSERT INTO Sueldo (fecha_pago, periodo_pago) VALUES
('2023-06-15', 2) RETURNING cod_sueldo;
INSERT INTO Sueldo (fecha_pago, periodo_pago) VALUES
('2023-07-01', 1) RETURNING cod_sueldo;

-- Suppose the returned values are stored in variables as follows:
-- cod_departamento values: 'DEP00001', 'DEP00002', 'DEP00003'
-- cod_puesto values: 'PST00001', 'PST00002', 'PST00003'
-- cod_sueldo values: 'SLD00001', 'SLD00002', 'SLD00003'

-- Insert into Empleado using the retrieved keys
INSERT INTO Empleado (dni, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo_empresa, telefono, ubigeo, nombre_direccion, tipo_zona_direccion, sueldo_base, fecha_contrato, asignacion_familiar, planilla, cod_puesto, cod_sueldo, cod_departamento) VALUES
('12345678', 'Juan', 'Carlos', 'Perez', 'Garcia', 'juan.perez@empresa.com', '123456789', 1001, 'Av. Siempre Viva', 1, 3000.000, '2023-01-01', TRUE, TRUE, 'PST00009', 'SLD00021', 'DEP00007'),
('87654321', 'Maria', 'Luisa', 'Gonzalez', 'Lopez', 'maria.gonzalez@empresa.com', '987654321', 1002, 'Calle Falsa', 2, 2500.000, '2023-02-01', FALSE, TRUE, 'PST00010', 'SLD00022', 'DEP00008'),
('11223344', 'Carlos', 'Andres', 'Ramirez', 'Torres', 'carlos.ramirez@empresa.com', '123123123', 1003, 'Jiron Central', 3, 4000.000, '2023-03-01', TRUE, TRUE, 'PST00011', 'SLD00023', 'DEP00009');

select * from sueldo s 
select * from departamento d 
-- Insert into tipo_usuario
INSERT INTO tipo_usuario (descripcion, rol, fecha_asignacion) VALUES
('Administrador', 'Administrativo', '2023-01-01') RETURNING cod_tipo_usuario;
INSERT INTO tipo_usuario (descripcion, rol, fecha_asignacion) VALUES
('Usuario', 'Empleado', '2023-02-01') RETURNING cod_tipo_usuario;

-- Suppose the returned values are stored in variables as follows:
-- cod_tipo_usuario values: 'TPU00001', 'TPU00002'

-- Insert into Usuario using the retrieved keys
INSERT INTO Usuario (contraseña, dni, cod_tipo_usuario) VALUES
('pass123', '12345678', 'TPU00001'),
('pass456', '87654321', 'TPU00002');

-- Insert into plataforma
INSERT INTO plataforma (Cant_usos_exitosos, cant_usos_totales) VALUES
(100, 120) RETURNING cod_plataforma;
INSERT INTO plataforma (Cant_usos_exitosos, cant_usos_totales) VALUES
(80, 100) RETURNING cod_plataforma;

-- Suppose the returned values are stored in variables as follows:
-- cod_plataforma values: 'PLT00001', 'PLT00002'

-- Insert into Login using the retrieved keys
INSERT INTO Login (Fecha_hora_inicio, Fecha_hora_fin, cod_plataforma, cod_usuario) VALUES
('2023-06-01 08:00:00', '2023-06-01 17:00:00', 'PLT00001', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 0)),
('2023-06-02 08:00:00', '2023-06-02 17:00:00', 'PLT00002', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 1));

-- Insert into Comunicado using the retrieved keys
INSERT INTO Comunicado (descripcion, url_documento, fecha, cod_usuario) VALUES
('Reunion de equipo', 'http://empresa.com/docs/reunion.pdf', '2023-06-01', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 0)),
('Actualización de políticas', 'http://empresa.com/docs/politicas.pdf', '2023-06-15', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 1));

-- Insert into Cliente_empresa using the retrieved keys
INSERT INTO Cliente_empresa (nombre_cliente, descripcion, url_imagen, cod_usuario) VALUES
('Cliente A', 'Empresa A', 'http://empresa.com/images/clienteA.png', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 0)),
('Cliente B', 'Empresa B', 'http://empresa.com/images/clienteB.png', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 1));

-- Insert into Asistencia using the retrieved keys
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida, fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario) VALUES
('2023-06-01 08:00:00', '2023-06-01 17:00:00', '2023-06-01 12:00:00', '2023-06-01 13:00:00', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 0)),
('2023-06-02 08:00:00', '2023-06-02 17:00:00', '2023-06-02 12:00:00', '2023-06-02 13:00:00', (SELECT cod_usuario FROM Usuario LIMIT 1 OFFSET 1));

-- Insert into Reporte_asistencia using the retrieved keys
INSERT INTO Reporte_asistencia (fecha_reporte, hora_reporte, fecha_inicio, fecha_final, cod_asistencia) VALUES
('2023-06-01', '17:30:00', '2023-06-01', '2023-06-01', (SELECT cod_asistencia FROM Asistencia LIMIT 1 OFFSET 0)),
('2023-06-02', '17:30:00', '2023-06-02', '2023-06-02', (SELECT cod_asistencia FROM Asistencia LIMIT 1 OFFSET 1));

-- Insert into Reporte_pagos using the retrieved keys
INSERT INTO Reporte_pagos (fecha_reporte, hora_reporte, fecha_inicio, fecha_final, cod_sueldo) VALUES
('2023-06-01', '18:00:00', '2023-05-01', '2023-05-31', (SELECT cod_sueldo FROM Sueldo LIMIT 1 OFFSET 0)),
('2023-06-15', '18:00:00', '2023-06-01', '2023-06-15', (SELECT cod_sueldo FROM Sueldo LIMIT 1 OFFSET 1));

-- Insert into tipo_beneficio
INSERT INTO tipo_beneficio (descripcion, categoria, porcentaje) VALUES
('Seguro de salud', 'Bienestar', 5.0) RETURNING cod_tipo_beneficio;
INSERT INTO tipo_beneficio (descripcion, categoria, porcentaje) VALUES
('Bonificación', 'Planilla', 10.0) RETURNING cod_tipo_beneficio;

-- Suppose the returned values are stored in variables as follows:
-- cod_tipo_beneficio values: 'TIB00001', 'TIB00002'

-- Insert into Beneficio using the retrieved keys
INSERT INTO Beneficio (fecha_inicio, fecha_fin, estado_beneficio, cod_sueldo, cod_tipo_beneficio) VALUES
('2023-01-01', '2023-12-31', 'Activo', (SELECT cod_sueldo FROM Sueldo LIMIT 1 OFFSET 0), 'TIB00001'),
('2023-01-01', '2023-12-31', 'Activo', (SELECT cod_sueldo FROM Sueldo LIMIT 1 OFFSET 1), 'TIB00002');

-- Insert into tipo_deduccion
INSERT INTO tipo_deduccion (descripcion, categoria, porcentaje) VALUES
('Aporte AFP', 'Aporte', 12.5) RETURNING cod_tipo_deduccion;
INSERT INTO tipo_deduccion (descripcion, categoria, porcentaje) VALUES
('Aporte EsSalud', 'Aporte', 9.0) RETURNING cod_tipo_deduccion;

-- Suppose the returned values are stored in variables as follows:
-- cod_tipo_deduccion values: 'TID00001', 'TID00002'

-- Insert into Deduccion using the retrieved keys
INSERT INTO Deduccion (fecha_inicio, fecha_fin, estado_deduccion, cod_sueldo, cod_tipo_deduccion) VALUES
('2023-01-01', '2023-12-31', 'Activo', (SELECT cod_sueldo FROM Sueldo LIMIT 1 OFFSET 0), 'TID00001'),
('2023-01-01', '2023-12-31', 'Activo', (SELECT cod_sueldo FROM Sueldo LIMIT 1 OFFSET 1), 'TID00002');





select * from empleado
select * from reporte_pagos rp 












INSERT INTO Departamento (nombre_departamento, descripcion)
VALUES ('Operaciones', 'Encargado de la gestión de las operaciones de la empresa, asegurando
la eficiencia y efectividad de los procesos.'),
('Servicio al Cliente', 'Responsable de brindar un servicio excepcional a los clientes,
atendiendo sus necesidades y resolviendo sus inquietudes.'),
('Ventas y Marketing', 'Encargado de desarrollar estrategias de ventas y promoción de
productos o servicios, buscando alcanzar los objetivos de ventas.'),
('Logística', 'Responsable de la planificación y ejecución de la cadena de suministro,
garantizando la entrega oportuna y eficiente de los productos.'),
('Control de Calidad', 'Encargado de asegurar que los productos o servicios cumplan con los
estándares de calidad establecidos, realizando controles y evaluaciones.'),
('Recursos Humanos', 'Responsable de gestionar el talento humano de la empresa,
incluyendo la contratación, desarrollo, compensación y bienestar del personal.');
INSERT INTO Puesto (nombre_puesto, descripcion)
VALUES
('Gerente de Ventas', 'Responsable de liderar y gestionar el equipo de ventas.'),
('Analista Financiero', 'Encargado de realizar análisis financiero y reportes para la toma de
decisiones.'),
('Especialista en Marketing Digital', 'Encargado de desarrollar estrategias de marketing en
entornos digitales.'),
('Ingeniero de Software', 'Responsable del desarrollo y mantenimiento de software.'),
('Técnico de Soporte', 'Encargado de brindar asistencia y soporte técnico a los usuarios.'),
('Asistente Administrativo', 'Apoyo en tareas administrativas y organización interna.'),
('Diseñador Gráfico', 'Encargado de crear diseños visuales para diversos proyectos.'),
('Operario de Producción', 'Realiza tareas de producción en la línea de ensamblaje o
fabricación.') ;

INSERT INTO Sueldo (fecha_pago, periodo_pago)
VALUES
('2022-03-01', 1),
('2022-03-07', 2),
('2022-03-14', 2),
('2022-03-21', 2),
('2022-03-28', 2),

('2022-04-01', 1),
('2022-04-08', 2),
('2022-04-15', 2),
('2022-04-22', 2),
('2022-04-29', 2);

DELETE FROM EMPLEADO
INSERT INTO Empleado (dni, primer_nombre, segundo_nombre, primer_apellido,
segundo_apellido, correo_empresa, telefono, ubigeo, nombre_direccion, tipo_zona_direccion,
sueldo_base, fecha_contrato, asignacion_familiar, planilla, cod_puesto, cod_sueldo,
cod_departamento)
VALUES
('12345678', 'Juan', 'Pablo', 'González', 'López', 'juan.gonzalez@empresa.com', '987654321',
12345, 'Calle Principal 123', 1, 2500.50, '2020-01-01', true, true, 'PST00003', 'SLD00002',
'DEP00004'),
('87654321', 'María', 'Fernanda', 'Hernández', 'Sánchez', 'maria.hernandez@empresa.com',
'987654321', 54321, 'Avenida Central 456', 2, 2800.75, '2019-12-15', false, true, 'PST00003',
'SLD00001', 'DEP00001'),
('98765432', 'Luis', 'Miguel', 'Ramírez', 'Torres', 'luis.ramirez@empresa.com', '987654321',
98765, 'Jirón Secundario 789', 1, 2000.00, '2021-03-10', false, true, 'PST00002', 'SLD00003',
'DEP00002'),
('23456789', 'Ana', 'María', 'López', 'García', 'ana.lopez@empresa.com', '987654321', 65432,
'Avenida Principal 987', 2, 2300.25, '2020-07-20', true, true, 'PST00003', 'SLD00003',
'DEP00001'),
('54321098', 'Carlos', 'Alberto', 'Pérez', 'Fernández', 'carlos.perez@empresa.com', '987654321',
32198, 'Calle Secundaria 654', 1, 2700.00, '2018-05-05', false, true, 'PST00004', 'SLD00004',
'DEP00003'),
('67890123', 'Laura', 'Isabel', 'Gómez', 'Torres', 'laura.gomez@empresa.com', '987654321',
91827, 'Jirón Principal 321', 2, 2200.50, '2019-09-12', true, true, 'PST00005', 'SLD00005',
'DEP00005'),
('98765430', 'Pedro', 'Antonio', 'Herrera', 'López', 'pedro.herrera@empresa.com', '987654321',
76543, 'Avenida Secundaria 654', 1, 2900.75, '2022-02-28', false, true, 'PST00006', 'SLD00006',
'DEP00006'),
('10987654', 'Sofía', 'Gabriela', 'Silva', 'Pérez', 'sofia.silva@empresa.com', '987654321', 23456,
'Jirón Central 987', 2, 2400.00, '2021-06-15', true, true, 'PST00007', 'SLD00007', 'DEP00002'),

('34567890', 'Javier', 'Andrés', 'García', 'Ramírez', 'javier.garcia@empresa.com', '987654321',
87654, 'Calle Central 654', 1, 2600.25, '2020-10-10', false, true, 'PST00008', 'SLD00003',
'DEP00003'),
('43210987', 'Isabella', 'Valentina', 'Sánchez', 'Hernández', 'isabella.sanchez@empresa.com',
'987654321', 34567, 'Avenida Secundaria 321', 2, 2100.50, '2017-11-22', true, true, 'PST00002',
'SLD00009', 'DEP00001'),
('11111111', 'Fernando', 'Alberto', 'Gómez', 'Pérez', 'fernando.gomez@empresa.com',
'987654322', 12345, 'Calle Principal 123', 1, 2500.50, '2020-01-01', true, true, 'PST00005',
'SLD00010', 'DEP00006'),
('22222222', 'Luisa', 'María', 'Hernández', 'Sánchez', 'luisa.hernandez@empresa.com',
'987654323', 54321, 'Avenida Central 456', 2, 2800.75, '2019-12-15', false, true, 'PST00006',
'SLD00002', 'DEP00001'),
('33333333', 'Andrés', 'Felipe', 'Ramírez', 'Torres', 'andres.ramirez@empresa.com', '987654324',
98765, 'Jirón Secundario 789', 1, 2000.00, '2021-03-10', false, true, 'PST00002', 'SLD00003',
'DEP00005'),
('44444444', 'Carolina', 'Isabel', 'López', 'García', 'carolina.lopez@empresa.com', '987654325',
65432, 'Avenida Principal 987', 2, 2300.25, '2020-07-20', true, true, 'PST00006', 'SLD00006',
'DEP00002'),
('55555555', 'Roberto', 'José', 'Pérez', 'Fernández', 'roberto.perez@empresa.com', '987654326',
32198, 'Calle Secundaria 654', 1, 2700.00, '2018-05-05', false, true, 'PST00006', 'SLD00006',
'DEP00006'),
('66666666', 'Valeria', 'Paola', 'Gómez', 'Torres', 'valeria.gomez@empresa.com', '987654327',
91827, 'Jirón Principal 321', 2, 2200.50, '2019-09-12', true, true, 'PST00006', 'SLD00006',
'DEP00005'),
('77777777', 'Felipe', 'Javier', 'Herrera', 'López', 'felipe.herrera@empresa.com', '987654328',
76543, 'Avenida Secundaria 654', 1, 2900.75, '2022-02-28', false, true, 'PST00003', 'SLD00010',
'DEP00006'),
('88888888', 'Sara', 'Gabriela', 'Silva', 'Pérez', 'sara.silva@empresa.com', '987654329', 23456,
'Jirón Central 987', 2, 2400.25, '2021-11-10', true, true, 'PST00006', 'SLD00005', 'DEP00003');

INSERT INTO plataforma (Cant_usos_exitosos, cant_usos_totales)
VALUES
(10, 20),
(15, 30),
(8, 12),
(20, 40),
(5, 10),

(12, 24),
(18, 36),
(7, 14),
(25, 50),
(9, 18);

INSERT INTO tipo_usuario (descripcion, rol, fecha_asignacion)
VALUES
('Trabajador que se dedica al funcionamiento de la empresa', 'Administrativo', '2019-03-15'),
('Encargado de manejar la asistencia', 'Administrador de asistencia', '2018-04-05');

INSERT INTO Usuario (contraseña, dni, cod_tipo_usuario)
VALUES
('82fV6RgH', '12345678', 'TPU00001'),
('5jW2e7zD', '87654321', 'TPU00001'),
('9tG3rU6y', '98765432', 'TPU00001'),
('4sD9gZ1q', '23456789', 'TPU00001'),
('8aE7sR2w', '54321098', 'TPU00001'),
('3hV5rU8t', '67890123', 'TPU00001'),
('6yG4tH2v', '98765430', 'TPU00001'),
('2wE3qR5t', '10987654', 'TPU00001'),
('7uJ4yH6g', '34567890', 'TPU00001'),
('1qW2eR4t', '43210987', 'TPU00001'),
('1rT2yW5e', '11111111', 'TPU00001'),
('4tG7uH8y', '22222222', 'TPU00001'),
('7gH8jK2l', '33333333', 'TPU00001'),
('5rE3wQ2a', '44444444', 'TPU00002'),
('9iK7uJ4h', '55555555', 'TPU00002'),
('3zX5vC2b', '66666666', 'TPU00002'),
('8sE3dF4r', '77777777', 'TPU00001'),
('6yU7jH8n', '88888888', 'TPU00001');

INSERT INTO Login (Fecha_hora_inicio, Fecha_hora_fin, cod_plataforma, cod_usuario)
VALUES
('2023-06-01 09:30:00', '2023-06-01 17:45:00', 'PLT00001', 'USR00001'),
('2023-06-02 08:15:00', '2023-06-02 16:30:00', 'PLT00002', 'USR00002'),

('2023-06-03 10:00:00', '2023-06-03 18:30:00', 'PLT00003', 'USR00005'),
('2023-06-04 11:45:00', '2023-06-04 19:15:00', 'PLT00004', 'USR00004'),
('2023-06-05 07:30:00', '2023-06-05 15:45:00', 'PLT00005', 'USR00005'),
('2023-06-06 09:00:00', '2023-06-06 17:00:00', 'PLT00006', 'USR00006'),
('2023-06-07 08:30:00', '2023-06-07 16:45:00', 'PLT00007', 'USR00004'),
('2023-06-08 07:45:00', '2023-06-08 16:00:00', 'PLT00008', 'USR00008'),
('2023-06-09 10:15:00', '2023-06-09 18:45:00', 'PLT00009', 'USR00003'),
('2023-06-10 09:30:00', '2023-06-10 17:30:00', 'PLT00010', 'USR00010');

INSERT INTO Comunicado (descripcion, url_documento, fecha, cod_usuario)
VALUES
('Reunión de equipo', 'https://nexcourier.com/comunicado1.pdf', '2023-06-15', 'USR00001'),
('Actualización de políticas', 'https://nexcourier.com/comunicado2.pdf', '2023-06-16',
'USR00002'),
('Recordatorio de pago', 'https://nexcourier.com/comunicado3.pdf', '2023-06-17', 'USR00003'),
('Anuncio de evento', 'https://nexcourier.com/comunicado4.pdf', '2023-06-18', 'USR00004'),
('Cambio de horarios', 'https://nexcourier.com/comunicado5.pdf', '2023-06-19', 'USR00005');

INSERT INTO Cliente_empresa (nombre_cliente, descripcion, url_imagen, cod_usuario)
VALUES
('Plaza vea', 'Descripción de Plaza vea', 'https://ejemplo.com/imagenA.png', 'USR00001'),
('PyG', 'Descripción de PyG', 'https://ejemplo.com/imagenB.png', 'USR00002'),
('Sodimac', 'Descripción de Sodimac', 'https://ejemplo.com/imagenC.png', 'USR00003'),
('Metro', 'Descripción de la Metro', 'https://ejemplo.com/imagenD.png', 'USR00004'),
('Tottus', 'Descripción de Tottus', 'https://ejemplo.com/imagenE.png', 'USR00005');
select * from usuario
-- Insertar valores de ejemplo en la tabla Asistencia
-- Enero
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-01-01 09:00:00', '2023-01-01 17:00:00', '2023-01-01 12:00:00', '2023-01-01
13:00:00','USR00001');

-- Febrero
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)

VALUES ('2023-02-01 08:30:00', '2023-02-01 16:45:00', '2023-02-01 12:15:00', '2023-02-01
12:45:00','USR00001');

-- Marzo
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-03-01 09:15:00', '2023-03-01 18:30:00', '2023-03-01 13:00:00', '2023-03-01
14:00:00','USR00001');

-- Abril
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-04-01 08:45:00', '2023-04-01 17:30:00', '2023-04-01 12:30:00', '2023-04-01
13:30:00','USR00001');

-- Mayo
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-05-01 09:30:00', '2023-05-01 18:15:00', '2023-05-01 13:15:00', '2023-05-01
13:45:00','USR00001');

-- Junio
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-06-01 09:00:00', '2023-06-01 17:00:00', '2023-06-01 12:00:00', '2023-06-01
12:30:00','USR00001');

-- Julio
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-07-01 08:30:00', '2023-07-01 16:45:00', '2023-07-01 12:15:00', '2023-07-01
13:00:00','USR00001');

-- Agosto
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)

VALUES ('2023-08-01 09:15:00', '2023-08-01 18:30:00', '2023-08-01 13:00:00', '2023-08-01
14:30:00','USR00001');

-- Septiembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-09-01 08:45:00', '2023-09-01 17:30:00', '2023-09-01 12:30:00', '2023-09-01
13:15:00','USR00001');

-- Octubre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-10-01 09:30:00', '2023-10-01 18:15:00', '2023-10-01 13:15:00', '2023-10-01
14:00:00','USR00001');
-- Noviembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-11-01 09:00:00', '2023-11-01 17:00:00', '2023-11-01 12:00:00', '2023-11-01
12:45:00','USR00001');

-- Diciembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-12-01 08:30:00', '2023-12-01 16:45:00', '2023-12-01 12:15:00', '2023-12-01
13:30:00','USR00001');

-- Enero
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-01-01 09:00:00', '2023-01-01 17:00:00', '2023-01-01 12:00:00', '2023-01-01
13:00:00','USR00002');

-- Febrero
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)

VALUES ('2023-02-01 08:30:00', '2023-02-01 16:45:00', '2023-02-01 12:15:00', '2023-02-01
12:45:00','USR00002');

-- Marzo
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-03-01 09:15:00', '2023-03-01 18:30:00', '2023-03-01 13:00:00', '2023-03-01
14:00:00','USR00002');

-- Abril
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-04-01 08:45:00', '2023-04-01 17:30:00', '2023-04-01 12:30:00', '2023-04-01
13:30:00','USR00002');

-- Mayo
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-05-01 09:30:00', '2023-05-01 18:15:00', '2023-05-01 13:15:00', '2023-05-01
13:45:00','USR00002');

-- Junio
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-06-01 09:00:00', '2023-06-01 17:00:00', '2023-06-01 12:00:00', '2023-06-01
12:30:00','USR00002');

-- Julio
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-07-01 08:30:00', '2023-07-01 16:45:00', '2023-07-01 12:15:00', '2023-07-01
13:00:00','USR00002');

-- Agosto
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)

VALUES ('2023-08-01 09:15:00', '2023-08-01 18:30:00', '2023-08-01 13:00:00', '2023-08-01
14:30:00','USR00002');

-- Septiembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-09-01 08:45:00', '2023-09-01 17:30:00', '2023-09-01 12:30:00', '2023-09-01
13:15:00','USR00002');

-- Octubre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-10-01 09:30:00', '2023-10-01 18:15:00', '2023-10-01 13:15:00', '2023-10-01
14:00:00','USR00002');
-- Noviembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-11-01 09:00:00', '2023-11-01 17:00:00', '2023-11-01 12:00:00', '2023-11-01
12:45:00','USR00002');

-- Diciembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-12-01 08:30:00', '2023-12-01 16:45:00', '2023-12-01 12:15:00', '2023-12-01
13:30:00','USR00002');

-- Enero
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-01-01 08:00:00', '2023-01-01 17:00:00', '2023-01-01 12:00:00', '2023-01-01
13:00:00','USR00003');

-- Febrero
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)

VALUES ('2023-02-01 08:00:00', '2023-02-01 16:00:00', '2023-02-01 12:15:00', '2023-02-01
12:45:00','USR00003');

-- Marzo
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-03-01 09:00:00', '2023-03-01 18:30:00', '2023-03-01 13:00:00', '2023-03-01
14:00:00','USR00003');

-- Abril
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-04-01 08:30:00', '2023-04-01 17:30:00', '2023-04-01 12:30:00', '2023-04-01
13:30:00','USR00003');

-- Mayo
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-05-01 09:30:00', '2023-05-01 18:15:00', '2023-05-01 13:15:00', '2023-05-01
13:45:00','USR00003');

-- Junio
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-06-01 09:00:00', '2023-06-01 17:00:00', '2023-06-01 12:00:00', '2023-06-01
12:30:00','USR00003');

-- Julio
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-07-01 08:30:00', '2023-07-01 16:45:00', '2023-07-01 12:15:00', '2023-07-01
13:00:00','USR00003');

-- Agosto
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)

VALUES ('2023-08-01 09:15:00', '2023-08-01 18:30:00', '2023-08-01 13:00:00', '2023-08-01
14:30:00','USR00003');

-- Septiembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-09-01 08:45:00', '2023-09-01 17:30:00', '2023-09-01 12:30:00', '2023-09-01
13:15:00','USR00003');

-- Octubre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-10-01 09:30:00', '2023-10-01 18:15:00', '2023-10-01 13:15:00', '2023-10-01
14:00:00','USR00003');
-- Noviembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-11-01 09:10:00', '2023-11-01 17:00:00', '2023-11-01 12:00:00', '2023-11-01
12:45:00','USR00003');

-- Diciembre
INSERT INTO Asistencia (fecha_hora_entrada, fecha_hora_salida,
fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio, cod_usuario)
VALUES ('2023-12-01 08:40:00', '2023-12-01 16:45:00', '2023-12-01 12:15:00', '2023-12-01
13:30:00','USR00003');

INSERT INTO Reporte_asistencia (fecha_reporte, hora_reporte, fecha_inicio, fecha_final,
cod_asistencia)
VALUES
('2023-03-16', '09:00:00', '2023-06-20', '2023-06-25', 'AST00001'),
('2023-06-25', '08:30:00', '2023-03-21', '2023-03-25', 'AST00002'),
('2023-05-23', '08:45:00', '2023-04-12', '2023-04-20', 'AST00003'),
('2023-01-22', '09:15:00', '2023-05-23', '2023-06-01', 'AST00004'),
('2023-05-24', '09:30:00', '2023-04-24', '2023-04-26', 'AST00005'),
('2023-09-09', '08:00:00', '2023-06-20', '2023-06-26', 'AST00006'),

('2023-10-25', '09:30:00', '2023-06-21', '2023-06-25', 'AST00001'),
('2023-04-10', '08:45:00', '2023-03-10', '2023-03-20', 'AST00008'),
('2023-02-11', '09:00:00', '2023-01-23', '2023-01-25', 'AST00002'),
('2023-04-25', '08:30:00', '2023-10-24', '2023-10-25', 'AST00004');

INSERT INTO Reporte_pagos (fecha_reporte, hora_reporte, fecha_inicio, fecha_final,
cod_sueldo)
VALUES
('2023-06-25', '09:00:00', '2023-06-01', '2023-06-30', 'SLD00001'),
('2023-06-26', '08:30:00', '2023-06-01', '2023-06-30', 'SLD00002'),
('2023-06-27', '08:45:00', '2023-06-01', '2023-06-30', 'SLD00003'),
('2023-06-28', '09:15:00', '2023-06-01', '2023-06-30', 'SLD00001'),
('2023-06-29', '09:30:00', '2023-06-01', '2023-06-30', 'SLD00005'),
('2023-06-30', '08:00:00', '2023-06-01', '2023-06-30', 'SLD00006'),
('2023-07-01', '09:30:00', '2023-07-01', '2023-07-31', 'SLD00003'),
('2023-07-02', '08:45:00', '2023-07-01', '2023-07-31', 'SLD00008'),
('2023-07-03', '09:00:00', '2023-07-01', '2023-07-31', 'SLD00009'),
('2023-07-04', '08:30:00', '2023-07-01', '2023-07-31', 'SLD00002');
INSERT INTO tipo_beneficio (descripcion, categoria, porcentaje)
VALUES
('Descripcion de planilla', 'Planilla', 10.5),
('Descripcion de bienestar', 'Asignacion familiar', 5.5);

INSERT INTO Beneficio (fecha_inicio, fecha_fin, estado_beneficio,
cod_sueldo,cod_tipo_beneficio)
VALUES
('2022-06-25', '2023-10-30', 'Activo', 'SLD00001','TIB00001'),
('2022-07-01', '2023-07-31', 'Activo', 'SLD00002','TIB00002'),
('2022-08-01', '2023-08-31', 'Activo', 'SLD00003','TIB00001'),
('2023-09-01', '2023-09-30', 'Inactivo', 'SLD00004','TIB00001'),
('2023-10-01', '2023-10-31', 'Inactivo', 'SLD00005','TIB00001'),
('2022-11-01', '2023-11-30', 'Activo', 'SLD00006','TIB00002'),
('2022-12-01', '2023-12-31', 'Activo', 'SLD00007','TIB00002'),
('2022-01-01', '2024-01-31', 'Activo', 'SLD00008','TIB00001'),
('2023-02-01', '2023-02-24', 'Inactivo', 'SLD00009','TIB00002'),
('2023-03-01', '2023-03-31', 'Inactivo', 'SLD00010','TIB00001');

INSERT INTO tipo_deduccion (descripcion, categoria, porcentaje)
VALUES
('Aporte a AFP', 'Seguridad Social', 0.1),
('Aporte a EsSalud', 'Seguridad Social', 0.05),
('Deducciones voluntarias', 'Deducciones', 0.08),
('Descuentos por adelantos', 'Descuentos', 0.03);

INSERT INTO Deduccion (fecha_inicio, fecha_fin, estado_deduccion, cod_sueldo,
cod_tipo_deduccion)
VALUES
('2022-01-01', '2023-01-31', 'Activa', 'SLD00001', 'TID00001'),
('2022-02-01', '2023-02-28', 'Activa', 'SLD00002', 'TID00001'),
('2022-03-01', '2023-03-31', 'Activa', 'SLD00003', 'TID00002'),
('2022-04-01', '2023-04-30', 'Activa', 'SLD00004', 'TID00002'),
('2022-05-01', '2023-05-31', 'Activa', 'SLD00005', 'TID00003'),
('2022-06-01', '2023-06-30', 'Activa', 'SLD00006', 'TID00003'),
('2022-07-01', '2023-07-31', 'Activa', 'SLD00007', 'TID00004'),
('2022-08-01', '2023-08-31', 'Activa', 'SLD00008', 'TID00004'),
('2022-09-01', '2023-09-30', 'Activa', 'SLD00009', 'TID00001'),
('2022-10-01', '2023-10-31', 'Activa', 'SLD00010', 'TID00002');