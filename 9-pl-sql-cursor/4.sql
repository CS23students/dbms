-- 4	Write a PL/SQL block using cursor to display the total number of records, first, second, last, last but previous records and delete a record

DECLARE
  CURSOR emp_cursor IS SELECT * FROM employee;
  TYPE emp_table_type IS TABLE OF employee%ROWTYPE INDEX BY PLS_INTEGER;
  emp_table emp_table_type;
  count_records INTEGER := 0;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor BULK COLLECT INTO emp_table LIMIT 100;
    EXIT WHEN emp_cursor%NOTFOUND;
    count_records := emp_table.COUNT;
  END LOOP;
  CLOSE emp_cursor;

  DBMS_OUTPUT.PUT_LINE('Total Records: ' || count_records);
  IF count_records >= 1 THEN
    DBMS_OUTPUT.PUT_LINE('First: ' || emp_table(1).empname);
  END IF;
  IF count_records >= 2 THEN
    DBMS_OUTPUT.PUT_LINE('Second: ' || emp_table(2).empname);
  END IF;
  IF count_records >= 1 THEN
    DBMS_OUTPUT.PUT_LINE('Last: ' || emp_table(count_records).empname);
  END IF;
  IF count_records >= 2 THEN
    DBMS_OUTPUT.PUT_LINE('Last but one: ' || emp_table(count_records - 1).empname);
  END IF;
END;
