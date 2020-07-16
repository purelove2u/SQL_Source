--'�Ｚ��'���� ������ ������ �����Ͻÿ�
delete from book where publisher like '�Ｚ��';

-- ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �����Ͻÿ�
update book set publisher = '�������ǻ�' where publisher = '���ѹ̵��';

--���̺� �̸� : bookcompany
create table bookcompany(
    name varchar(20) primary key,
    address varchar(20),
    begin date);
    
select * from bookcompany;
drop table bookcompany;

-- webaddress varchar(30) �߰�
alter table bookcompany add webaddress varchar(30);

insert into bookcompany values ('�Ѻ� ��ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');

-- �÷��� ����(rename column) name -> company
alter table bookcompany rename column name to company;

-- Ÿ�� ����(modify) company VARCHAR(30)
alter table bookcompany modify company varchar(30);

-- �÷� ����(drop column) -> company
alter table bookcompany drop column company;

-- �������� ����(drop) PRIMARY KEY
alter table bookcompany drop primary key;

alter table bookcompany add company varchar(30);

-- �������� �߰�(add) primary key(company)
alter table bookcompany add primary key(company);

create table newbook(
    bookid      number primary key,
    bookname    varchar2(20),
    publisher   varchar2(20),
    price       number default 10000 check (price > 1000));
    
create table newcustomer(
    custid      number primary key,
    name        varchar2(40),
    address     varchar2(40),
    phone       varchar2(30));
    
create table neworders(
    orderid     number,
    custid      number not null,
    bookid      number not null,
    saleprice   number,
    orderdate   date,
    primary key (orderid),
    foreign key (custid) references newcustomer(custid) on delete cascade);
    
create sequence seq_testtable
start with 1
increment by 1
maxvalue 99999 cycle nocache;

insert into newbook values(seq_testtable.nextval, '�౸', '���ѹ̵��', 25000);
insert into newbook values(seq_testtable.nextval, '�߱�', '�̻�̵��', 28000);
insert into newbook values(seq_testtable.nextval, '��', '���ѹ̵��', 20000);

select * from newbook;

--newbook ���̺��� TB_newbook���� ����
alter table newbook rename to TB_newbook;

-- newbook ���̺� isbn �Ӽ��� �߰� (Ÿ�� varchar2(20))
alter table TB_newbook add isbn varchar2(20);

-- isbn �Ӽ��� number�� ����
alter table TB_newbook modify isbn number;

-- isbn �Ӽ����� iss�� ����
alter table TB_newbook rename column isbn to iss;

-- iss �Ӽ� ����
alter table TB_newbook drop column iss;

-- ��������
-- TB_newbook bookid�� �⺻Ű�� ����
alter table TB_newbook add primary key (bookid);

-- TB_newbook book�� �⺻Ű�� ����
alter table TB_newbook drop primary key;

-- TB_newbook bookid�� NOT NULL ���������� ����
alter table TB_newbook modify bookid not null;

-- TB_newbook ���̺��� neworders ���̺� �ܷ�Ű�� �������� ����
alter table neworders add constraint test_FK foreign key (bookid) references TB_newbook(bookid);

-- TB_newbook ���̺��� neworders ���̺� �ܷ�Ű�� �������� ����
alter table neworders drop constraint test_FK;

-- TB_newbook ���̺� ����
drop table TB_newbook;
-- newcustomer�� ���������� �ɷ��־ ������ �ȵ�
drop table newcustomer; -- �������� ���� Error
--delete from newcustomer where address like '%����%';
alter table neworders drop constraint SYS_C0011071;
drop table newcustomer;

-- ���̺� �Ӽ� �˻�
desc neworders;

select * from book;