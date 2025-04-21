-- 7	Write a PL/SQL block using cursor to display the contents of  various tables based on the options(Using UnConstrained variables)   

DECLARE
  v_table_name VARCHAR2(20) := 'employee';
BEGIN
  IF v_table_name = 'employee' THEN
    FOR rec IN (SELECT * FROM employee) LOOP
      DBMS_OUTPUT.PUT_LINE('Emp: ' || rec.empname);
    END LOOP;
  ELSIF v_table_name = 'department' THEN
    FOR rec IN (SELECT * FROM department) LOOP
      DBMS_OUTPUT.PUT_LINE('Dept: ' || rec.depname);
    END LOOP;
  END IF;
END;
