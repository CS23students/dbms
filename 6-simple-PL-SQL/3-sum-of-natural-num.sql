-- Write a PL/SQL block to find the sum of N natural numbers
DECLARE
    n NUMBER := &n;
    sum NUMBER := 0;
BEGIN
    FOR i IN 1..n LOOP
        sum := sum + i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Sum of first ' || n || ' natural numbers is ' || sum);
END;
/

