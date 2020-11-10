with table1 as
(select s.emp_no, s.salary, d.dept_name, d.dept_no 
from salaries s
inner join dept_emp de 
 on s.emp_no=de.emp_no and year(s.to_date)=9999
inner join 
departments d
on d.dept_no = de.dept_no)
select  A.dept_name, A.emp_no, A.salary
from table1 A
where A.salary >= all (select B.salary from table1 B where A.emp_no <> B.emp_no and  A.dept_no = B.dept_no)
order by dept_name 