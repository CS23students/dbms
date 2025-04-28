-- 2	Write a database trigger before delete for each row on table department, delete corresponding department employees from employee table

CREATE OR REPLACE TRIGGER trg_delete_dept
BEFORE DELETE ON department
FOR EACH ROW
BEGIN
  DELETE FROM employee WHERE depno = :OLD.depno;
END;
/
