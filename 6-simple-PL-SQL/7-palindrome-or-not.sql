-- Write a PL/SQL block to check the text is palindrome or not.
DECLARE
    text VARCHAR2(100) := '&text';
    reversed_text VARCHAR2(100) := '';
    len NUMBER;
BEGIN
    len := LENGTH(text);
    FOR i IN REVERSE 1..len LOOP
        reversed_text := reversed_text || SUBSTR(text, i, 1);
    END LOOP;
    IF text = reversed_text THEN
        DBMS_OUTPUT.PUT_LINE(text || ' is a Palindrome');
    ELSE
        DBMS_OUTPUT.PUT_LINE(text || ' is NOT a Palindrome');
    END IF;
END;
/
