/*Este ejemplo crea una vista. Puesto que CREATE VIEW debe ser la única instrucción 
en un lote (por la regla 1), se necesitan instrucciones GO para aislar la instrucción 
CREATE VIEW de las instrucciones USE y SELECT que hay alrededor.*/

USE pubs
GO /* Fin del  batchch */
CREATE VIEW autor_titulo_vista
AS
SELECT *
FROM authors
GO /* Fin del batch */
SELECT * 
FROM autor_titulo_vista
GO /* Fin del batch */




DECLARE @NombreTran VARCHAR(20) /* Declara una variable llamada TranName */
SELECT @NombreTran = 'MiTransa'  /* Asigna la cadena “MiTransa” a la variable */
BEGIN TRANSACTION @NombreTran
GO
USE pubs
GO
UPDATE roysched
SET royalty = royalty * 1.10
WHERE title_id LIKE 'PC%'
GO
COMMIT TRANSACTION MiTransa
GO


USE prueba;
GO

CREATE TABLE tabvalores (valor int)
GO

DECLARE @transa1 varchar(20) = 'Transaccion1';

-- Se inicia una transacción a la que se le ha dado nombre 
-- inserta dos registros y hace roll back usando 
-- el nombre de la transacción

BEGIN TRAN @transa1 
       INSERT INTO tabvalores VALUES(1)
       INSERT INTO tabvalores VALUES(2)
ROLLBACK TRAN @transa1

INSERT INTO tabvalores VALUES(3)
INSERT INTO tabvalores VALUES(4)

SELECT * FROM tabvalores

DROP TABLE tabvalores

