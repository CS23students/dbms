-- 3	Write a database trigger to display the total number of records after inserting a record into the table

CREATE OR REPLACE TRIGGER trg_total_records_after_insert
AFTER INSERT ON employee
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM employee;
  DBMS_OUTPUT.PUT_LINE('Total number of records after insert: ' || v_count);
END;
/
