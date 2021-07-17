use test1;
select * from t_person;
-- --------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE `sp_showNames` ()
BEGIN
	select * from t_person;
END$$

DELIMITER ;

-- --------------------------------------------------------
call sp_showNames;

-- -------------------------------------------------------
DELIMITER $$
USE `test1`$$
CREATE PROCEDURE `sp_insertName` (in apaternal varchar(50),
								in amaternal varchar(50),
                                in nameP varchar(50))
BEGIN
	INSERT into t_person (paternal,maternal,name)
    values(apaternal,amaternal,nameP);
END$$

DELIMITER ;
-- --------------------------------------------------

call sp_insertName('Lopez','Ernandez','Benito');
call sp_showNames();
