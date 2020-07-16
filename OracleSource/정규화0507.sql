create table summer(
    sid     number,
    class   varchar2(20),
    price   number);
    
insert into summer values (100, 'Java', 20000);
insert into summer values (150, 'Python', 15000);
insert into summer values (200, 'C++', 25000);
insert into summer values (250, 'Java', 20000);

select * from summer;
select sid, class from summer;
select price from summer where class = 'C++';

select distinct class 
from summer
where price in (select max(price) from summer);

select count(*), sum(price) from summer;

-- �����̻�����
select price "C++������" from summer where class = 'C++';

/* 200�� �л��� ���� ��� */
delete from summer
where sid = 200;

select price "C++������" from summer where class = 'C++';

-- �����̻�
/* JAVA ���� ���� */
insert into summer values (null, 'java', 25000);

select count(*) "�����ο�" from summer;
select count(sid) "�����ο�" from summer;
select count(*) "�����ο�" from summer where sid is not null;

-- �����̻�����
select * from summer;

update summer set price = 15000 where class = 'Java'; -- ����
update summer set price = 20000 where class = 'Java' and sid = 100; --���� �Ϳ� ���� ������ �޶����� ��Ȳ

select price "Java ������" from summer where class = 'Java';

-- ������ �����б� �����ͺ��̽�
drop table summerprice;
drop table summerenroll;

create table summerclass(
    sid     number not null primary key,
    class   varchar2(20));

create table summerprice(
    sid     number not null references summerclass(sid),
    price   number);

insert into summerclass values (100, 'Java');
insert into summerclass values (150, 'Python');
insert into summerclass values (200, 'C++');
insert into summerclass values (250, 'Java');

insert into summerprice values (100, 20000);
insert into summerprice values (150, 15000);
insert into summerprice values (200, 25000);
insert into summerprice values (250, 20000);

select * from summerclass;
select * from summerprice;

-- ����
select price "C++ ������" from SummerPrice where class='C++';

/* 200�� �л��� ������� */
delete from Summerclass
where sid=200;

select price "C++ ������" from SummerPrice where class='C++';

-- ���� (NULL)
/* JAVA ���� ���� */
insert into SummerPrice VALUES('JAVA',25000);

/*�����ο� �˻�*/
SELECT count(*) "�����ο�"
from SummerPrice;

-- ����
select * from SummerPrice;

update SummerPrice
set price=15000
where class='JAVA';

select DISTINCT price "JAVA ������"
from SummerPrice
where class='JAVA';









-- �����̻�����
select price "C++������" from summerprice where class = 'C++';

/* 200�� �л��� ���� ��� */
delete from summer
where sid = 200;

select price "C++������" from summer where class = 'C++';

-- �����̻�
/* JAVA ���� ���� */
insert into summer values (null, 'java', 25000);

select count(*) "�����ο�" from summer;
select count(sid) "�����ο�" from summer;
select count(*) "�����ο�" from summer where sid is not null;

-- �����̻�����
select * from summer;

update summer set price = 15000 where class = 'Java'; -- ����
update summer set price = 20000 where class = 'Java' and sid = 100; --���� �Ϳ� ���� ������ �޶����� ��Ȳ

select price "Java ������" from summer where class = 'Java';
