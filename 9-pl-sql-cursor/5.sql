-- 5	Write a PL/SQL block using cursor to update the employee table. Increment salary of manager by 500 and salary of clerk by 200

DECLARE
  CURSOR emp_cursor IS SELECT empno, designation FROM employee;
BEGIN
  FOR rec IN emp_cursor LOOP
    IF rec.designation = 'manager' THEN
      UPDATE employee SET salary = salary + 500 WHERE empno = rec.empno;
    ELSIF rec.designation = 'clerk' THEN
      UPDATE employee SET salary = salary + 200 WHERE empno = rec.empno;
    END IF;
  END LOOP;
  COMMIT;
END;
