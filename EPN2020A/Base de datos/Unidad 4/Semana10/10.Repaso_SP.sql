use pubs
go

drop procedure ventas_por_titulo

CREATE PROCEDURE ventas_por_titulo  @titulo varchar(80) AS
SELECT  'VENTA_ANUAL' = ytd_sales
FROM titles
WHERE title = @titulo
RETURN
GO

Exec ventas_por_titulo 'The Gourmet Microwave'



drop procedure pa_prueba

CREATE PROCEDURE pa_prueba
@uno int = NULL ,     -- valor default 
@dos int = 2 ,        -- valor default
@tres int = 3         -- valor default
AS

SELECT @uno, @dos,  @tres
GO

EXECUTE pa_prueba  -- Sin parámetros
GO
/*
Muestra:
NULL	2	3
*/
EXECUTE pa_prueba 10, 20, 30 -- Todos los parámetros
GO
/*
Muestra:
NULL	10	20 30
*/
EXECUTE pa_prueba @dos = 500  -- Solo segundo parámetro
GO
/*
Muestra:
NULL 500 3
*/
EXECUTE pa_prueba 40, @tres = 50  
GO
/*
Muestra:
40 2 50
*/



USE AdventureWorks2012;
GO
IF OBJECT_ID ( 'HumanResources.usp_GetEmployees2', 'P' ) IS NOT NULL 
    DROP PROCEDURE HumanResources.usp_GetEmployees2;
GO
CREATE PROCEDURE HumanResources.usp_GetEmployees2 
    @lastname varchar(40) = 'D%', 
    @firstname varchar(20) = '%'
AS 
    SELECT LastName, FirstName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment
    WHERE FirstName LIKE @firstname 
        AND LastName LIKE @lastname;
GO

EXECUTE HumanResources.usp_GetEmployees2;
-- 
EXECUTE HumanResources.usp_GetEmployees2 'Wi%';
-- 
EXECUTE HumanResources.usp_GetEmployees2 @firstname = '%';
-- 
EXECUTE HumanResources.usp_GetEmployees2 '[CK]ars[OE]n';
-- 
EXECUTE HumanResources.usp_GetEmployees2 'Hesse', 'Stefen';
-- 
EXECUTE HumanResources.usp_GetEmployees2 'H%', 'S%';
