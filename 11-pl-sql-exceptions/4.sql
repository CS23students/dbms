-- Write a PL/SQL to handle user defined exception.

DECLARE
  v_marks NUMBER := 45;
  e_low_marks EXCEPTION;
BEGIN
  IF v_marks < 50 THEN
    RAISE e_low_marks;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Passed');
  END IF;
EXCEPTION
  WHEN e_low_marks THEN
    DBMS_OUTPUT.PUT_LINE('Failed: Marks are below passing criteria.');
END;
/
