-- 6	Write a PL/SQL block using cursor to display the contents of  various tables based on the options(Using Constrained variables)

DECLARE
  v_option CHAR(1) := 'E'; -- Example: E for employee
BEGIN
  IF v_option = 'E' THEN
    FOR rec IN (SELECT * FROM employee) LOOP
      DBMS_OUTPUT.PUT_LINE('Emp: ' || rec.empname);
    END LOOP;
  ELSIF v_option = 'D' THEN
    FOR rec IN (SELECT * FROM department) LOOP
      DBMS_OUTPUT.PUT_LINE('Dept: ' || rec.depname);
    END LOOP;
  END IF;
END;
