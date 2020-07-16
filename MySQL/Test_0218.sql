use sample;
select emp_no, first_name, last_name from employees.employees;
-- 테이블 생성, 테이블 삽입
create table test1(id int, Fname varchar(50), lname varchar(50));
insert into test1 select emp_no, first_name, last_name from employees.employees;

select * from test1;
-- 테이블 복사
create table test2(select emp_no, first_name, last_name from employees.employees);

select * from test2;

-- test 1
-- 1. fname이 'Kyoichi'인 사원의 Lname을 '없음' 으로 갱신.
-- 2. Fname이 'Aamer'인 사원을 검색하여 5개만 삭제.
-- 3. sqldb에서 buytbl에 price을 1.5배 가격 인상.
-- 4. employees 테이블의 내용중 1000개를 bigtbl에 복사하시오.
-- 5. bigtbl, test1, test2 테이블 삭제. 

update test1 set lname = '없음' where fname = 'kyoichi';
select * from test1 where fname = 'aamer';

delete from test1 where fname = 'aamer' limit 5; 

use sqldb;
select * from buytbl;
update buytbl set price = price * 1.5 ;

create table bigtbl(select * from employees.employees limit 1000);
select * from bigtbl;

drop table bigtbl, sample.test1, sample.test2;