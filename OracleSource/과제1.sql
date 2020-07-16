-- ��� ������Ʈ : �����ͺ��̽��� madang
-- Relation(table) : Employee ��� / Department �μ� / Project ������Ʈ / Works ���
-- �� ����� ���� ������Ʈ�� ������ �� ������ �� ������Ʈ�� ���� �ο� ���� ������ ����.

-- Department (deptno(pk), deptname, manager)
-- Employee (empno(pk), name, phoneno, address, sex, position, deptno)
-- Project (projno(pk), projname, deptno)
-- Works ( empno(pk), projno(pk), hours-worked)

-- ��������
-- Employee ���̺��� Department ���̺�� ��������
-- Project ���̺��� Department ���̺�� ��������
-- Works ���̺��� Project ���̺�� Employee ���̺�� ��������
drop table department;
create table Department(
    deptno number not null primary key,
    deptname varchar(20),
    manager varchar(20));
        
create table Employee(
    empno number not null primary key,
    name varchar(20),
    phoneno number,
    address varchar(20),
    sex varchar(20),
    position varchar(20),
    deptno number,
    foreign key (deptno) references Department(deptno));
    
create table Project(
    projno number not null primary key,
    projname varchar(20),
    deptno number,
    foreign key (deptno) references Department(deptno));

alter table project modify projname varchar(40);
    
create table Works(
    empno number not null,
    projno number not null,
    hours_worked number,
    primary key(empno, projno),
    foreign key(empno) references employee(empno),
    foreign key(projno) references project(projno));

insert into department values (1, 'IT', '����');
insert into department values (2, 'Marketing', 'ȫ�浿');
select * from department;

insert into employee values (1, '�����', 01012341232, '����', '��', 'Programmer', 1);
insert into employee values (2, '�̼���', 01012323122, '����', '��', 'Programmer', 1);
insert into employee values (3, '�ڿ���', 01076851231, '����', '��', 'Salesperson', 2);
insert into employee values (4, 'ȫ�浿', 01012341546, '����', '��', 'Manager', 2);
insert into employee values (5, '����', 01012311112, '����', '��', 'Manager', 1);
select * from employee;

insert into project values (1, '�����ͺ��̽�����', 1);
insert into project values (2, '��������', 2);
select * from project;

insert into works values (1, 1, 3);
insert into works values (2, 1, 1);
insert into works values (3, 2, 1);
insert into works values (4, 2, 5);
insert into works values (5, 1, 1);
select * from works;
delete from works;

-- ��� ����� �̸��� �˻�
select name from employee;
-- ���� ����� �̸��� ��� �˻�
select name from employee where sex = '��';
select name from employee where sex like '��';
-- ����(manager)�� �̸��� �˻�
select name from employee where position = 'Manager';
-- ����(manager)�� �̸��� �ش��� empno�� �˻�
select empno from employee where name In (select manager from department);
-- IT�μ����� ���ϴ� ����� �̸��� �ּ�
select name, address from employee where deptno = 1;
select name, address from employee e, department d where d.deptname like 'IT'; --��, �� ���̺��� join�Ǿ� �־����.
select name, address from employee e, department d where e.deptno = d.deptno;

-- ȫ�浿 ����μ����� ���ϴ� ����� ��(count)
-- 1. IN
-- ȫ�浿 ������ �μ���ȣ
-- dept IN (select .....)
select deptno from department where manager = 'ȫ�浿';
select count(name) || '��' from employee where deptno in (select deptno from department where manager = 'ȫ�浿');

-- 2. JOIN
select * from employee where employee.deptno = (select deptno from department where manager = 'ȫ�浿');
select count(name) || '��' from employee where employee.deptno = (select deptno from department where manager = 'ȫ�浿');
-- select count(*) from department d, employee e where e.deptno like manager 'ȫ�浿';


-- �μ���ȣ�� �μ��� ������� ���� �ð��� �� (��, �μ��� ��������)
select deptno, sum(hours_worked) as �ѱٹ��ð� 
from employee em, works wk 
where em.empno = wk.empno 
group by deptno 
order by deptno;

-- (�� �� �̻��� ����� ������) ������Ʈ�� ������Ʈ ��ȣ, ������Ʈ �̸�, ����� ��
-- ����
select projno, projname, count(*) || '��' 
from employee e, project p 
where e.deptno = p.projno 
group by projno, projname;

-- ����
select projno, projname, count(name)
from employee, project
where project.deptno = employee.deptno
group by projno, projname
having count(*) >= 3; -- 3�� �̻�


