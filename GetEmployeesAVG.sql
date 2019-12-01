DELIMITER //
create function GetEmployeesAVG()
 returns int DETERMINISTIC

begin
 
	  return (select AVG(e.stazh) from employees e);

end //
DELIMITER ;