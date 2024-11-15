create database VeterinariaBDD4
go

USE [VeterinariaBDD4]
GO
/****** Object:  Table [dbo].[ATENCION]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATENCION](
	[cod_atencion] [int] IDENTITY(1,1) NOT NULL,
	[cod_disponibilidad] [int] NOT NULL,
	[cod_mascota] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_atencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[cod_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[dni] [int] NOT NULL,
	[password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_ATENCION]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_ATENCION](
	[cod_detalle] [int] IDENTITY(1,1) NOT NULL,
	[cod_tipoA] [int] NOT NULL,
	[cod_atencion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISPONIBILIDAD]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISPONIBILIDAD](
	[cod_disponibilidad] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[hora] [time](5) NOT NULL,
	[ocupada] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_disponibilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fecha] ASC,
	[hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MASCOTA]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MASCOTA](
	[cod_mascota] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[edad] [int] NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[cod_tipo] [int] NOT NULL,
	[eliminado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_ATENCION]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_ATENCION](
	[cod_tipoA] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_tipoA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_MASCOTA]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_MASCOTA](
	[cod_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/11/2024 00:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DISPONIBILIDAD] ADD  DEFAULT ((0)) FOR [ocupada]
GO
ALTER TABLE [dbo].[ATENCION]  WITH CHECK ADD FOREIGN KEY([cod_disponibilidad])
REFERENCES [dbo].[DISPONIBILIDAD] ([cod_disponibilidad])
GO
ALTER TABLE [dbo].[ATENCION]  WITH CHECK ADD FOREIGN KEY([cod_mascota])
REFERENCES [dbo].[MASCOTA] ([cod_mascota])
GO
ALTER TABLE [dbo].[DETALLE_ATENCION]  WITH CHECK ADD FOREIGN KEY([cod_tipoA])
REFERENCES [dbo].[TIPO_ATENCION] ([cod_tipoA])
GO
ALTER TABLE [dbo].[DETALLE_ATENCION]  WITH CHECK ADD FOREIGN KEY([cod_atencion])
REFERENCES [dbo].[ATENCION] ([cod_atencion])
GO
ALTER TABLE [dbo].[MASCOTA]  WITH CHECK ADD FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTE] ([cod_cliente])
GO
ALTER TABLE [dbo].[MASCOTA]  WITH CHECK ADD FOREIGN KEY([cod_tipo])
REFERENCES [dbo].[TIPO_MASCOTA] ([cod_tipo])
GO

-- Insertar en la tabla TIPO_ATENCION
INSERT INTO TIPO_ATENCION (descripcion) VALUES ('Consulta General');
INSERT INTO TIPO_ATENCION (descripcion) VALUES ('Vacunación');
INSERT INTO TIPO_ATENCION (descripcion) VALUES ('Desparasitación');
INSERT INTO TIPO_ATENCION (descripcion) VALUES ('Cirugía');

-- Insertar en la tabla TIPO_MASCOTA
INSERT INTO TIPO_MASCOTA (nombre) VALUES ('Perro');
INSERT INTO TIPO_MASCOTA (nombre) VALUES ('Gato');
INSERT INTO TIPO_MASCOTA (nombre) VALUES ('Ave');
INSERT INTO TIPO_MASCOTA (nombre) VALUES ('Conejo');
INSERT INTO TIPO_MASCOTA (nombre) VALUES ('Roedor');
INSERT INTO TIPO_MASCOTA (nombre) VALUES ('Reptil');

-- Insertar en la tabla DISPONIBILIDAD
-- Insertar en la tabla DISPONIBILIDAD con fechas y horas únicas
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-10', '09:00:00', 0);
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-12', '10:00:00', 0);
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-13', '11:00:00', 0);
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-14', '08:30:00', 0);
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-15', '10:15:00', 0);
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-16', '08:45:00', 0);
INSERT INTO DISPONIBILIDAD (fecha, hora, ocupada) VALUES ('2024-11-18', '08:00:00', 0);



-- Insertar en la tabla CLIENTE
INSERT INTO CLIENTE (nombre, apellido, telefono, username, dni, password) VALUES ('Juan', 'Pérez', '1234567890', 12345678, 12345678, 'jaja');
INSERT INTO CLIENTE (nombre, apellido, telefono, username, dni, password) VALUES ('María', 'Gómez', '0987654321', 87654321, 87654321, 'juju');
INSERT INTO CLIENTE (nombre, apellido, telefono, username, dni, password) VALUES ('Carlos', 'Díaz', '1122334455', 56789012, 56789012, 'baba');
INSERT INTO CLIENTE (nombre, apellido, telefono, username, dni, password) VALUES ('Ana', 'López', '5566778899', 34567890, 34567890, 'bla');

-- Insertar en la tabla MASCOTA
INSERT INTO MASCOTA (nombre, edad, cod_cliente, cod_tipo, eliminado) VALUES ('Max', 5, 1, 1, 0);
INSERT INTO MASCOTA (nombre, edad, cod_cliente, cod_tipo, eliminado) VALUES ('Luna', 3, 2, 2, 0);
INSERT INTO MASCOTA (nombre, edad, cod_cliente, cod_tipo, eliminado) VALUES ('Rocky', 4, 1, 1, 0);
INSERT INTO MASCOTA (nombre, edad, cod_cliente, cod_tipo, eliminado) VALUES ('Bella', 2, 3, 2, 0);

-- Insertar en la tabla ATENCION
INSERT INTO ATENCION (cod_disponibilidad,  cod_mascota) VALUES (1,  1);
INSERT INTO ATENCION (cod_disponibilidad,  cod_mascota) VALUES (2,  2);
INSERT INTO ATENCION (cod_disponibilidad,  cod_mascota) VALUES (3,  3);
INSERT INTO ATENCION (cod_disponibilidad,  cod_mascota) VALUES (4, 4);

-- Insertar en la tabla DETALLE_ATENCION
INSERT INTO DETALLE_ATENCION (cod_tipoA, cod_atencion) VALUES (1, 1);
INSERT INTO DETALLE_ATENCION (cod_tipoA, cod_atencion) VALUES (2, 2);
INSERT INTO DETALLE_ATENCION (cod_tipoA, cod_atencion) VALUES (3, 3);
INSERT INTO DETALLE_ATENCION (cod_tipoA, cod_atencion) VALUES (4, 4);
