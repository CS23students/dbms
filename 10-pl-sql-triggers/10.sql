-- 10	Create a trigger on table employ for not allowing insert/update/delete operations on Friday.

CREATE OR REPLACE TRIGGER trg_no_dml_on_friday
BEFORE INSERT OR UPDATE OR DELETE ON employee
FOR EACH ROW
BEGIN
  IF TO_CHAR(SYSDATE, 'DAY') = 'FRIDAY' THEN
    RAISE_APPLICATION_ERROR(-20004, 'No DML operations allowed on Friday.');
  END IF;
END;
/
