
DELIMITER //
CREATE TRIGGER employees_after_insert AFTER INSERT ON employees
 FOR EACH ROW

begin

   DECLARE log TEXT(1000);
   select concat( new.first_name,  ' ', new.last_name, ' ', new.passport) into log;
   
   INSERT INTO employees_log
   ( data,
     text)
   VALUES
   ( SYSDATE(),
    log);

end;//
DELIMITER ;

