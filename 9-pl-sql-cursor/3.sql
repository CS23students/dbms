-- 3	Write a PL/SQL block using cursor to display depno, location, depname, deploc salary(Use %rowtype)

DECLARE
  CURSOR dept_cursor IS SELECT * FROM department;
  dept_row department%ROWTYPE;
BEGIN
  OPEN dept_cursor;
  LOOP
    FETCH dept_cursor INTO dept_row;
    EXIT WHEN dept_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Deptno: ' || dept_row.depno || ', Name: ' || dept_row.depname || ', Location: ' || dept_row.deplocation);
  END LOOP;
  CLOSE dept_cursor;
END;
