-- Write a PL/SQL block to find whether a year is leap year or not
DECLARE
    year NUMBER := &year;
BEGIN
    IF (MOD(year, 400) = 0) OR (MOD(year, 4) = 0 AND MOD(year, 100) <> 0) THEN
        DBMS_OUTPUT.PUT_LINE(year || ' is a Leap Year');
    ELSE
        DBMS_OUTPUT.PUT_LINE(year || ' is NOT a Leap Year');
    END IF;
END;
/

