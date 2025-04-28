-- 3.	Write a PL/SQL to handle ‘duplicate value on index’ predefined exception

BEGIN
  INSERT INTO employee(empno, empname, designation, salary, depno)
  VALUES (101, 'John', 'Clerk', 3000, 10);  -- assuming empno=101 already exists
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Duplicate value found on unique index for empno.');
END;
/
