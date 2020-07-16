drop database indextbl;
create database indexdb;
use indexdb;

create table indextbl(
first_name varchar(14),
last_name varchar(16),
hire_date date);

use indexdb;

insert into indextbl 
select first_name, last_name, hire_date from employees.employees limit 500;

create view uv_employees as 
select first_name, last_name, hire_date from employees.employees limit 500;

select * from indextbl where last_name = 'Erie' ;

create index idx_last_name on indextbl(last_name);

drop index idx_last_name on indextbl;