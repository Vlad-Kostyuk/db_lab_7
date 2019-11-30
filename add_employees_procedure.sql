DELIMITER //
 create procedure add_employees(
in first_name varchar(100),
in last_name varchar(100),
in surname varchar(100),
in birthday date,
in stazh double,
in passport varchar(255),
in id_position int,
in id_academic_status int,
in id_degree int)
begin

	 INSERT INTO employees
   (first_name, last_name, surname, birthday, stazh, passport, id_position,
 id_academic_status, id_degree)
  VALUES
  (first_name, last_name, surname, birthday, stazh, passport, id_position,
   id_academic_status, id_degree);
  
	
end;//
DELIMITER ;
