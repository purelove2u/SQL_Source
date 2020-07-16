create table userinfo(
id int primary key not null,
name varchar(20),
loginid varchar(20),
email varchar(20));

create table department(
id int primary key not null,
depart_nm varchar(20),
depart_tel varchar(20));

insert into userinfo values(1, '�迵��', 'kyl', 'kyl@naver.com');
insert into userinfo values(2, '����', 'khs', 'khs@gmail.com');
insert into userinfo values(3, '�ڼ�', 'bs', 'bs@daum.net');
insert into userinfo values(4, '�ְ�', 'chg', 'chg@naver.com');
insert into userinfo values(5, '�̹̿�', 'lmy', 'lmy@gmail.com');
select * from userinfo;

insert into department values(1, '��ȹ��', '02-111-2222');
insert into department values(2, '������', '02-222-3333');
insert into department values(3, '������', null);
insert into department values(4, null, null);
select * from department;
--------------------------------------------------------------------------
------------------inner join (=Natural Join)--------------------
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo inner join department on userinfo.id = department.id;

------------------inner join 2 ---------------------------------
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id = department.id;

------------------inner join 3 ---------------------------------
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id(+) = department.id;


------------------outer join -----------------------------------
--left outer join : ���� ���̺��� ������ ��µǸ� ������ ���̺� ������ �´� �����͵� ���
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo left outer join department on userinfo.id = department.id;

--left outer join 2
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id = department.id(+);

--right outer join : ������ ���̺��� ������ ��µǸ� ���� ���̺� ������ �´� �����͵� ���
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo right outer join department on userinfo.id = department.id;

--right outer join 2
select userinfo.id, userinfo.name, userinfo.email, department.depart_nm, department.depart_tel 
from userinfo, department where userinfo.id(+) = department.id;

