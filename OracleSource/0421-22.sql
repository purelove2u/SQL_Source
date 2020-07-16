-- PL/SQL : �����(create...) / �����(Begine-End)

-- �����
create or replace procedure insertbook(
mybookid in number,
mybookname in varchar2,
mypublisher in varchar2,
myprice in number)
as
begin
insert into book(bookid, bookname, publisher, price)
values(mybookid, mybookname, mypublisher, myprice);
end;
/

select * from book order by bookid;

exec insertbook(13, '����������', '������м���', 25000);



create or replace procedure bookinsertorupdate(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int)
as
mycount number; --������������
begin
select count(*) into mycount from book
where bookname like mybookname; --���� �̸��� ������ �� ������ �˻�

if mycount != 0 then    --���� ������ ������
    update book set price = myprice
    where bookname like mybookname;
else
    insert into book(bookid, bookname, publisher, price) values(mybookid, mybookname, mypublisher, myprice);
end if;
end;
/

exec bookinsertorupdate(15, '�������� ��ſ�', '������м���', 25000);


-- Book ���̺� ����� ������ ��հ����� ��ȯ�ϴ� ���ν���(AveragePrice)
create or replace procedure AveragePrice(
AverageVal out number)  -- out ��� �Ű������� �ǹ�
as
begin
select round(avg(price), 2) into AverageVal from book where price is not null;
end;
/

-- ���ν��� ����
-- DBMS_OUTPUT.PUT_LINE : ��� ��ɾ�
SET SERVEROUTPUT on;
DECLARE
AverageVal number;
begin
AveragePrice(AverageVal);
dbms_output.put_line('������ ��հ��� : ' || AverageVal);
end;
/

-- CURSUR : Ŀ���� ����(�۾���������)
-- OPEN : Ŀ���� ����� ����
-- FETCH : �� ������ ������
-- CLOSE : Ŀ���� ����� ����

-- Ŀ���� ����� ��ü���ͱݾ��� ��ȯ�ϴ� ���ν���(Interest)
create or replace procedure Interest
as
 myInterest numeric;
 price numeric;
 cursor interestcursor is select saleprice from orders; -- Ŀ�� ���� ����
begin
 myInterest := 0.0; -- := ���Կ�����
 open interestcursor;   -- Ŀ�� ����� �˸�
 loop 
    fetch interestcursor into price;    -- Ʃ���� �������� fetch
    exit when interestcursor % notfound;    -- fetch �۾��� ����
        if price >= 20000 then
        myinterest := myinterest + price * 0.1;
        else
        myinterest := myinterest + price * 0.05;
        end if;
 end loop;
 close interestcursor;   --  Ŀ�� ����� ����
 dbms_output.put_line('��ü ���� �ݾ� : ' || myinterest);  --��� ���
end;
/

set serveroutput on;
exec interest;

select * from book order by bookid;