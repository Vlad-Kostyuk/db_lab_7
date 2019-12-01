DELIMITER //
CREATE PROCEDURE create_employees_tables()
BEGIN
DECLARE done int DEFAULT false;
DECLARE first_name, last_name char(25);
DECLARE id_employees int;
DECLARE count_felds int;
DECLARE fields_str varchar(255);
DECLARE Employees_Cursor CURSOR
FOR SELECT e.id_employees, e.first_name, e.last_name FROM employees e;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

SELECT FLOOR(RAND()*(10-1+1)+1) into count_felds;
SET  fields_str = CONCAT('( `id` INT NOT NULL');
SET count_felds = count_felds - 1;
WHILE count_felds > 0 DO
	 set fields_str=CONCAT(fields_str, ', `field', count_felds, '` INT ');
	 set count_felds= count_felds - 1;
 END WHILE;
 set fields_str=CONCAT(fields_str, ') ');

OPEN Employees_Cursor;

VladLoop: LOOP
FETCH Employees_Cursor INTO id_employees, first_name, last_name;
IF done=true THEN LEAVE VladLoop;
END IF;
SET @temp_query=CONCAT('CREATE TABLE ',
'employee_',id_employees, '_',
first_name, '_', last_name, fields_str);

PREPARE myquery FROM @temp_query;
EXECUTE myquery;
DEALLOCATE PREPARE myquery;
END LOOP;

CLOSE Employees_Cursor;
END //
DELIMITER ;