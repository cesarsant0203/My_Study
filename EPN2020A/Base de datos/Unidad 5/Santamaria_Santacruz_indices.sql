USE [master]
GO
/****** Object:  Database [Proyectos2]    Script Date: 30/08/2020 14:25:24 ******/
CREATE DATABASE [Proyectos2] ON  PRIMARY 
( NAME = N'Proyectos', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Proyectos.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Proyectos_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Proyectos_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

drop database proyectos2

USE Proyectos2
GO


CREATE TABLE [dbo].[departamento](
	[CodDepar] [int] IDENTITY(1,1) NOT NULL,
	[NomDepar] [varchar](30) NULL,
	[presupuesto] [money] NULL,
PRIMARY KEY CLUSTERED (	[CodDepar] ASC)
) ON [PRIMARY]

GO
drop procedure CrearDepartamentos
go

CREATE PROCEDURE [dbo].[CrearDepartamentos]
	@n int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @x INT = 0
	DECLARE @name varchar(30)
	DECLARE @pres int

	WHILE (@x <  @n)
	BEGIN
		
		SET @name = 'NAME' + CAST(@x as varchar)
		set @pres = RAND()*(5000-1)+1;
		INSERT INTO departamento ( NomDepar, presupuesto) 
		VALUES (@name, @pres)
		
		SET @x = @x + 1
	END

END
go

exec CrearDepartamentos 100
select * from departamento
go


CREATE TABLE [dbo].[profesor](
	[CodProf] [int] IDENTITY(1,1) NOT NULL,
	[NomProf] [nvarchar](30) NULL,
	[ApeProf] [nvarchar](30) NULL,
	[correo] [varchar](50) NULL,
	[CodDepar] [int] NULL,
PRIMARY KEY CLUSTERED (	[CodProf] ASC)
) ON [PRIMARY]
GO

CREATE PROCEDURE [dbo].[CrearProfesores]
	@n int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @x INT = 0
	DECLARE @name varchar(30)
	DECLARE @lname varchar(30)
	DECLARE @correo varchar(50)
	DECLARE @depar int

	WHILE (@x <  @n)
	BEGIN
		
		SET @name = 'NAME' + CAST(@x as varchar)
		SET @lname = 'LNAME' + CAST(@x as varchar)
		set @correo = @name + @lname + '@gmail.com'
		set @depar = FLOOR(RAND()*(90-1+1))+1
		INSERT INTO profesor (NomProf, ApeProf, correo, CodDepar) 
		VALUES (@name, @lname,@correo,@depar)
		
		SET @x = @x + 1
	END

END
go

exec CrearProfesores 100
select * from profesor

select NomProf, correo from profesor where CodProf = 2 or CodProf = 3 or CodProf = 45 or CodProf = 6
go
CREATE TABLE [dbo].[profproyecto](
	[CodProy] [char](7) NOT NULL,
	[CodProf] [int] NOT NULL,
	[fechainicio] [date] NULL,
	[fechafin] [date] NULL,
PRIMARY KEY CLUSTERED (	[CodProy] ASC,	[CodProf] ASC) 
) ON [PRIMARY]



CREATE TABLE [dbo].[proyecto](
	[CodProy] [char](7) NOT NULL,
	[titulo] [nvarchar](80) NULL,
	[resumen] [nvarchar](30) NULL,
	[CodDepar] [int] NULL,
PRIMARY KEY CLUSTERED (	[CodProy] ASC)  
) ON [PRIMARY]
go

CREATE PROCEDURE [dbo].[CrearProyectos]
	@n int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @x INT = 0
	DECLARE @codigo varchar(30)
	DECLARE @depar int

	WHILE (@x <  @n)
	BEGIN
		
		SET @codigo = 'COD' + CAST((FLOOR(RAND()*(999-101+1))+101) as varchar) + 'A' 
		set @depar = FLOOR(RAND()*(90-1+1))+1

		INSERT INTO proyecto (CodProy,CodDepar) 
		VALUES (@codigo, @depar)
		
		SET @x = @x + 1
	END

END
go

exec CrearProyectos 40
select * from proyecto

UPDATE proyecto
set CodDepar = 6
where CodProy = 'COD266A'
insert into departamento values ('NAME100', 1406)
select * from departamento join proyecto on departamento.CodDepar = proyecto.CodDepar where departamento.CodDepar in (select CodDepar from departamento where CodProy = 'COD186A');
ALTER TABLE [dbo].[profesor]  WITH CHECK ADD  CONSTRAINT [FK_profesor_departamento] FOREIGN KEY([CodDepar])
REFERENCES [dbo].[departamento] ([CodDepar])
GO
ALTER TABLE [dbo].[profesor] CHECK CONSTRAINT [FK_profesor_departamento]
GO
ALTER TABLE [dbo].[profproyecto]  WITH CHECK ADD FOREIGN KEY([CodProy])
REFERENCES [dbo].[proyecto] ([CodProy])
GO
ALTER TABLE [dbo].[profproyecto]  WITH CHECK ADD FOREIGN KEY([CodProf])
REFERENCES [dbo].[profesor] ([CodProf])
GO
ALTER TABLE [dbo].[proyecto]  WITH CHECK ADD  CONSTRAINT [FK_proyecto_departamento] FOREIGN KEY([CodDepar])
REFERENCES [dbo].[departamento] ([CodDepar])
GO
ALTER TABLE [dbo].[proyecto] CHECK CONSTRAINT [FK_proyecto_departamento]
GO
ALTER TABLE [dbo].[proyecto]  WITH CHECK ADD  CONSTRAINT [CHKCodProy] CHECK  (([CodProy] like 'P[IJM]I[2][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[proyecto] CHECK CONSTRAINT [CHKCodProy]
GO

USE [master]
GO
ALTER DATABASE [Proyectos2] SET  READ_WRITE 
GO

CREATE FUNCTION REPORT (@correo varchar(50))
	RETURNS @REP TABLE (	STOR_NAME varchar(40), STOR_ADDRESS varchar(40), CITY varchar(20))
AS
BEGIN
	INSERT @REP
	SELECT S.CodDepar, NomProf ,ApeProf
	FROM profesor S
	WHERE S.correo = @correo
	RETURN
END
GO
------------------------------------------------------------------------------------------
/*
drop trigger FN_4_PRUEBA
*/

/*Prueba trigger FN_4_PRUEBA*/
/*Pruebe la función: 
a)	Pruebe con el nombre de editorial Algodata Infosystems*/
SELECT * FROM publishers
SELECT * FROM STORES
SELECT * FROM REPORT('NAME3LNAME3@gmail.com'), departamento
ORDER BY STOR_NAME
GO