with recursive fixedtb as
((select distinct t1.title as src, t2.title as dst
from titles as t1 , titles as t2
where t1.emp_no= t2.emp_no and t1.title<> t2.title and t1.from_date < t2.from_date )),
recursivetb (src,dst) as 
((select* from fixedtb)
union
(select fixedtb.src, recursivetb.dst
from fixedtb , recursivetb 
where fixedtb.dst=recursivetb.src))
select * from
(select * from (select distinct title as src from titles)t1 cross join (select distinct title as dst from titles)t2) as combo
where (combo.src,combo.dst) not in ( select * from recursivetb)
order by src, dst