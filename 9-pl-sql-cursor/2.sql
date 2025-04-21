-- 2	Write a PL/SQL block using cursor to display empname, designation and department location (Use for loop)

BEGIN
  FOR rec IN (
    SELECT e.empname, e.designation, d.deplocation
    FROM employee e
    JOIN department d ON e.depno = d.depno
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Name: ' || rec.empname || ', Designation: ' || rec.designation || ', Location: ' || rec.deplocation);
  END LOOP;
END;
