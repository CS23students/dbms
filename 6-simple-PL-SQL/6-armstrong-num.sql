-- Write a PL/SQL block to generate the armstrong numbers
DECLARE
    num NUMBER;
    digit NUMBER;
    sum NUMBER;
    temp NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Armstrong Numbers:');
    FOR num IN 1..999 LOOP
        temp := num;
        sum := 0;
        WHILE temp > 0 LOOP
            digit := MOD(temp, 10);
            sum := sum + POWER(digit, 3);
            temp := TRUNC(temp / 10);
        END LOOP;
        IF sum = num THEN
            DBMS_OUTPUT.PUT_LINE(num);
        END IF;
    END LOOP;
END;
/
