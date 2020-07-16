-- PL/SQL : �����(create...) / �����(Begin-End)

-- �����
create or replace procedure InsertBook(
mybookid in number,-- in �Է� �Ű�������� ��
mybookname in varchar2,
mypublisher in varchar2,
myprice in number)
as
begin
insert into book(bookid,bookname,publisher,price)
values(mybookid,mybookname,mypublisher,myprice);
end;
/

EXEC InsertBook(13,'����������','������м���',25000);

select * from book;


create or replace procedure bookinsertorupdate(
mybookid  number,
mybookname  varchar2,
mypublisher  varchar2,
myprice int)
as
 mycount number; -- ������������
begin
select count(*) into mycount from book
where bookname like mybookname; -- ���� �̸��� ������ ������� �˻�

    if mycount !=0 then -- ���� ������ ������
        update book set price=myprice
        where bookname like mybookname;
    else
        insert into book(bookid,bookname,publisher,price)
        values(mybookid,mybookname,mypublisher,myprice);
    end if;
    
end;
/

-- �űԵ��� �Է�
EXEC bookinsertorupdate(15,'������ ��ſ�','������м���',25000);
select * from book;
-- ������ ������Ʈ
EXEC bookinsertorupdate(15,'������ ��ſ�','������м���',20000);
select * from book;

-- Book ���̺� ����� ������ ��հ����� ��ȯ�ϴ� ���ν���(AveragePrice)
create or replace procedure AveragePrice1(
AverageVal out number) -- out : ��� �Ű������� �ǹ�
as
begin
select round(avg(price),2) into AverageVal from book where price is not null;
end;
/

-- ���ν��� ����
-- DBMS_OUTPUT.PUT_LINE : ��� ��ɾ�
SET SERVEROUTPUT ON;
DECLARE
AverageVal NUMBER; 
begin
AveragePrice1(AverageVal);
DBMS_OUTPUT.PUT_LINE('������ ��հ��� : ' || AverageVal);
end;

-- CURSOR : Ŀ���� ����(�۾� ���� ����)
-- OPEN : Ŀ���� ��븦 ����
-- FETCH : �� ������ ������
-- CLOSE : Ŀ���� ����� ����

-- Ŀ���� ����� ��ü���ͱݾ��� ��ȯ�ϴ� ���ν��� (Interest)
create or replace procedure Interest
as
 myInterest NUMERIC; -- ��������
 price NUMERIC; -- ��������
 CURSOR interestCURSOR is select saleprice from orders; -- Ŀ�� ���� ����
begin
 myInterest :=0.0;
 open interestCURSOR; 
     loop
       fetch interestCURSOR into price; 
       exit when interestCURSOR%notfound; 
            if price >= 20000 then
              myinterest :=myinterest+price*0.1;
            else
              myinterest :=myinterest+price*0.05;
            end if;
     end loop; 
 close interestCURSOR; 
 DBMS_OUTPUT.PUT_LINE('��ü ���� �ݾ� : ' || myinterest); 
end;
/

SET SERVEROUTPUT ON;
exec interest;
















