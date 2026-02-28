-- CASE STATEMENTS
select first_name ,
last_name,
age,
case
	when age <=30 then 'young'
    when age between 31 and 50 then 'old'
    when age >=50 then 'on deaths door'
end as AGE_BRACKET
from employee_demographics;