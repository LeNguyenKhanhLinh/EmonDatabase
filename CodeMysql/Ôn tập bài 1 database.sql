-- Bài 1
show databases;
-- Bài 2
show tables;
-- Bài 3
describe employees;
-- Bài 6
Create database if not exists hr_db;
-- Bài 7
create table countries_backup 
as select * 
from countries 
where 1=0;
-- Bài 8
insert into countries_backup(country_id, country_name, region_id)
values(1, 'Austria', 3), 
(2, 'Bolivia', 4);
-- Bài 9
Select * 
from countries_backup;
-- Bài 10
select first_name, last_name, salary
from employees
limit 5;
-- Bài 11
show tables
from hrdb2;


