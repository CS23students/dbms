-- 5	Write a database trigger to check for the job equal to manager and the corresponding salary between 4000 and 6000 after inserting into the table with allowing the record to be inserted.

CREATE OR REPLACE TRIGGER trg_manager_salary_check_message
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
  IF :NEW.designation = 'manager' THEN
    IF :NEW.salary < 4000 OR :NEW.salary > 6000 THEN
      DBMS_OUTPUT.PUT_LINE('Warning: Manager salary should be between 4000 and 6000.');
    END IF;
  END IF;
END;
/
