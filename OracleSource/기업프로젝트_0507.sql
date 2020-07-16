/* ��� ������Ʈ �����ͺ��̽� */
/* Employee�� ���, Department�� �μ�, Project�� ������Ʈ ����, 
Works�� ����� ������Ʈ�� ������ ������ ��Ÿ����.
�� ����� ���� ������Ʈ���� ���� �� �ְ�, �� ������Ʈ���� ���� ����� ���� �� �ִ�. 
hours-worked �Ӽ��� �� ����� �� ������Ʈ���� ���� �ð� ���� ��Ÿ����.*/

/* Department(deptno, deptname, manager)
   Employee(empno, name, phoneno, address, sex, position, deptno)
   Project(projno, projname, deptno)
   Works(empno, projno, hours-worked) */
/* (1) �� �����̼ǿ��� �⺻Ű�� ���Ͻÿ�.
�� Department: deptno
�� Employee: empno
�� Project: projno
�� Work: empno, projno
(2) �����̼� ���� ���踦 ���캸�� �ܷ�Ű�� ã�ƺ��ÿ�.
�� Employee : deptno
�� Project : deptno
�� Works : (empno, projno) */

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
    


---------------------------------------------------------------------------------------------------
create table ȣ��(
    �̸� nvarchar2(20) not null,
    �ּ� nvarchar2(30) not null,
    ���� nvarchar2(10),
    ���� number,
    ����_�� number,
    primary key(�ּ�));
    
create table ������(
    ���̸� nvarchar2(20) not null,
    ���ּ� nvarchar2(30),
    ��_��ȭ��ȣ nvarchar2(10) not null,
    primary key(���̸�));
    
create table ���ڿ���(
    ȣ���ּ� nvarchar2(30) not null,
    ���̸� nvarchar2(20) not null,
    �������� number,
    ����� date,
    ������ date,
    ������ date,
    foreign key(ȣ���ּ�) references ȣ��(�ּ�),
    foreign key(���̸�) references ������(���̸�));
    
create table ����(
    ���̸� nvarchar2(20) not null,
    �ּ� nvarchar2(30) not null,
    ���������� date,
    ��������� date,
    ���ޱ� number,
    ���ҹ�� nvarchar2(10),
    foreign key(���̸�) references ������(���̸�),
    foreign key(�ּ�) references ȣ��(�ּ�));
    



























    