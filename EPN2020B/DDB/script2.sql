DECLARE
f_name varchar2(20);
BEGIN
       select first_name
       into f_name
      from employees
       where employee_id=100;
     DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' || f_name);
END;
/