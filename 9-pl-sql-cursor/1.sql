-- 1	Write a PL/SQL block using cursor to display empname, designation and department name

DECLARE
  CURSOR emp_cursor IS
    SELECT e.empname, e.designation, d.depname
    FROM employee e
    JOIN department d ON e.depno = d.depno;
BEGIN
  FOR rec IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Name: ' || rec.empname || ', Designation: ' || rec.designation || ', Department: ' || rec.depname);
  END LOOP;
END;
