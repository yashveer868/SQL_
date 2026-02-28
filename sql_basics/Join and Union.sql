-- INNER JOIN  and  UNION
select * 
from employee_demographics;

select*
from employee_salary;

select*
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
select dem.employee_id,age,occupation
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- outer join
select*
from employee_demographics as dem
right join employee_salary as sal          # here all the values will come if it does not matches with table 1 then at that speceifc row NULL values will come
	on dem.employee_id = sal.employee_id;
    
select*
from employee_demographics as dem
left join employee_salary as sal          #simmilar to join
	on dem.employee_id = sal.employee_id;
    
    
-- union
select first_name , last_name
from employee_demographics
union all     # it will include all the values (repeated also) from both the datasets 
select first_name , last_name
from employee_salary;

select first_name , last_name
from employee_demographics
union distinct     # it will include all distinct values , no values will be repeated from both the datasets 
select first_name , last_name
from employee_salary;