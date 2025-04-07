-- Write a PL/SQL block to display a particular item details. Display appropriate message if the item is not found.

-- First create product table 
-- CREATE TABLE Items (
--     ItemCode VARCHAR2(10) PRIMARY KEY,
--     ItemName VARCHAR2(50),
--     Price NUMBER(10,2)
-- );
-- and insert some data
-- INSERT INTO Items (ItemCode, ItemName, Price) VALUES ('I101', 'Laptop', 45000);
-- INSERT INTO Items (ItemCode, ItemName, Price) VALUES ('I102', 'Smartphone', 25000);
-- INSERT INTO Items (ItemCode, ItemName, Price) VALUES ('I103', 'Headphones', 3000);
-- INSERT INTO Items (ItemCode, ItemName, Price) VALUES ('I104', 'Smartwatch', 5000);

DECLARE
    v_item_code VARCHAR2(10) := '&item_code';
    v_item_name VARCHAR2(50);
    v_price NUMBER;
BEGIN
    SELECT item_name, price
    INTO v_item_name, v_price
    FROM Items
    WHERE item_code = v_item_code;

    DBMS_OUTPUT.PUT_LINE('Item Name: ' || v_item_name);
    DBMS_OUTPUT.PUT_LINE('Price: ' || v_price);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Item Not Found');
END;
/


