-- LIMIT AND ALIASING(nicknames)
select *
from employee_demographics
limit 3;                # will only give starting 3 rows

select gender , AVG(age) as avg_age         #nickname given
from employee_demographics
group by gender
having avg_age>40;

