-- 4	Write a PL/SQL block using cursor to display the total number of records, first, second, last, last but previous records and delete a record

DECLARE
  CURSOR emp_cursor IS SELECT * FROM employee;
  TYPE emp_table_type IS TABLE OF employee%ROWTYPE INDEX BY PLS_INTEGER;
  emp_table emp_table_type;
  count_records INTEGER := 0;
BEGIN
  -- Load all employee records into a PL/SQL table
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor BULK COLLECT INTO emp_table LIMIT 100;
    EXIT WHEN emp_cursor%NOTFOUND;
    count_records := emp_table.COUNT;
  END LOOP;
  CLOSE emp_cursor;

  DBMS_OUTPUT.PUT_LINE('Total Records: ' || count_records);

  -- Display specific records
  IF count_records >= 1 THEN
    DBMS_OUTPUT.PUT_LINE('First Record: ' || emp_table(1).empname);
  END IF;
  IF count_records >= 2 THEN
    DBMS_OUTPUT.PUT_LINE('Second Record: ' || emp_table(2).empname);
  END IF;
  IF count_records >= 1 THEN
    DBMS_OUTPUT.PUT_LINE('Last Record: ' || emp_table(count_records).empname);
  END IF;
  IF count_records >= 2 THEN
    DBMS_OUTPUT.PUT_LINE('Last But One Record: ' || emp_table(count_records - 1).empname);
  END IF;

  -- Delete the last record
  IF count_records >= 1 THEN
    DELETE FROM employee WHERE empno = emp_table(count_records).empno;
    DBMS_OUTPUT.PUT_LINE('Deleted the last record: ' || emp_table(count_records).empname);
  END IF;

  COMMIT;
END;
