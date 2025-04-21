-- 9	Write a PL/SQL block using cursor to update the order status as ‘p’ if the order date is less than the delivery date   

DECLARE
  CURSOR order_cursor IS SELECT order_id FROM orders WHERE order_date < delivery_date;
BEGIN
  FOR rec IN order_cursor LOOP
    UPDATE orders SET order_status = 'P' WHERE order_id = rec.order_id;
  END LOOP;
  COMMIT;
END;
