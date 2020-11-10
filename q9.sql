with table1 as
(select A.emp_no as Aempno, A.to_date as Atodate, A.from_date as Afromdate, B.emp_no, B.to_date, B.from_date 
from titles A, titles B
where A.emp_no=B.emp_no 
and A.title <>B.title
and A.from_date < B.from_date 
and A.to_date = B.from_date)
select tb.emp_no, count(tb.emp_no) as cnt
from salaries s, table1 tb
where s.emp_no=tb.emp_no
and s.from_date < tb.from_date
and s.to_date >= tb.from_date
group by tb.emp_no 
order by tb.emp_no