SET SERVEROUTPUT ON
DECLARE
  Myname VARCHAR2(20);
BEGIN  DBMS_OUTPUT.PUT_LINE('My name is: '||Myname);
  Myname := 'John';
  DBMS_OUTPUT.PUT_LINE('My name is: '||Myname);
END;
/