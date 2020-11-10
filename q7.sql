with table1 as
(select d.dept_name, dm.emp_no, dm.dept_no, datediff(dm.from_date,  dm.to_date) as timediff
from dept_manager dm, departments d
where year(dm.to_date)<> 9999
and d.dept_no = dm.dept_no)
select table1.emp_no, table1.dept_name
from table1
inner join 
(select table1.dept_no , min(timediff ) as maxtime
from table1
group by table1.dept_no) table2
on table1.dept_no=table2.dept_no
and table1.timediff=table2.maxtime
order by table1.dept_no
