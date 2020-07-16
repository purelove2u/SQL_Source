-- 수학 함수
select abs(-78), abs(+78)
from dual;

-- ROUND 4.875
select round(4.875, 1)
from dual;

-- 고객별 평균 주문 금액을 출력
select custid as "고객번호", round(avg(saleprice), -3) as "평균금액"
from orders
group by custid;

select * from book;

-- 치환 : REPLACE - 책이름에서 야구를 농구로 변경
select bookid, replace(bookname, '야구', '농구')bookname, price
from book;

-- 굿스포츠에서 출판한 도서의 제목의 제목의 글자 수, 바이트(메모리)
-- 한글은 2 bytes / unicode 3 bytes / 공백 1 byte
select bookname "제목", length(bookname) "글자수", lengthb(bookname) "바이트수"
from book
where publisher like '굿스포츠';

-- substr(s, n, k)
-- 같은 성을 가진 고객의 수 출력
select substr(name, 1, 1) "성", count(*) "인원"
from customer
group by substr(name, 1, 1);


select orderid "주문번호", orderdate "주문일", custid "고객번호", bookid "도서번호"
from orders
where orderdate = '20140707';

-- TO_CHAR(문자), TO_DATE(날짜)
select orderid "주문번호", to_char(orderdate, 'yyyy-mm-dd dy') "주문일", custid "고객번호", bookid "도서번호", sysdate "오늘날짜"
    , add_months(to_date('2020-04-17', 'yyyy-mm-dd'), 12)
    , last_day(to_date('2020-04-17', 'yyyy-mm-dd'))
from orders
where orderdate = to_date('20140707', 'yyyymmdd');

-- 주문일로부터 10일 후 매출을 확정 주문의 확정일자를 출력
select orderid "주문번호", orderdate "주문일", orderdate + 10 "확정일자"
from orders;

-- 튜플(행과 관련된 것)의 수
select * from book where rownum <= 5;

select rownum "순번", name, phone
from customer
where ROWNUM<=2;


-- 시간
select systimestamp from dual;
select sysdatetime from dual;

select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

-- null 값 처리
create table mybook(
bookid number,
price number);

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook values(3,NULL);
insert into mybook values(4,NULL);

select * from mybook;

select price+100
from mybook
where bookid=3;

select sum(price),avg(price),count(*)
from mybook
where bookid>=7;

select * from mybook where price IS NULL;
select * from mybook where price='';

select name,NVL(phone,'연락처없음') from customer;



-- 부속질의 (스칼라질의,인라인질의,중첨질의)
-- 스칼라 질의
-- 고객별 판매액을 출력(결과는 고객이름, 고객별 판매액)
select
(select name
from customer cs
where cs.custid = od.custid) "name", sum(saleprice) "total"
from orders od
group by od.custid;

select name, sum(saleprice)
from orders od, customer cs
where od.custid = cs.custid
group by name;

select od.custid, sum(saleprice)
from customer cs, orders od
where cs.custid = od.custid
group by od.custid;

select name, sum(saleprice)
from orders od
inner join customer cs on od.custid = cs.custid
group by name;

select name
from customer cs;

-- orders 테이블에 bookname컬럼 추가
alter table orders add bookname varchar(30);

update orders 
set bookname = (select bookname from book where book.bookid = orders.bookid); 

select * from orders;

--  인라인 뷰(실제로 테이블이 생성되지는 않지만 가상으로 테이블 만들어서 보는 것)
select custid, name
from customer
where custid <= 2;

-- 고객번호가 2 이하인 고객의 판매액
select name, sum(saleprice)
from (select custid, name
        from customer
        where custid <= 2) cs,
        orders od
where od.custid = cs.custid
group by name;

-- 비교연산자(평균 주문금액 이하의 주문에 대해서 주문번호, 금액 출력)
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
                    from orders);
                    
-- 비교연산자(각 고객의 평균 주문금액보다 큰 금액의 주문에 대해서 주문번호, 고객번호, 금액 출력)
-- 동일한 테이블을 그룹으로 활용 : IN  / 비교연산자 사용시 필요
select orderid, custid, saleprice
from orders od
where saleprice >= (select avg(saleprice)
                    from orders so
                    where od.custid = so.custid);

select custid, round(avg(saleprice), 0)
from orders so
group by custid;

-- 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액
select custid
from customer
where address like '%대한민국%';

select sum(saleprice)
from orders
where custid IN (select custid
                from customer
                where address like '%대한민국%');
                
-- 3번 고객이 주문한 도서의 가격
select saleprice
from orders
where custid = 3;
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 고객의 주문번호와 금액
select orderid, saleprice
from orders
where saleprice > (select max(saleprice) from orders where custid = 3);
--all (모두)
select orderid, saleprice
from orders
where saleprice > all (select saleprice
                        from orders
                        where custid = 3);
--some=any(최소한 하나라도)
select orderid, saleprice
from orders
where saleprice > any (select saleprice
                        from orders
                        where custid = 3);
-- 대한민국에서 거주하는 고객에게 판매한 도서의 정보
select *
from customer cs, orders od
where cs.custid = od.custid and address like '%대한민국%';

-- 총합계액
select sum(saleprice) "total"
from orders
where EXISTS ( select * from customer cs, orders od where cs.custid=od.custid and address like '%대한민국%');

--스칼라 질의 : 주문 고객별 주소 및 총 구매액
select custid, (select address from customer cs where cs.custid = od.custid) "address", sum(saleprice)
from orders od
group by od.custid;

--인라인 뷰 : 주문한 고객별 이름, 평균구매액 출력
select cs.name, s
from (select custid, avg(saleprice) s from orders group by custid) od, customer cs
where cs.custid = od.custid;

--중첩질의 EXISTS 활용 : 고객번호 3번 이하 고객의 총 구매액
select sum(saleprice) "total"
from orders od
where exists (select * from customer cs where custid <= 3 and cs.custid = od.custid);

select * from customer;
select * from orders;

-- view : 하나 이상의 테이블을 합하여 만든 가상의 테이블(논리)
-- 장점 : 재사용성 / 보안성 / 독립성
-- 단점 : insert, update, delete 연산에 많은 제약이 따름 / 원본 데이터가 변경되면 종속적으로 같이 변함

create view vorders
as
select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

select * from vorders;

--실습 : booktable에서 '축구'라는 문구가 포함된 자료만 보여주는 뷰 생성
--vw_book
create view vw_book
as
select *
from book
where bookname like '%축구%';

--실습 : 고객의 주소가 '대한민국'을 포함하는 고객들로 구성된 뷰 생성
--vw_customer
create view vw_customer
as
select *
from customer
where address like '%대한민국%';

select * from vw_book;
select * from vw_customer;
select * from book;

--뷰의 수정(replace)
create or REPLACE view vw_customer (custid, name, address)
as
select custid, name, address
from customer
where address like '%서울%';

-- 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 
-- highorders 뷰를 생성
create view highorders
as
select b.bookid, b.bookname, name, b.publisher, b.price 
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and price >= 20000;

-- 생성된 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력
select bookname, name
from highorders;

-- highorders 뷰를 변경(수정)하려고 한다. 판매가격 속성을 삭제하시오.
create or replace view highorders
as
select b.bookid, b.bookname, name, b.publisher
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and saleprice >= 20000;

select * from highorders;
drop view highorders;