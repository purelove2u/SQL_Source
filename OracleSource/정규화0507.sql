create table summer(
    sid     number,
    class   varchar2(20),
    price   number);
    
insert into summer values (100, 'Java', 20000);
insert into summer values (150, 'Python', 15000);
insert into summer values (200, 'C++', 25000);
insert into summer values (250, 'Java', 20000);

select * from summer;
select sid, class from summer;
select price from summer where class = 'C++';

select distinct class 
from summer
where price in (select max(price) from summer);

select count(*), sum(price) from summer;

-- 삭제이상현상
select price "C++수강료" from summer where class = 'C++';

/* 200번 학생의 수강 취소 */
delete from summer
where sid = 200;

select price "C++수강료" from summer where class = 'C++';

-- 삽입이상
/* JAVA 강좌 개설 */
insert into summer values (null, 'java', 25000);

select count(*) "수강인원" from summer;
select count(sid) "수강인원" from summer;
select count(*) "수강인원" from summer where sid is not null;

-- 수정이상현상
select * from summer;

update summer set price = 15000 where class = 'Java'; -- 정상
update summer set price = 20000 where class = 'Java' and sid = 100; --같은 것에 대한 가격이 달라지는 상황

select price "Java 수강료" from summer where class = 'Java';

-- 수정된 계절학기 데이터베이스
drop table summerprice;
drop table summerenroll;

create table summerclass(
    sid     number not null primary key,
    class   varchar2(20));

create table summerprice(
    sid     number not null references summerclass(sid),
    price   number);

insert into summerclass values (100, 'Java');
insert into summerclass values (150, 'Python');
insert into summerclass values (200, 'C++');
insert into summerclass values (250, 'Java');

insert into summerprice values (100, 20000);
insert into summerprice values (150, 15000);
insert into summerprice values (200, 25000);
insert into summerprice values (250, 20000);

select * from summerclass;
select * from summerprice;

-- 삭제
select price "C++ 수강료" from SummerPrice where class='C++';

/* 200번 학생의 수강취소 */
delete from Summerclass
where sid=200;

select price "C++ 수강료" from SummerPrice where class='C++';

-- 삽입 (NULL)
/* JAVA 강좌 개설 */
insert into SummerPrice VALUES('JAVA',25000);

/*수강인원 검색*/
SELECT count(*) "수강인원"
from SummerPrice;

-- 수정
select * from SummerPrice;

update SummerPrice
set price=15000
where class='JAVA';

select DISTINCT price "JAVA 수강료"
from SummerPrice
where class='JAVA';









-- 삭제이상현상
select price "C++수강료" from summerprice where class = 'C++';

/* 200번 학생의 수강 취소 */
delete from summer
where sid = 200;

select price "C++수강료" from summer where class = 'C++';

-- 삽입이상
/* JAVA 강좌 개설 */
insert into summer values (null, 'java', 25000);

select count(*) "수강인원" from summer;
select count(sid) "수강인원" from summer;
select count(*) "수강인원" from summer where sid is not null;

-- 수정이상현상
select * from summer;

update summer set price = 15000 where class = 'Java'; -- 정상
update summer set price = 20000 where class = 'Java' and sid = 100; --같은 것에 대한 가격이 달라지는 상황

select price "Java 수강료" from summer where class = 'Java';
