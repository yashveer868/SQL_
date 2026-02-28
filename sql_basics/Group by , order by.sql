SELECT * 
from employee_demographics;

-- GROUP BY
SELECT gender ,  avg(age)
from employee_demographics
group by gender;

-- ORDER BY
SELECT * 
from employee_demographics
order by first_name ASC;  

SELECT * 
from employee_demographics
order by gender , age ASC;  

-- HAVING CLAUSE
SELECT occupation , AVG(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having AVG(salary)>75000;