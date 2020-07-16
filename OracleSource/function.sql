-- ���� �Լ�
select abs(-78), abs(+78)
from dual;

-- ROUND 4.875
select round(4.875, 1)
from dual;

-- ���� ��� �ֹ� �ݾ��� ���
select custid as "����ȣ", round(avg(saleprice), -3) as "��ձݾ�"
from orders
group by custid;

select * from book;

-- ġȯ : REPLACE - å�̸����� �߱��� �󱸷� ����
select bookid, replace(bookname, '�߱�', '��')bookname, price
from book;

-- �½��������� ������ ������ ������ ������ ���� ��, ����Ʈ(�޸�)
-- �ѱ��� 2 bytes / unicode 3 bytes / ���� 1 byte
select bookname "����", length(bookname) "���ڼ�", lengthb(bookname) "����Ʈ��"
from book
where publisher like '�½�����';

-- substr(s, n, k)
-- ���� ���� ���� ���� �� ���
select substr(name, 1, 1) "��", count(*) "�ο�"
from customer
group by substr(name, 1, 1);


select orderid "�ֹ���ȣ", orderdate "�ֹ���", custid "����ȣ", bookid "������ȣ"
from orders
where orderdate = '20140707';

-- TO_CHAR(����), TO_DATE(��¥)
select orderid "�ֹ���ȣ", to_char(orderdate, 'yyyy-mm-dd dy') "�ֹ���", custid "����ȣ", bookid "������ȣ", sysdate "���ó�¥"
    , add_months(to_date('2020-04-17', 'yyyy-mm-dd'), 12)
    , last_day(to_date('2020-04-17', 'yyyy-mm-dd'))
from orders
where orderdate = to_date('20140707', 'yyyymmdd');

-- �ֹ��Ϸκ��� 10�� �� ������ Ȯ�� �ֹ��� Ȯ�����ڸ� ���
select orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate + 10 "Ȯ������"
from orders;

-- Ʃ��(��� ���õ� ��)�� ��
select * from book where rownum <= 5;

select rownum "����", name, phone
from customer
where ROWNUM<=2;


-- �ð�
select systimestamp from dual;
select sysdatetime from dual;

select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

-- null �� ó��
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

select name,NVL(phone,'����ó����') from customer;



-- �μ����� (��Į������,�ζ�������,��÷����)
-- ��Į�� ����
-- ���� �Ǹž��� ���(����� ���̸�, ���� �Ǹž�)
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

-- orders ���̺� bookname�÷� �߰�
alter table orders add bookname varchar(30);

update orders 
set bookname = (select bookname from book where book.bookid = orders.bookid); 

select * from orders;

--  �ζ��� ��(������ ���̺��� ���������� ������ �������� ���̺� ���� ���� ��)
select custid, name
from customer
where custid <= 2;

-- ����ȣ�� 2 ������ ���� �Ǹž�
select name, sum(saleprice)
from (select custid, name
        from customer
        where custid <= 2) cs,
        orders od
where od.custid = cs.custid
group by name;

-- �񱳿�����(��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ, �ݾ� ���)
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
                    from orders);
                    
-- �񱳿�����(�� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ��� ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ� ���)
-- ������ ���̺��� �׷����� Ȱ�� : IN  / �񱳿����� ���� �ʿ�
select orderid, custid, saleprice
from orders od
where saleprice >= (select avg(saleprice)
                    from orders so
                    where od.custid = so.custid);

select custid, round(avg(saleprice), 0)
from orders so
group by custid;

-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž�
select custid
from customer
where address like '%���ѹα�%';

select sum(saleprice)
from orders
where custid IN (select custid
                from customer
                where address like '%���ѹα�%');
                
-- 3�� ���� �ֹ��� ������ ����
select saleprice
from orders
where custid = 3;
-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ ���� �ֹ���ȣ�� �ݾ�
select orderid, saleprice
from orders
where saleprice > (select max(saleprice) from orders where custid = 3);
--all (���)
select orderid, saleprice
from orders
where saleprice > all (select saleprice
                        from orders
                        where custid = 3);
--some=any(�ּ��� �ϳ���)
select orderid, saleprice
from orders
where saleprice > any (select saleprice
                        from orders
                        where custid = 3);
-- ���ѹα����� �����ϴ� ������ �Ǹ��� ������ ����
select *
from customer cs, orders od
where cs.custid = od.custid and address like '%���ѹα�%';

-- ���հ��
select sum(saleprice) "total"
from orders
where EXISTS ( select * from customer cs, orders od where cs.custid=od.custid and address like '%���ѹα�%');

--��Į�� ���� : �ֹ� ���� �ּ� �� �� ���ž�
select custid, (select address from customer cs where cs.custid = od.custid) "address", sum(saleprice)
from orders od
group by od.custid;

--�ζ��� �� : �ֹ��� ���� �̸�, ��ձ��ž� ���
select cs.name, s
from (select custid, avg(saleprice) s from orders group by custid) od, customer cs
where cs.custid = od.custid;

--��ø���� EXISTS Ȱ�� : ����ȣ 3�� ���� ���� �� ���ž�
select sum(saleprice) "total"
from orders od
where exists (select * from customer cs where custid <= 3 and cs.custid = od.custid);

select * from customer;
select * from orders;

-- view : �ϳ� �̻��� ���̺��� ���Ͽ� ���� ������ ���̺�(��)
-- ���� : ���뼺 / ���ȼ� / ������
-- ���� : insert, update, delete ���꿡 ���� ������ ���� / ���� �����Ͱ� ����Ǹ� ���������� ���� ����

create view vorders
as
select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

select * from vorders;

--�ǽ� : booktable���� '�౸'��� ������ ���Ե� �ڷḸ �����ִ� �� ����
--vw_book
create view vw_book
as
select *
from book
where bookname like '%�౸%';

--�ǽ� : ���� �ּҰ� '���ѹα�'�� �����ϴ� ����� ������ �� ����
--vw_customer
create view vw_customer
as
select *
from customer
where address like '%���ѹα�%';

select * from vw_book;
select * from vw_customer;
select * from book;

--���� ����(replace)
create or REPLACE view vw_customer (custid, name, address)
as
select custid, name, address
from customer
where address like '%����%';

-- �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� 
-- highorders �並 ����
create view highorders
as
select b.bookid, b.bookname, name, b.publisher, b.price 
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and price >= 20000;

-- ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ���
select bookname, name
from highorders;

-- highorders �並 ����(����)�Ϸ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����Ͻÿ�.
create or replace view highorders
as
select b.bookid, b.bookname, name, b.publisher
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and saleprice >= 20000;

select * from highorders;
drop view highorders;