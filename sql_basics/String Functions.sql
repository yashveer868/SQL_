-- STRING FUNCTIONS

select length('skyfall');

select first_name,length(first_name)
from employee_demographics
order by length(first_name);

select lower('SKEEU');
select upper('heyyy');

select trim('     heyy   ');  #remove leading and trailing spaces
select ltrim(' hey  '); #remove leading spaces only
select rtrim('    hey   '); #remove trailing spaces only

select first_name , 
left(first_name , 4),  # will give first 4 letters
right(first_name ,4),  # will give last 4 letters
substring(first_name,3,2) 
from employee_demographics;


select first_name ,replace(first_name,'a','z') #wherever a comes in first_name it will be replaced with z
from employee_demographics;

select locate('x','ALEXANDXR');

select first_name , last_name , 
concat(first_name,' ',last_name) as FULL_NAME   #joins two strings 
from employee_demographics;


