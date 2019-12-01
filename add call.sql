call add_employees_discipline(1, 100);

select * from employees e where e.stazh > GetEmployeesAVG();
select d.*, GetFormName(d.id_form) as forma  from discipline d

