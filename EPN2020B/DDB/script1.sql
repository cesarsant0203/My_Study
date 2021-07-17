DECLARE
f_name varchar(20);
BEGIN
	SELECT first_name
	into f_name
	from employees
	where employee_id=100;
select f_name;
END;
/