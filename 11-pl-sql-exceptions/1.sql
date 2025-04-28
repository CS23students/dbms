-- 1.	Write a PL/SQL to handle ‘no data found’ predefined exception. 

DECLARE
  v_ename employee.empname%TYPE;
BEGIN
  SELECT empname INTO v_ename FROM employee WHERE empno = 9999;
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No employee found with empno 9999.');
END;
/
