use master
go


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create database bdusuarios
go

use bdusuarios
go

create table Usuarios 
(UsuarioId int not null, Username varchar(20), Password varbinary (50), FechaCreacion datetime, Activo bit)
/* =============================================
 Store Procedure para crear registros en la  tabla Usuarios para pruebas
 Utiliza 'SHA1' como algoritmo hash para realizar  el hash de la entrada
 Se probará para insertar 10.000 registros utilizando  el procedimiento 
almacenado CrearUsuarios,  los usuarios no están activos y su fecha de creación 
 está en los últimos 600 días.
=============================================  */

drop procedure [dbo].[CrearUsuarios]
go

CREATE PROCEDURE [dbo].[CrearUsuarios]
	@n int,
	@nInactivos int,
	@nDias int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @x INT = 0
	DECLARE @name varchar(20)
	DECLARE @pass varchar(30)
	DECLARE @fecha datetime
	DECLARE @activo bit

	DELETE FROM Usuarios

	WHILE (@x <  @n)
	BEGIN
		
		SET @name = 'USUARIO' + CAST(@x as varchar)
		SET @pass = 'PASS' + CAST(@x as varchar)
		SET @activo = (@x % (@n/@nInactivos))
		SET @fecha = DATEADD(DAY,(@n-@X)/@nDias,GETDATE())
		
		INSERT INTO Usuarios --(Username, Password, FechaCreacion,  Activo) 
		VALUES (@x,@name, HASHBYTES('SHA1', 'RN123' + @pass), @fecha, @activo)
		
		SET @x = @x + 1
	END

END

GO

exec sp_helptext CrearUsuarios

exec CrearUsuarios 1000, 100, 600

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'

create unique nonclustered index index_username on Usuarios (Username)

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'
--------------------------------------
CHECKPOINT

DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS
SET STATISTICS IO ON

SELECT Password, Activo FROM Usuarios
WHERE Username = 'Usuario123'

SET STATISTICS IO OFF

-- Borramos el índice nonclustered
drop index index_username on Usuarios

-- Creamos el índice clustered
create unique clustered index index_username on Usuarios (Username)
