-- 1	Write a database trigger before insert or update for each row on the table employee not allowing to enter salary > 10,000  

CREATE OR REPLACE TRIGGER trg_salary_limit
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
BEGIN
  IF :NEW.salary > 10000 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be greater than 10,000.');
  END IF;
END;
/
