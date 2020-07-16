create table userinfo(
id int primary key not null,
name varchar(20),
loginid varchar(20),
email varchar(20));

create table department(
id int primary key not null,
depart_nm varchar(20),
depart_tel varchar(20));

insert into userinfo values(1, '김영롱', 'kyl', 'kyl@naver.com');
insert into userinfo values(2, '김희선', 'khs', 'khs@gmail.com');
insert into userinfo values(3, '박수', 'bs', 'bs@daum.net');
insert into userinfo values(4, '최고', 'chg', 'chg@naver.com');
insert into userinfo values(5, '이미영', 'lmy', 'lmy@gmail.com');
select * from userinfo;

insert into department values(1, '기획과', '02-111-2222');
insert into department values(2, '영업과', '02-222-3333');
insert into department values(3, '관리과', null);
insert into department values(4, null, null);
select * from department;
--------------------------------------------------------------------------
------------------inner join (=Natural Join)--------------------
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo inner join department on userinfo.id = department.id;

------------------inner join 2 ---------------------------------
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id = department.id;

------------------inner join 3 ---------------------------------
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id(+) = department.id;


------------------outer join -----------------------------------
--left outer join : 왼쪽 테이블은 무조건 출력되며 오른쪽 테이블에 조건이 맞는 데이터도 출력
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo left outer join department on userinfo.id = department.id;

--left outer join 2
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id = department.id(+);

--right outer join : 오른쪽 테이블은 무조건 출력되며 왼쪽 테이블에 조건이 맞는 데이터도 출력
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo right outer join department on userinfo.id = department.id;

--right outer join 2
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id(+) = department.id;

