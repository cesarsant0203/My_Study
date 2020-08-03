use master
go

alter authorization on database:: AdventureWorks2012 to sa;

use AdventureWorks2012
go



-- CREAR UN ESQUEMA.  El propósito de un esquema en una BD es el de agrupar los objetos que tienen una relación cercana (en una BD empresarial). 
-- Por ejemplo: ventas, inventario, recursos-humanos, producción. Se utiliza para asociar también a usuarios que tienen acceso a determinados
-- objetos en la BD y de esa forma configurar perfiles de seguridad en los usuarios. 

use PEDIDOS
GO

create schema Orden;
alter schema Orden transfer dbo.ordenes;
alter schema Orden transfer dbo.detalle_ordenes;

alter schema dbo transfer Orden.ordenes;
alter schema dbo transfer Orden.detalle_ordenes;

-- Se puede crear el esquema y a continuación crear la tabla dentro de ese esquema. En el ejemplo la tabla Ventas.Stands se
-- crea directamente con el esqhema Ventas. 

CREATE SCHEMA Ventas;
go
CREATE TABLE Ventas.Stands (StandID int, dimensionLargo dec(10,2), dimensionAncho dec(10,2));









