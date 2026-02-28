-- CTE  ( COMMON TABLE EXPRESSION )

with CTE_example as
(
select gender , AVG(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal , count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from CTE_example;

select AVG(avg_sal)
from CTE_example;

-- we also have the ability to create multiple CTEs with just one With Expression

WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
), -- just have to separate by using a comma
CTE_Example2 AS 
(
SELECT employee_id, salary
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
)
-- Now if we change this a bit, we can join these two CTEs together
SELECT *
FROM CTE_Example cte1
JOIN CTE_Example2 cte2
	ON cte1. employee_id = cte2. employee_id;