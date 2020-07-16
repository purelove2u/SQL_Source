--1) ER ���̾�׷��� �̿��Ͽ� �����ͺ��̽��� ���� �𵨸��� �����Ͻÿ�(���� ������Ʈ)

--2) ER ���̾�׷��� �̿��Ͽ� �⺻Ű�� ���� ���������� �ϼ��Ͻÿ�

--3) ER���̾�׷����� ������ �𵨸��� DDL�� ��ȯ�Ͻÿ�(���� ������Ʈ)

--4) TableSpace �����Ͽ� �������� ����Ҹ� �����Ͻÿ�
--(��δ� D:\ORADATE, ���ϸ��� sample, �뷮�� 10M�� �����Ͻÿ�)
create tablespace md_admin
datafile 'd:\oradate\sample.dbf'
size 10M;

--5) ������ ������ ����Ҹ� ADMIN������ �����Ͽ� �Ҵ��Ͻÿ�.
create user ADMIN IDENTIFIED by admin
default tablespace md_admin;

--6) Department���̺�, Employee���̺�, Project���̺� Works���̺� �����Ͻÿ�
create table department2(
    deptno number not null,
    deptname nvarchar2(20) not null,
    manager nvarchar2(20),
    primary key(deptno));
    
create table employee2(
    empno number not null,
    name nvarchar2(20),
    phoneno nvarchar2(10),
    address nvarchar2(30),
    sex nvarchar2(4),
    position nvarchar2(10),
    deptno number references department2(deptno),
    primary key(empno));
    
create table project2(
    projno number not null,
    projname nvarchar2(20),
    deptno number references department2(deptno),
    primary key(projno));
    
create table works2(
    empno number not null references employee2(empno),
    projno number not null references project2(projno),
    primary key(empno, projno));

--7) ��� ���̺��� �������ΰ� �ܺ������� �����ϵ��� �����Ͻÿ� 
ALTER TABLE department2 ADD CONSTRAINT deptno_pk PRIMARY KEY ( deptno );
ALTER TABLE employee2 ADD CONSTRAINT empno_pk PRIMARY KEY ( empno );
ALTER TABLE project2 ADD CONSTRAINT projno_pk PRIMARY KEY ( projno );
ALTER TABLE works2 ADD CONSTRAINT empno_pk PRIMARY KEY ( empno );
ALTER TABLE works2 ADD CONSTRAINT projno_pk PRIMARY KEY ( projno );

ALTER TABLE employee2
    ADD CONSTRAINT emp_fk FOREIGN KEY ( deptno )
        REFERENCES department2 ( deptno );
ALTER TABLE works2
    ADD CONSTRAINT emp_fk FOREIGN KEY ( empno )
        REFERENCES employee2 ( emptno );
ALTER TABLE works2
    ADD CONSTRAINT proj_fk FOREIGN KEY ( projno )
        REFERENCES project2 ( projno );
        
--8) book���̺� ���� ������Ʈ ���ν����� �����Ͻÿ�(���ν��� �� : BookInsertOrUpdate)
create or replace procedure bookinsertorupdate(
mybookid  number,
mybookname  varchar2,
mypublisher  varchar2,
myprice int)
as
 mycount number;    -- �������� ����
begin
select count(*) into mycount from book
where bookname like mybookname;     --���� �̸��� ������ �� ������ �˻�

    if mycount !=0 then     -- ���� ������ ������
        update book set price=myprice
        where bookname like mybookname;
    else
        insert into book(bookid,bookname,publisher,price)
        values(mybookid,mybookname,mypublisher,myprice);
    end if;
end;
/

--9) ������ ���� ���ν����� ������ �ľ��ϱ� ���Ͽ� ���������Ʈ�� ���� ������ ���Ǹ� ���� �Ͻÿ� (�μ����ǿ� ����, ����� ��� �ʼ�)
--    (�μ����ǿ� ����, ����� ��� �ʼ�)

--	- ��� ����� �̸��� ���̽ÿ�.
select name from employee;

--	- ���� ����� �̸��� ���̽ÿ�.
select name from employee where sex like '��';

--	- ����(manager)�� �̸��� �ش��ϴ� empno�� ���̽ÿ�
select empno
from employee
where name In (select manager from department);

--	- ��IT�� �μ����� ���ϴ� ����� �̸��� �ּҸ� ���̽ÿ�.
select name, address
from employee e, department d
where e.deptno = d.deptno and deptname like 'IT';

--	- ��ȫ�浿�� ����(manager) �μ����� ���ϴ� ����� ���� ���̽ÿ�.
select count(deptno)
from employee e
where  e.deptno 
in (select deptno from department where manager like 'ȫ�浿');

--	- �μ���ȣ�� �μ��� ������� ���� �ð� ���� ���̽ÿ�(��, �μ�����  ��������).
select deptno as �μ���ȣ, sum(hours_worked) as �ѱٹ��ð�
from employee em, works wk
where em.empno = wk.empno
group by deptno
order by deptno;

--	- �� �� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸�, ����� ���� ���̽ÿ�.
SELECT Project.projno, Project.projname, count(name) �����
FROM Employee, Project
WHERE Project.deptno=Employee.deptno
GROUP BY Project.projno, Project.projname
HAVING COUNT(*) >= 2; 

--	- �� �� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�.
SELECT name
	FROM Employee, Department
	WHERE Employee.deptno=Department.deptno and 
		deptname = (SELECT deptname FROM Employee, Department 
			WHERE Employee.deptno=Department.deptno 
			GROUP BY deptname
			HAVING COUNT(name) >= 3);
            
--10) ADMIN �������� ���� ���� �ο��Ͻÿ�
-- SELECT, UPDATE, INSERT, CONNECT, RESOURCE, ��� ���̺� ����
grant select, update, insert, connect, resource to admin;
grant create any table to admin;

-- MADANG �����ͺ��̽��� Order ���̺��� ��� ����ڰ� SELECT �Ҽ� �ֵ��� ������ �ο��Ͻÿ�
grant select on madang.order to public;




