-- 8	Write a PL/SQL block using cursor to display the order details

DECLARE
  CURSOR order_cursor IS SELECT * FROM orders;
BEGIN
  FOR rec IN order_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || rec.order_id || ', Date: ' || rec.order_date);
  END LOOP;
END;
