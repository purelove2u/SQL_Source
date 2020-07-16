-- 데이터베이스 sqldb
-- 테이블 
create database sqldb;
use sqldb;
select * from usertbl;

create table usertbl(
userid char(8) not null primary key,
name varchar(10) not null,
birthyear int(10) not null,
addr char(2) not null,
mobile1 char(3),
mobile2 char(8),
height smallint,
mdate date);

insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
insert into usertbl values('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
insert into usertbl values('SSK', '성시경', 1979, '서울', null, null, 186, '2013-12-12');
insert into usertbl values('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
insert into usertbl values('YJS', '윤종신', 1969, '경남', null, null, 170, '2005-5-5');
insert into usertbl values('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
insert into usertbl values('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
insert into usertbl values('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

select * from buytbl;

create table buytbl(
num int(11) not null primary key,
userid char(8) not null,
prodname char(6) not null,
groupname char(4) default null,
price int(11) not null,
amount smallint(6) not null,
foreign key (userid) references usertbl(userid) on update cascade
);

insert into buytbl values(1, 'KBS', '운동화', null, 30, 2);
insert into buytbl values(2, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(3, 'JYP', '모니터', '전자', 200, 1);
insert into buytbl values(4, 'BBK', '모니터', '전자', 200, 5);
insert into buytbl values(5, 'KBS', '청바지', '의류', 50, 3);
insert into buytbl values(6, 'BBK', '메모리', '전자', 80, 10);
insert into buytbl values(7, 'SSK', '책', '서적', 15, 5);
insert into buytbl values(8, 'EJW', '책', '서적', 15, 2);
insert into buytbl values(9, 'EJW', '청바지', '의류', 50, 1);
insert into buytbl values(10, 'BBK', '운동화', null, 30, 2);
insert into buytbl values(11, 'EJW', '책', '서적', 15, 1);
insert into buytbl values(12, 'BBK', '운동화', null, 30, 2);

-- 내부 조인
select * from usertbl as ub join buytbl as bb on ub.userid = bb.userid;
-- 
select * from buytbl;
select * from usertbl;
-- 
-- 외부 조인
select bb.userid, bb.prodname from usertbl as ub right join buytbl as bb on ub.userid = bb.userid;



use shopdb;
select * from membertbl;

-- kim 김연아 서울시 강남구
-- park 박지성 경기도 수원시

insert into membertbl values('kim', '김연아', '서울시 강남구');
insert into membertbl values('park', '박지성', '경기도 수원시');
create view uv_membertbl as
select membername, memberaddress from membertbl;


use sqldb;
-- groupname 전자
create view uv_buytbl as
select * from buytbl where groupname = '전자';

use shopdb;

select * from membertbl where membername = '상길이';