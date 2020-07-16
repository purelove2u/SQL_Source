select * from book;
select * from bookcompany;
select * from customer;
select * from orders;

-- 고객별로 주문한 도서의 총 수량과 총 판매액을 검색
select custid, count(orderid) as "도서수량", sum(saleprice) as "총 구매액" from orders group by custid order by custid;
-- 추가로 30000원 이상고객
select custid, count(orderid) as "도서수량", sum(saleprice) as "총 구매액" 
from orders 
group by custid 
having sum(saleprice) >= 30000
order by custid;
-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 검색
--(단 두 권이상 구매한 고객만 출력)
select custid, count(*) as "총 수량"
from orders
where saleprice >= 8000
group by custid
having count(custid) >= 2
order by custid;

--JOIN
select * from orders join customer on orders.custid = customer.custid order by customer.custid;
--위와 동일한 결과를 내는 문장
select * from orders, customer where orders.custid = customer.custid order by customer.custid;

select name, sum(saleprice)
from orders od
inner join customer cs on od.custid = cs.custid
group by  cs.name
order by name;

-- 3개 엮기
select * from orders, customer, book where orders.custid = customer.custid and book.bookid = orders.bookid;

select name, bookname from orders, customer, book where orders.custid = customer.custid and book.bookid = orders.bookid and price = 20000;

select *
from orders od
inner join customer cs on od.custid = cs.custid
inner join book bk on bk.bookid = od.bookid;

select name, bookname
from orders od
inner join customer cs on od.custid = cs.custid
inner join book bk on bk.bookid = od.bookid
where price = 20000;

-- 외부조인(합집합)
select name, saleprice
from customer cs
left outer join orders od on cs.custid = od.custid;

select bookname, saleprice
from book bk
left outer join orders od on bk.bookid = od.bookid; --있는 책 다 나옴

select bookname, saleprice
from book bk
right outer join orders od on bk.bookid = od.bookid; --팔린 책만 나옴

select * from customer;
select * from orders;
select * from book order by bookid;

update book set price = 90000 where bookname = '스포츠 과학';

-- 부속질의
select bookname
from book
where price = (select max(price)
from book);

select max(price)
from book;

select custid
from orders;

select name
from customer
where custid IN (select custid from orders);

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름
select name
from customer
where custid IN (select custid 
                  from orders
                  where bookid IN (select bookid 
                                   from book 
                                   where publisher = '대한출판사' )); 
                                   
-- book 테이블에서 출판사별 price의 평균(avg)
select publisher, avg(price)
from book
group by publisher
order by avg(price);

-- book 에서 출판사별 평균보다 비싼 것의 bookname
select bookname, b1.publisher
from book b1
where price > (select avg(price)
                from book b2
                where b1.publisher = b2.publisher);

-- 집합연산(UNION, MINUS, INTERSECT)
-- 도서를 구매하지 않은 고객
select name
from customer
MINUS
    select name
    from customer
    where custid IN (select custid
                    from orders);

-- EXISTS
select name, address
from customer cs
where exists (select *
                from orders od
                where cs.custid = od.custid);
-- 박지성이 구매하지 않은 도서의 이름(단, EXISTS사용)
select bookname
from customer cs, orders od, book bk
where cs.custid = od.custid and od.bookid = bk.bookid
and name like '박지성';

select bookname from book
where not exists (select bookname
                    from customer, orders
                    where customer.custid = orders.custid and orders.bookid = book.bookid
                    and customer.name like '박지성');

-- 주문하지 않은 고객의 이름(단 NOT IN사용)
select name from customer
    where name not in (select name
                        from orders, customer
                        where orders.custid = customer.custid);


select *
from orders od;

select * from customer;