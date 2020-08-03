USE [master]
GO


CREATE DATABASE APORTES_IESS;

USE [APORTES_IESS]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AFILIADO](
	[idAfiliado] [int] NOT NULL,
	[cedula] [nchar](10) NOT NULL,
	[nombres] [nchar](50) NOT NULL,
	[apellidos] [nchar](50) NOT NULL,
 CONSTRAINT [PK_AFILIADO] PRIMARY KEY CLUSTERED ([idAfiliado] ASC ) 
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APORTE_PERSONAL](
	[idAportePersonal] [int] NOT NULL,
	[idPatronoApPersonal] [int] NOT NULL,
	[idAfiliadoApPersonal] [int] NOT NULL,
	[rmu] [float] NOT NULL,
	[porcentajeApPersonal] [float] NOT NULL,
	[valorApPersonal] [float] NOT NULL,
	[fechaApPersonal] [date] NOT NULL,
	[numeroDiasApPersonal] [int] NULL,
 CONSTRAINT [PK_APORTE_PERSONAL] PRIMARY KEY CLUSTERED ([idAportePersonal] ASC) 
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PATRONO](
	[idPatrono] [int] NOT NULL,
	[tipoPatrono] [char](4) NOT NULL,
	[ruc] [varchar](13) NULL,
	[razonSocial] [varchar](60) NULL,
 CONSTRAINT [PK_PATRONO] PRIMARY KEY CLUSTERED ([idPatrono] ASC)
 ) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[APORTE_PERSONAL]  WITH CHECK ADD  CONSTRAINT [FK_APORTE_PERSONAL_AFILIADO] FOREIGN KEY([idAfiliadoApPersonal])
REFERENCES [dbo].[AFILIADO] ([idAfiliado])
GO
ALTER TABLE [dbo].[APORTE_PERSONAL] CHECK CONSTRAINT [FK_APORTE_PERSONAL_AFILIADO]
GO
ALTER TABLE [dbo].[APORTE_PERSONAL]  WITH CHECK ADD  CONSTRAINT [FK_APORTE_PERSONAL_PATRONO] FOREIGN KEY([idPatronoApPersonal])
REFERENCES [dbo].[PATRONO] ([idPatrono])
GO
ALTER TABLE [dbo].[APORTE_PERSONAL] CHECK CONSTRAINT [FK_APORTE_PERSONAL_PATRONO]
GO



