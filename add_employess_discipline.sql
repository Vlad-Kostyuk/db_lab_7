DELIMITER //
 create procedure add_employess_discipline(
in id_employees int,
in id_discipline int)
begin

	 declare exist_employees int;
     declare exist_discipline int;
    
     if exists(select * from  employees where employees.id_employees=id_employees)
     then select 1  into exist_employees;
     else
       signal sqlstate'45000'
       set message_text='error not exit employees';
     end if;
    
     if exists(select * from  discipline where discipline.id_discipline=id_discipline)
     then select 1  into exist_discipline;
     else
       signal sqlstate'45000'
       set message_text='error not exit id_discipline';
     end if;

	 INSERT INTO employess_discipline
     (id_employees, id_discipline)
     VALUES
    (id_employees, id_discipline);
  
	
end;//
DELIMITER ;