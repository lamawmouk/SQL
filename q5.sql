select d.dept_name, count(de.dept_no ) as noe
from departments d  
inner join  dept_emp de
on de.dept_no=d.dept_no
GROUP BY 
d.dept_name
ORDER by
d.dept_name 