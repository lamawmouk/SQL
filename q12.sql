with table1 as
(select de.dept_no as deptnum, count(de.emp_no) cntemp, avg(s.salary)avgsalary
from dept_emp de, salaries s where de.emp_no = s.emp_no and year(s.to_date)=9999 and year(de.to_date)=9999 
group by de.dept_no)
select d.dept_name, count(de.emp_no)/cntemp *100 as above_avg_pect
from dept_emp de, salaries s, departments d, table1 t1 
where s.emp_no =de.emp_no and year(s.to_date)=9999 and year(de.to_date)=9999 
and d.dept_no= de.dept_no and t1.deptnum=de.dept_no and s.salary > t1.avgsalary
group by d.dept_name 


