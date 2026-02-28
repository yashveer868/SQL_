SELECT * FROM employee_salary;
SELECT * FROM parks_and_recreation.employee_salary;         #this is used when the specific dataset (parks_and_recreation) is not highlighted 

-- WHERE CLAUSE
SELECT * 
from employee_salary 
where first_name = 'Leslie';

SELECT * 
from employee_salary
where salary>=50000;

SELECT * 
from employee_demographics
where gender !='Female';

-- AND / OR clause
SELECT * 
from employee_demographics
where birth_date > '1945-01-01' and gender = 'Male';

SELECT * 
from employee_demographics
where birth_date > '1945-01-01' or gender = 'Male';

SELECT * 
from employee_demographics
where (first_name='leslie' and age = 44) or age>55;

-- LIKE STATEMENT
-- % and _
SELECT * 
from employee_demographics
where first_name like 'jer%';                     # it gives the name that should start alwys start with jer 

SELECT * 
from employee_demographics
where first_name like '%er%';                 # any name in which er should be present

SELECT * 
from employee_demographics
where first_name like 'a%'; 

SELECT * 
from employee_demographics
where first_name like 'a__';    #here 2 spaces are given which means that name will come which starts from a and has 2 characters after a.