INSERT INTO PATRONO VALUES(100, 'priv', '1300579541001', 'GoSpaces');
INSERT INTO PATRONO VALUES(101, 'priv', '0100345641001', 'Lean');
INSERT INTO PATRONO VALUES(102, 'priv', '0387785541001', 'Wordoid');
INSERT INTO PATRONO VALUES(103, 'publ', '1157950041001', 'GAD Imbabura');
INSERT INTO PATRONO VALUES(104, 'publ', '1388579541001', 'Ministerio de Salud Pública');
INSERT INTO PATRONO VALUES(105, 'priv', '1322579541001', 'TERRA');
INSERT INTO PATRONO VALUES(106, 'publ', '1310579541001', 'Escuela de Artes Estatal');
go
INSERT INTO AFILIADO VALUES (1,'0100475243', 'JULIO', 'VILLAZHIÑAY' )
INSERT INTO AFILIADO VALUES (2,'0200412385', 'RICARDO', 'LUCIO' )
INSERT INTO AFILIADO VALUES (3,'0200415818', 'GILBERTO', 'MONTENEGRO' )
INSERT INTO AFILIADO VALUES (4,'0502965437', 'MARCO', 'MASABANDA' )
INSERT INTO AFILIADO VALUES (5,'0502977416', 'HOLGUER', 'GRANJA' )
INSERT INTO AFILIADO VALUES (6,'0502979149', 'GONZALO', 'TOAPANTA' )
INSERT INTO AFILIADO VALUES (7,'0502980717', 'LUIS', 'GOMEZ' )
INSERT INTO AFILIADO VALUES (8,'0503020547', 'OSCAR', 'DIAZ' )
INSERT INTO AFILIADO VALUES (9,'0200419422', 'EULER', 'ACOSTA' )
INSERT INTO AFILIADO VALUES (10,'0600085278', 'JORGE', 'ISA' )
INSERT INTO AFILIADO VALUES (11,'0600573026', 'FAUSTO', 'VINUEZA' )
GO			 
INSERT INTO APORTE_PERSONAL VALUES (1, 100, 1, 1600.78, 9.45, 1600.78*0.0945, '20160101', NULL)
INSERT INTO APORTE_PERSONAL VALUES (2, 101, 3, 1600.78, 9.45, 1600.78*0.0945, '20160101', NULL)
INSERT INTO APORTE_PERSONAL VALUES (3, 106, 4, 1200.00, 9.45, 1200.00*0.0945, '20160101', NULL)
INSERT INTO APORTE_PERSONAL VALUES (4, 100, 1, 1600.78, 9.45, 1600.78*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (5, 100, 2, 1900.58, 9.45, 1900.58*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (6, 100, 5, 1900.28, 9.45, 1900.28*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (7, 100, 6, 1700.18, 9.45, 1700.18*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (8, 101, 3, 1600.78, 9.45, 1600.78*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (9, 101, 9, 1600.78, 9.45, 1600.78*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (10, 101, 10, 1600.78, 9.45, 1600.78*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (11, 102, 11, 1600.78, 9.45, 1600.78*0.0945, '20160201', NULL)
INSERT INTO APORTE_PERSONAL VALUES (12, 103, 8, 1600.78, 9.45, 1600.78*0.0945, '20160301', NULL)
INSERT INTO APORTE_PERSONAL VALUES (13, 100, 1, 1600.78, 9.45, 1600.78*0.0945, '20160301', NULL)
INSERT INTO APORTE_PERSONAL VALUES (14, 103, 8, 1600.78, 9.45, 1600.78*0.0945, '20160401', NULL)
INSERT INTO APORTE_PERSONAL VALUES (15, 102, 11, 1600.78, 9.45, 1600.78*0.0945, '20160401', NULL)
INSERT INTO APORTE_PERSONAL VALUES (16, 100, 1, 1600.78, 9.45, 1600.78*0.0945, '20160401', NULL)
INSERT INTO APORTE_PERSONAL VALUES (17, 102, 11, 1600.78, 9.45, 1600.78*0.0945, '20160501', NULL)
INSERT INTO APORTE_PERSONAL VALUES (18, 100, 1, 1600.78, 9.45, 1600.78*0.0945, '20160501', NULL)
INSERT INTO APORTE_PERSONAL VALUES (19, 105, 8, 1600.78, 9.45, 1600.78*0.0945, '20160501', NULL)
INSERT INTO APORTE_PERSONAL VALUES (20, 105, 7, 1600.78, 9.45, 1600.78*0.0945, '20160501', NULL)
GO		  	 

select *
from PATRONO
order by tipoPatrono

select *
from AFILIADO

SELECT * 
FROM APORTE_PERSONAL
GO

--- ESCRIBA LOS QUERIES DE LAS SIGUIENTES PREGUNTAS: (CADA PREGUNTA TIENE EL VALOR DE 2 PUNTOS) 

-- 1.	Muestre el id del patrono y su razón social de todas las empresas (patronos) de tipo 'priv' y el número de afiliados que han registrado, cada una de las empresas.

select idPatrono, razonSocial, count(*) as 'Número de afiliados'
from PATRONO P join APORTE_PERSONAL A
on P.idPatrono = A.idPatronoApPersonal
join AFILIADO F 
on A.idAfiliadoApPersonal = F.idAfiliado
where P.tipoPatrono = 'priv'   
GROUP BY P.idPatrono, razonSocial;

SELECT * 
FROM APORTE_PERSONAL
order by fechaApPersonal

-- 2.	Muestre el APELLIDO Y NOMBRE de todos los afiliados que tienen el valor de la Remuneración Mensual Unificada (rmu) mayor a 1650. 

select apellidos, nombres, rmu 
from AFILIADO A join APORTE_PERSONAL AP 
on A.idAfiliado = AP.idAfiliadoApPersonal
where rmu > 1650; 


-- 3. Cuente el número de afiliados que hubieron en cada mes del año 2016.  

select datepart(mm,fechaApPersonal) as 'Mes', count(*) as 'Número de afiliados'
from APORTE_PERSONAL 
group by datepart(mm,fechaApPersonal);

 --4. Apellidos, nombres y cedula de los afiliados que registraron algún aporte personal mientras pertenecían al patrono ‘Lean’. 
 -- Muestre en una sola cadena el apellido un blanco y el nombre con la etiqueta 'Afiliado'. Cada afiliado debe aparecer una sola vez. 

 select distinct (rtrim(apellidos)+' '+ nombres) as 'Afiliado', cedula 
 from AFILIADO A join APORTE_PERSONAL AP
 on A.idAfiliado = AP.idAfiliadoApPersonal
 join PATRONO P 
 on AP.idPatronoApPersonal = P.idPatrono
 where razonSocial = 'Lean';

 --  Actualizar el valor de la Remuneración mensual unificada (rmu) de los afiliados que perciban menos del promedio de la rmu 
  -- que perciben los empleados de patronos públicos ('publ').
  -- Capture para el archivo Word, un select de los registros de APORTE_PERSONAL, antes y después de ejecutar el UPDATE.

  --5. -- Muestre todos los aportes que se han realizado de la empresa GoSpaces. Incluya id del afiliado, apellidos, nombres, rmu, porcentaje de aporte, valor del aporte y fecha del aporte.
-- Debe presentar la información ordenada alfabéticamente.

select 
