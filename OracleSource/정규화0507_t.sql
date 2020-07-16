CREATE TABLE Summer
(   sid 	NUMBER,
    class 	VARCHAR2(20),
    price 	NUMBER
);

INSERT INTO Summer VALUES (100, 'JAVA', 20000);
INSERT INTO Summer VALUES (150, 'Python', 15000);
INSERT INTO Summer VALUES (200, 'C++', 25000);
INSERT INTO Summer VALUES (250, 'JAVA', 20000);

select * from summer;
select sid,class from summer;
select price from summer where class='C++';

select DISTINCT class
from summer
where price IN (select max(price) 
                from summer);
                
select count(*),sum(price)
from summer;

-- 삭제이상현상
select price "C++ 수강료" from summer where class='C++';

/* 200번 학생의 수강취소 */
delete from summer
where sid=200;

select price "C++ 수강료" from summer where class='C++';

-- 삽입이상 (NULL)
/* JAVA 강좌 개설 */
insert into summer VALUES(NULL,'JAVA',25000);

/*수강인원 검색*/
SELECT count(*) "수강인원"
from summer;
-- ==============================
SELECT count(sid) "수강인원"
from summer;

SELECT count(*) "수강인원"
from summer
where sid is not NULL;

-- 수정이상현상
select * from summer;

update summer
set price=15000
where class='JAVA';

select DISTINCT price "JAVA 수강료"
from summer
where class='JAVA';
-- =====================================
update summer
set price=20000
where class='JAVA' and sid=100;

update summer
set price=20000
where class='JAVA';

-- 수정된 계절학기 데이터베이스
drop table summerPrice; -- sid class
drop table summerEnroll; -- class price

/* SummerPrice 테이블 생성 */
CREATE TABLE SummerPrice
(   class VARCHAR2(20),
    price NUMBER
);
INSERT INTO SummerPrice VALUES ('JAVA', 20000);
INSERT INTO SummerPrice VALUES ('Python', 15000);
INSERT INTO SummerPrice VALUES ('C++', 10000);

/* SummerEnroll 테이블 생성 */
CREATE TABLE SummerEnroll
(   sid NUMBER,
    class VARCHAR2(20)
);
INSERT INTO SummerEnroll VALUES (100, 'JAVA');
INSERT INTO SummerEnroll VALUES (150, 'Python');
INSERT INTO SummerEnroll VALUES (200, 'C++');
INSERT INTO SummerEnroll VALUES (250, 'JAVA');


-- 삭제
select price "C++ 수강료" from SummerPrice where class='C++';

/* 200번 학생의 수강취소 */
delete from Summerenroll
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





