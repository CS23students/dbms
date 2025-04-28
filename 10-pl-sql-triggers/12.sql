-- 12	Write a trigger to ensure that no DML operatios are allowed on employee table.

CREATE OR REPLACE TRIGGER trg_block_dml
BEFORE INSERT OR UPDATE OR DELETE ON employee
BEGIN
  RAISE_APPLICATION_ERROR(-20006, 'DML operations are not allowed on Employee table.');
END;
/
