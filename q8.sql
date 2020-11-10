select d.dept_name, table1.timediff as cnt
from departments d
inner join 
(select dm.dept_no , count(datediff(dm.to_date,dm.from_date)) timediff
from dept_manager dm
where year(dm.to_date)<> 9999
group by dm.dept_no) as table1
on d.dept_no = table1.dept_no
and table1.timediff <>1
order by d.dept_name 
