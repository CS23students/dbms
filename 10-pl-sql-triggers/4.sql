-- 4	Write a database trigger to check for the availability of department number in the department table, before inserting or updating a record in the employee table

CREATE OR REPLACE TRIGGER trg_check_deptno
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM department WHERE depno = :NEW.depno;
  IF v_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Invalid Department Number.');
  END IF;
END;
/
