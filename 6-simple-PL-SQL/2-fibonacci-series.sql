-- Write a PL/SQL block to generate the fibonacci series
DECLARE
    n NUMBER := &n;
    a NUMBER := 0;
    b NUMBER := 1;
    temp NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Fibonacci Series:');
    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT_LINE(a);
        temp := a + b;
        a := b;
        b := temp;
    END LOOP;
END;
/
