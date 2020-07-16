-- 수학 함수
-- ABS(절대값)
select abs(-78),abs(+78)
from dual;

-- ROUND 4.875
select round(4.875,1)
from dual;

-- 고객별 평균 주문 금액을 출력
select custid "고객번호", round(avg(saleprice),-2) "평균금액"
from orders
group by custid;

select * from book;

-- 치환: REPLACE - 책이름에서 야구를 농구로 변경
select bookid, replace(bookname,'야구','농구')bookname,price
from book;

-- 굿스포츠에서 출판한 도서의 재목과 제목의 글자 수, 바이트(메모리)
-- 한글 2바이트 unicode 3바이트
select bookname "제목", length(bookname) "글자수", 
lengthb(bookname) "바이트 수"
from book
where publisher like '굿스포츠';

-- substr(s,n,k)
-- 같은 성을 가진 고객의 수 출력
select substr(name,1,1)"성", count(*)"인원"
from customer
group by substr(name,1,1);

-- TO_CHAR(문자), TO_DATE(날짜),sysdate, ADD_MONTHS, LAST_DAY
SELECT    orderid "주문번호", TO_CHAR(orderdate,'yyyy-mm-dd day')  "주문일",
             custid "고객번호", bookid "도서번호",sysdate "오늘날짜",
             ADD_MONTHS(TO_DATE('2020-4-17','yyyy-mm-dd'),-4),
              LAST_DAY(TO_DATE('2020-2-17','yyyy-mm-dd'))
FROM     Orders
WHERE    orderdate=TO_DATE('20140707','yyyymmdd');
-- 시간
select systimestamp from dual;
select sysdatetime from dual;

select sysdate, TO_CHAR(sysdate, 'yyyy/mm/dd day hh24:mi:ss') "sysdate_1"
from dual;

-- 주문일로부터 10일 후 매출을 확정 주문의 확정일자를 출력
select orderid "주문번호",orderdate "주문일",orderdate+10"확정일자"
from orders;
-- 튜플의 수
select * from book where rownum<=5;

select rownum "순번", name, phone
from customer
where ROWNUM<=2;

-- NULL 값 처리
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
















