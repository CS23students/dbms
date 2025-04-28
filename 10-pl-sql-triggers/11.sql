-- 11	Write a trigger to ensure that empno in employee table is maintained as primary key.

CREATE OR REPLACE TRIGGER trg_empno_primary_key
BEFORE INSERT ON employee
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM employee WHERE empno = :NEW.empno;
  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20005, 'Duplicate EMPNO not allowed.');
  END IF;
END;
/
