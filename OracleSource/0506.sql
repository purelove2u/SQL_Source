-- 극장 (극장번호, 극장이름, 위치)
-- 상영관 (극장번호, 상영관번호, 영화제목, 가격, 좌석수)
-- 예약 (극장번호, 상영관번호, 고객번호, 좌석번호, 날짜)
-- 고객 (고객번호, 이름, 주소)

create table 극장(
    극장번호 number not null primary key,
    극장이름 nvarchar2(20),
    위치 nvarchar2(20));
    
create table 상영관(
    극장번호 number not null,   -- 여기서 references 극장(극장번호) 해도 되고 밑에서 foreign key 해도 됨
    상영관번호 number not null primary key,
    영화제목 nvarchar2(20),
    가격 number,
    좌석수 number,
    foreign key(극장번호) references 극장(극장번호));
    
alter table 상영관 add constraint 상영관_fk foreign key(극장번호) REFERENCES 극장(극장번호);

alter table 상영관 drop constraint 상영관_fk;

    
create table 고객(
    고객번호 number not null primary key,
    이름 nvarchar2(20),
    주소 nvarchar2(20));
    
create table 예약(
    극장번호 number not null, -- REFERENCES 극장(극장번호),
    상영관번호 number not null, -- REFERENCES 상영관(상영관번호),
    고객번호 number not null, -- REFERENCES 고객(고객번호),
    좌석번호 number not null primary key,
    날짜 date,
    foreign key(극장번호) REFERENCES 극장(극장번호),
    foreign key(상영관번호) REFERENCES 상영관(상영관번호),
    foreign key(고객번호) REFERENCES 고객(고객번호));


insert into 극장 values(1, '대한', '강남');
insert into 극장 values(2, '씨티', '강남');
insert into 극장 values(3, '씨티', '잠실');
insert into 극장 values(4, 'CGV', '서울시 강남구');
insert into 극장 values(5, '메가박스', '서울시 도봉구');

select * from 극장;

insert into 상영관 values(1, 1, '신세계', 9000, 35);
insert into 상영관 values(1, 2, '영웅호걸', 9000, 40);
insert into 상영관 values(3, 3, '러브레터', 9000, 10);
insert into 상영관 values(3, 4, '범죄의 도시', 7000, 50);
insert into 상영관 values(3, 5, '신과 함께', 7500, 20);

select * from 상영관;

insert into 고객 values(1, '장민태', '서울시 강동구');
insert into 고객 values(2, '홍길동', '서울시 도봉구');
insert into 고객 values(3, '김유신', '서울시 강남구');
insert into 고객 values(4, '오재호', '서울시 강남구');
insert into 고객 values(5, '정현석', '서울시 도봉구');

select * from 고객;

insert into 예약 values(1, 1, 1, 30, to_date('2019-10-15', 'yyyy-mm-dd'));
insert into 예약 values(2, 1, 2, 25, to_date('2019-10-15', 'yyyy-mm-dd'));
insert into 예약 values(3, 1, 3, 35, to_date('2019-10-17', 'yyyy-mm-dd'));
insert into 예약 values(4, 2, 4, 20, to_date('2020-09-01', 'yyyy-mm-dd'));

insert into 예약 values(4, 2, 4, 10, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into 예약 values(1, 3, 2, 40, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into 예약 values(3, 1, 2, 45, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into 예약 values(2, 2, 1, 50, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into 예약 values(2, 3, 1, 55, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into 예약 values(1, 2, 4, 15, to_date('2020-09-01', 'yyyy-mm-dd'));


select * from 예약;

-- <단순질의>
-- 1. 모든 극장의 이름과 위치 검색
select 극장이름, 위치 from 극장;
-- 2. '잠실'에 있는 극장정보 검색
select * from 극장 where 위치 LIKE '잠실';
-- 3. '서울시 강남구'에 사는 고객의 정보를 보이되 이름을 오름차순
select * from 고객 where 주소 LIKE '서울시 강남구' order by "이름";
-- 4. 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 검색
select 극장번호, 상영관번호, 영화제목, 가격 from 상영관 where 가격 <= 8000; 
-- 5. 극장 위치와 고객의 주소가 같은 고객들을 검색
select * from 고객, 극장 where 극장.위치 LIKE 고객.주소;

-- <집계질의>
-- 1. 극장의 수를 출력
select count(*) from 극장;
-- 2. 상영되는 영화의 평균 가격은 얼마인가?
select avg(가격) from 상영관;
-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수를 출력
select count(*) from 예약 where 날짜 = to_date('2020-09-01', 'yyyy-mm-dd');
-- 실제 고객의 이름으로 예약과 실제 관람이 이뤄진 결과 도출
select count(이름) from 고객, 예약 where 예약.고객번호 = 고객.고객번호 and 날짜 like to_date('2020-09-01', 'yyyy-mm-dd');

-- <부속질의와 조인>
-- 1. 대한 극장에서 상영된 영화제목을 출력(내부조인 사용)
select 영화제목 from 상영관 inner join 극장 on 상영관.극장번호 = 극장.극장번호 where 극장.극장이름 = '대한';
--
select 영화제목 from 상영관, 극장 where 극장.극장번호 = 상영관.극장번호 and 극장이름 like '대한';

-- 2. 대한 극장에서 영화를 본 고객의 이름을 출력(내부조인 사용)
select 이름 
    from 고객 
    inner join 예약 
    on 고객.고객번호 like (select 예약.고객번호 from 예약 inner join 극장 on 예약.극장번호 = 극장.극장번호 where 극장이름 = '대한'); 
--
select 고객.이름
    from 극장, 예약, 고객
    where 극장.극장번호 = 예약.극장번호 and 예약.고객번호 = 고객.고객번호
        and 극장이름 like '대한';

-- 3. 대한극장의 전체 수입
select sum(상영관.가격)
    from 상영관, 극장
    where 상영관.극장번호 = 극장.극장번호
        and 극장이름 like '대한';
        
-- <그룹질의>
-- 1. 극장별 상영관 수를 보이시오
select 극장번호, count(극장번호) from 상영관 group by "극장번호";

-- 2. '잠실'에 있는 극장이름을 보이시오
select 극장이름 from 극장 where 위치 = '잠실';
--
select 극장이름 from 극장, 상영관
    where 극장.극장번호 = 상영관.극장번호 and 위치 like '잠실';

-- 3. 2020년 9월 1일에 극장별 관람 고객의 수를 보이시오.
/* select avg(예약.고객번호)
    from 예약, 상영관, 극장
    where 예약.극장번호 = 상영관.극장번호 and 상영관.극장번호 = 극장.극장번호
    group by 예약.극장번호; */
--
select 극장번호, count(*)
from 예약
where 날짜 like to_date('2020-09-01', 'yyyy-mm-dd')
group by "극장번호";

-- 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화의 제목을 보이시오.
select 영화제목
    from 상영관, 예약
    where 상영관.상영관번호 = 예약.상영관번호 and 날짜 like to_date('2020-09-01', 'yyyy-mm-dd')
    group by 영화제목
    having count(*) in
    (select max(count(*))
        from 상영관, 예약
        where 상영관.상영관번호 = 예약.상영관번호 and 날짜 like to_date('2020-09-01', 'yyyy-mm-dd')
        group by 영화제목);

select 영화제목, count(상영관.영화제목)        
    from 상영관, 예약
    where 상영관.상영관번호 = 예약.상영관번호 and 날짜 like to_date('2020-09-01', 'yyyy-mm-dd')
    group by 영화제목
    order by count(상영관.영화제목) desc;
