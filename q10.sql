with table1 as 
(select  s.emp_no, s.to_date, s.salary, e.hire_date 
from salaries s
inner join employees e
on  e.emp_no=s.emp_no 
and year(s.to_date)=9999
and year(e.birth_date )=1965 ) 
select eh.emp_no as h_empno, 
	eh.salary as h_salary, 
	eh.hire_date as h_date, 
	el.emp_no as l_empno, 
	el.salary as l_salary, 
	el.hire_date as l_date
from table1 eh, table1 el
where eh.emp_no <> el.emp_no 
and  eh.hire_date > el.hire_date 
and eh.salary > el.salary
order by eh.emp_no , el.emp_no 