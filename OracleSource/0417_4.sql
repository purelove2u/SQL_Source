-- ���� �Լ�
-- ABS(���밪)
select abs(-78),abs(+78)
from dual;

-- ROUND 4.875
select round(4.875,1)
from dual;

-- ���� ��� �ֹ� �ݾ��� ���
select custid "����ȣ", round(avg(saleprice),-2) "��ձݾ�"
from orders
group by custid;

select * from book;

-- ġȯ: REPLACE - å�̸����� �߱��� �󱸷� ����
select bookid, replace(bookname,'�߱�','��')bookname,price
from book;

-- �½��������� ������ ������ ���� ������ ���� ��, ����Ʈ(�޸�)
-- �ѱ� 2����Ʈ unicode 3����Ʈ
select bookname "����", length(bookname) "���ڼ�", 
lengthb(bookname) "����Ʈ ��"
from book
where publisher like '�½�����';

-- substr(s,n,k)
-- ���� ���� ���� ���� �� ���
select substr(name,1,1)"��", count(*)"�ο�"
from customer
group by substr(name,1,1);

-- TO_CHAR(����), TO_DATE(��¥),sysdate, ADD_MONTHS, LAST_DAY
SELECT    orderid "�ֹ���ȣ", TO_CHAR(orderdate,'yyyy-mm-dd day')  "�ֹ���",
             custid "����ȣ", bookid "������ȣ",sysdate "���ó�¥",
             ADD_MONTHS(TO_DATE('2020-4-17','yyyy-mm-dd'),-4),
              LAST_DAY(TO_DATE('2020-2-17','yyyy-mm-dd'))
FROM     Orders
WHERE    orderdate=TO_DATE('20140707','yyyymmdd');
-- �ð�
select systimestamp from dual;
select sysdatetime from dual;

select sysdate, TO_CHAR(sysdate, 'yyyy/mm/dd day hh24:mi:ss') "sysdate_1"
from dual;

-- �ֹ��Ϸκ��� 10�� �� ������ Ȯ�� �ֹ��� Ȯ�����ڸ� ���
select orderid "�ֹ���ȣ",orderdate "�ֹ���",orderdate+10"Ȯ������"
from orders;
-- Ʃ���� ��
select * from book where rownum<=5;

select rownum "����", name, phone
from customer
where ROWNUM<=2;

-- NULL �� ó��
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
















