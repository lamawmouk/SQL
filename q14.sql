with recursive fixedtb as 
((select t1.title as src, t2.title as dst,  0 as counter,avg(year(t1.to_date)- year(t1.from_date))+1 as years
from titles t1 inner join  titles t2 on t1.emp_no= t2.emp_no and t1.title<> t2.title  and t1.to_date= t2.from_date
and t1.title <> t2.title
group by t1.title, t2.title)),
recursivetb as
(select * from fixedtb
union 
select fixedtb.src, recursivetb.dst, recursivetb.counter+1 as counter, recursivetb.years + fixedtb.years  as years 
from fixedtb, recursivetb 
where fixedtb.dst=recursivetb.src and recursivetb.counter <5)
select recursivetb.src, recursivetb.dst, min(recursivetb.years) as years from recursivetb
group by  recursivetb.src, recursivetb.dst having recursivetb.src<> recursivetb.dst
order by recursivetb.src