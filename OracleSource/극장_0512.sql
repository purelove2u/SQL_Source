select * from 극장;
create table 극장(
극장번호 number(4) PRIMARY key, 
극장이름 VARCHAR2(40), 
위치 VARCHAR2(40));

insert into 극장 values(1,'대한','강남'); 
insert into 극장 values(2,'씨티','강남'); 
insert into 극장 values(3,'씨티','잠실');
insert into 극장 values(4,'CGV','서울시 강남구'); 
insert into 극장 values(5,'메가박스','서울시 도봉구'); 

select * from 상영관;
create table 상영관(
극장번호 number(4)  REFERENCES 극장(극장번호), 
상영관번호 number(4)primary key, 
영화제목 VARCHAR2(40), 
가격 number(4) , 
좌석수 number(4));

insert into 상영관 values(1,1,'신세계',9000,35); 
insert into 상영관 values(1,2,'영웅호걸',9000,40);
insert into 상영관 values(2,2,'러브레터',9000,45);
insert into 상영관 values(3,3,'러브레터',9000,10);
insert into 상영관 values(3,4,'범죄의 도시',7000,50); 
insert into 상영관 values(3,5,'신과 함께',7500,20); 

select * from 예약;
create table 예약(
극장번호 number(4) REFERENCES 극장(극장번호), 
상영관번호 number(4) REFERENCES 상영관(상영관번호), 
고객번호 number(4) REFERENCES 고객(고객번호), 
좌석번호 number(4) primary key, 
날짜 DATE);

insert into 예약 values(1,1,1,30,to_date('2019-10-15','yyyy-mm-dd'));
insert into 예약 values(2,1,2,25,to_date('2019-10-15','yyyy-mm-dd'));
insert into 예약 values(3,1,3,35,to_date('2019-10-17','yyyy-mm-dd'));
insert into 예약 values(4,2,4,20,to_date('2020-09-01','yyyy-mm-dd'));
insert into 예약 values(4,3,3,10,to_date('2020-09-01','yyyy-mm-dd'));
insert into 예약 values(1,3,2,40,to_date('2020-09-01','yyyy-mm-dd'));
insert into 예약 values(3,1,2,45,to_date('2020-09-01','yyyy-mm-dd'));
insert into 예약 values(2,2,1,50,to_date('2020-09-01','yyyy-mm-dd'));
insert into 예약 values(2,3,1,55,to_date('2020-09-01','yyyy-mm-dd'));
insert into 예약 values(1,2,4,15,to_date('2020-09-01','yyyy-mm-dd'));

select * from 고객;
create table 고객(
고객번호 number(4) PRIMARY key, 
이름 VARCHAR2(40), 
주소 VARCHAR2(40));

insert into 고객 values(1,'장민태','서울시 강동구');
insert into 고객 values(2,'홍길동','서울시 도봉구');
insert into 고객 values(3,'김유신','서울시 강남구');
insert into 고객 values(4,'오재호','서울시 강남구');
insert into 고객 values(5,'정현석','서울시 도봉구');






-- ================================================================================
-- 1. 모든 극장의 이름과 위치 검색
SELECT 극장이름, 위치
	FROM 극장;
-- 2. ‘잠실’에 있는 극장 정보 검색
SELECT * FROM 극장
	WHERE 위치 LIKE '잠실';
-- 3. ‘서울시 강남구’에 사는 고객의 정보를 보이되 이름을 오름차순
SELECT 고객번호, 이름, 주소
	FROM 고객
	WHERE 주소 LIKE '서울시 강남구'
	ORDER BY 이름;
-- 4. 가격이 8,000원 이하인 영화의 극장번호, 상영관 번호, 영화제목을 검색
SELECT 극장번호, 상영관번호, 영화제목
	FROM 상영관
	WHERE 가격 <=8000;
-- 5. 극장 위치와 고객의 주소가 같은 고객의 이름과 극장 위치 검색
SELECT 고객.이름, 극장.위치
	FROM 고객, 극장
	WHERE 고객.주소 LIKE 극장.위치;
       
-- 집계질의 
-- 1. 극장의 수를 출력   
SELECT COUNT(극장번호)
	FROM 극장;
    
-- 2. 상영되는 영화의 평균 가격은 얼마인가?
SELECT AVG(가격)
	FROM 상영관;
  
-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수를 출력
SELECT COUNT(이름)
	FROM 고객, 예약
	WHERE 예약.고객번호=고객.고객번호 AND 날짜 like to_date('2020-09-01','yyyy-mm-dd');
    
--- 부속질의와 조인
-- 1. 대한 극장에서 상영된 영화제목을 출력(내부 조인사용)   
SELECT 영화제목
	FROM 극장, 상영관
	WHERE 극장.극장번호=상영관.극장번호 
           	AND 극장이름 LIKE '대한';
-- 2. 대한 극장에서 영화를 본 고객의 이름을 출력(내부 조인사용)           
SELECT 고객.이름
	FROM 극장, 예약, 고객
	WHERE 극장.극장번호=예약.극장번호 AND 예약.고객번호=고객.고객번호 
           	AND 극장이름 LIKE '대한';
            
-- 3. 대한 극장의 전체 수입을 보이시오.                     
SELECT SUM(가격)
	FROM 극장, 상영관
	WHERE 극장.극장번호=상영관.극장번호
     AND 극장이름 LIKE '대한';

-- 그룹질의
-- 1. 극장별 상영관 수를 보이시오
SELECT 극장번호, COUNT(*)
	FROM 상영관
	GROUP BY 극장번호;
-- 2. '잠실’에 있는 극장이름을 보이시오.
SELECT 극장이름 FROM 극장 where 위치 LIKE '잠실';
-- 3. 2020년 9월 1일에 극장별 예약 고객의 수를 보이시오.
select 극장번호, count(*)
from 예약
where 날짜 like to_date('2020-09-01','yyyy-mm-dd')
group by "극장번호";
-- 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화의 제목를 보이시오.
SELECT  영화제목
FROM 상영관, 예약
WHERE 상영관.상영관번호=예약.상영관번호
and 날짜 like to_date('2020-09-01','yyyy-mm-dd')
GROUP BY 영화제목
HAVING COUNT(*) IN (SELECT MAX(count(*))
                  FROM 상영관, 예약
                  WHERE 상영관.상영관번호=예약.상영관번호
                  and 날짜 like to_date('2020-09-01','yyyy-mm-dd')
				   GROUP BY 영화제목);   


