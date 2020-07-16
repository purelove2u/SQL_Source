select * from book;
select * from bookcompany;
select * from customer;
select * from orders;

-- ������ �ֹ��� ������ �� ������ �� �Ǹž��� �˻�
select custid, count(orderid) as "��������", sum(saleprice) as "�� ���ž�" from orders group by custid order by custid;
-- �߰��� 30000�� �̻��
select custid, count(orderid) as "��������", sum(saleprice) as "�� ���ž�" 
from orders 
group by custid 
having sum(saleprice) >= 30000
order by custid;
-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ �˻�
--(�� �� ���̻� ������ ���� ���)
select custid, count(*) as "�� ����"
from orders
where saleprice >= 8000
group by custid
having count(custid) >= 2
order by custid;

--JOIN
select * from orders join customer on orders.custid = customer.custid order by customer.custid;
--���� ������ ����� ���� ����
select * from orders, customer where orders.custid = customer.custid order by customer.custid;

select name, sum(saleprice)
from orders od
inner join customer cs on od.custid = cs.custid
group by  cs.name
order by name;

-- 3�� ����
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

-- �ܺ�����(������)
select name, saleprice
from customer cs
left outer join orders od on cs.custid = od.custid;

select bookname, saleprice
from book bk
left outer join orders od on bk.bookid = od.bookid; --�ִ� å �� ����

select bookname, saleprice
from book bk
right outer join orders od on bk.bookid = od.bookid; --�ȸ� å�� ����

select * from customer;
select * from orders;
select * from book order by bookid;

update book set price = 90000 where bookname = '������ ����';

-- �μ�����
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

-- ���ѹ̵��� ������ ������ ������ ���� �̸�
select name
from customer
where custid IN (select custid 
                  from orders
                  where bookid IN (select bookid 
                                   from book 
                                   where publisher = '�������ǻ�' )); 
                                   
-- book ���̺��� ���ǻ纰 price�� ���(avg)
select publisher, avg(price)
from book
group by publisher
order by avg(price);

-- book ���� ���ǻ纰 ��պ��� ��� ���� bookname
select bookname, b1.publisher
from book b1
where price > (select avg(price)
                from book b2
                where b1.publisher = b2.publisher);

-- ���տ���(UNION, MINUS, INTERSECT)
-- ������ �������� ���� ��
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
-- �������� �������� ���� ������ �̸�(��, EXISTS���)
select bookname
from customer cs, orders od, book bk
where cs.custid = od.custid and od.bookid = bk.bookid
and name like '������';

select bookname from book
where not exists (select bookname
                    from customer, orders
                    where customer.custid = orders.custid and orders.bookid = book.bookid
                    and customer.name like '������');

-- �ֹ����� ���� ���� �̸�(�� NOT IN���)
select name from customer
    where name not in (select name
                        from orders, customer
                        where orders.custid = customer.custid);


select *
from orders od;

select * from customer;