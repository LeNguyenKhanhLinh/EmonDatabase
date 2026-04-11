DROP TABLE IF EXISTS job_history5;
DROP TABLE IF EXISTS countries7;
DROP TABLE IF EXISTS countries6;
DROP TABLE IF EXISTS countries5;
DROP TABLE IF EXISTS jobs3;
DROP TABLE IF EXISTS countries4;
DROP TABLE IF EXISTS job_history2;
DROP TABLE IF EXISTS countries32;
DROP TABLE IF EXISTS countries3;
DROP TABLE IF EXISTS jobs2;
DROP TABLE IF EXISTS countries2;
DROP TABLE IF EXISTS dupcountries;
DROP TABLE IF EXISTS dup_countries;
DROP TABLE IF EXISTS countriesss;
DROP TABLE IF EXISTS countriess;
Drop table if exists departments2;
-- Bài 1
-- Write a SQL statement to create a simple table countries including columns country\_id,country\_name and region\_id.
create table if not exists countriess (
country_id integer primary key,
country_name text,
region_id integer
);
-- đề bài muốn làm create table xong thấy sai vì đã exist rồi thì phải???
-- Bài 2:
-- Write a SQL statement to create a simple table countries including columns country\_id,country\_name and region\_id which already exists.
create table if not exists countriesss(
country_id int primary key,
country_name text,
region_id integer
);
-- Bài 3
-- Write a SQL statement to create the structure of a table dup\_countries similar to countries.
create table dup_countries like countries;
-- Bài 4
-- Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup\_countries.
create table dupcountries 
select * from countries;
-- Bài 5
-- Write a SQL statement to create a table countries set a constraint NULL.
create table countries2(
country_id int primary key,
country_name text null
);
-- Bài 6
-- Write a SQL statement to create a table named jobs including columns job\_id, job\_title, min\_salary, max\_salary and check whether the max\_salary amount exceeding the upper limit 25000.
create table if not exists jobs2(
job_id int,
job_title text,
min_salary int,
max_salary int,
check(max_salary<=25000)
);
-- Bài 7
-- Write a SQL statement to create a table named countries including columns country\_id, country\_name and region\_id and make sure that no countries except Italy, India and China will be entered in the table.
create table if not exists countries3(
	country_id int,
    country_name enum('Italy','China','India'),
    region_id int
);
-- Cách 2:
create table if not exists countries32(
	country_id int,
    country_name text,
    region_id int,
    check(country_name in ('Italy','China','India'))
);
-- bài 8
-- Write a SQL statement to create a table named job\_history including columns employee\_id, start\_date, end\_date, job\_id and department\_id and make sure that the value against column end\_date will be entered at the time of insertion to the format like '--/--/----'.
create table if not exists job_history2(
	employee_id int,
    start_date date,
    end_date date, 
    job_id int,
    department_id int
);
-- Chú ý chưa có cách giải quyết khi enter date vào khác format yyyy-mm-đ. hãy quay lại và update sau
-- Bài 9
-- Write a SQL statement to create a table named countries including columns country\_id,country\_name and region\_id and make sure that no duplicate data against column country\_id will be allowed at the time of insertion.
create table if not exists countries4(
	country_id int unique,
    country_name text,
    region_id int
);
-- Bài 10
-- Write a SQL statement to create a table named jobs including columns job\_id, job\_title, min\_salary and max\_salary, and make sure that, the default value for job\_title is blank and min\_salary is 8000 and max\_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
create table if not exists jobs3(
	job_id int primary key,
    job_title varchar(100) default '', -- không dùng text với default 1!!!!
    min_salary int default 8000,
    max_salary int default NULL
);
-- Bài 11
-- *Write a SQL statement to create a table named countries including columns country\_id, country\_name and region\_id and make sure that the country\_id column will be a key field which will not contain any duplicate data at the time of insertion.
create table if not exists countries5(
	country_id int primary key,
    country_name text,
    region_id int
);
-- Bài 12
-- Write a SQL statement to create a table countries including columns country\_id, country\_name and region\_id and make sure that the column country\_id will be unique and store an auto incremented value.
create table if not exists countries6(
	country_id int auto_increment unique,
    country_name text,
    region_id int
);
-- Bài 13
-- Write a SQL statement to create a table countries including columns country\_id, country\_name and region\_id and make sure that the combination of columns country\_id and region\_id will be unique.
create table if not exists countries7(
	country_id int,
    country_name text,
    region_id int,
    unique(country_id,region_id)
);

-- Bài 14
-- Write a SQL statement to create a table job\_history including columns employee\_id, start\_date, end\_date, job\_id and department\_id and make sure that, the employee\_id column does not contain any duplicate value at the time of insertion and the foreign key column job\_id contain only those values which are exists in the jobs table.
create table if not exists job_history5(
	employee_id int primary key,
    start_date date,
    end_date date, 
    job_id int,
    department_id int,
    foreign key (job_id) 
    references jobs3(job_id)
);
-- Bài 15
CREATE TABLE departments2(
    department_id DECIMAL(4,0),
    department_name VARCHAR(30),
    manager_id DECIMAL(6,0),
    location_id DECIMAL(4,0),
    PRIMARY KEY(department_id, manager_id)
);
insert into departments2
select* from departments;
-- Write a SQL statement to create a table employees including columns employee\_id, first\_name, last\_name, email, phone\_number hire\_date, job\_id, salary, commission, manager\_id and department\_id and make sure that, the employee\_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department\_id and manager\_id columns contain only those unique combination values, which combinations are exists in the departments table.
create table if not exists employees10(
	employee_id int primary key,
    first_name text,
    last_name text,
    email varchar(100),
    phone_number varchar(100),
    hire_date date,
    job_id int,
    salary int,
    commission text,
    manager_id decimal(6,0),
    department_id decimal(4,0),
    foreign key(department_id, manager_id)
    references departments2(department_id, manager_id)
)
