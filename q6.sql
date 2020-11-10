WITH ctetable as 
(select de.emp_no
from dept_emp de 
inner join employees e
on  e.emp_no=de.emp_no 
where year(e.birth_date )=1955 and de.dept_no ='d001'and year(de.to_date)=9999)
select A.emp_no as e1, B.emp_no as e2
from ctetable as A, ctetable as B
where A.emp_no < B.emp_no 