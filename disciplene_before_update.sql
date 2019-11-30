
DELIMITER //
CREATE TRIGGER disciplene_before_update before update ON discipline
 FOR EACH ROW

begin

  if (new.semester < 1 or new.semester > 10)
  then signal sqlstate'45000'
    set message_text='error in semester';
   end if;

end;//
DELIMITER ;

