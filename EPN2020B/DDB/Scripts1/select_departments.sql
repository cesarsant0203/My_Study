CREATE OR REPLACE PROCEDURE select_departments
(selected_val in number)
is

 s_dname varchar2(30);
 s_loc  varchar2(30);
BEGIN
  Select department_id, location_id
    into s_dname,s_loc
    from departments
   where department_id = selected_val;

  Exception
     when no_data_found then
     raise_application_error( -20123,'Department does not exist!' );
END;
/
