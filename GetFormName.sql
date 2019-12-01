DELIMITER //
create function GetFormName(id int)
 returns varchar(100) DETERMINISTIC

begin
 
	  return (select f.name from form f where f.id_form = id);

end //
DELIMITER ;