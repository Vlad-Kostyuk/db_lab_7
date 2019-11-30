DELIMITER //
CREATE TRIGGER employees_before_update before update ON employees
 FOR EACH ROW

begin
  
  DECLARE peson_date DOUBLE;
  DECLARE stazh_days DOUBLE;
 
  select (to_days(SYSDATE()) - to_days(new.birthday)) into peson_date;
  select new.stazh * 365 into stazh_days;
  
   if (peson_date <= stazh_days)
    then signal sqlstate'45000'
     set message_text='error in stazh';
  end if;

end;//
DELIMITER;