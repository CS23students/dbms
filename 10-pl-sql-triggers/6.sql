-- Write a database trigger to check for the job equal to manager and the corresponding salary between 4000 and 6000 after inserting into the table without allowing the record to be inserted.  

CREATE OR REPLACE TRIGGER trg_manager_salary_restrict
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
  IF :NEW.designation = 'manager' THEN
    IF :NEW.salary NOT BETWEEN 4000 AND 6000 THEN
      RAISE_APPLICATION_ERROR(-20003, 'Manager salary must be between 4000 and 6000.');
    END IF;
  END IF;
END;
/
