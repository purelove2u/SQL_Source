-- ����ȭ �ǽ�
-- ��1����ȭ
drop table �����ֹ�;
create table �����ֹ�(
    �ֹ���ȣ number(30) primary key not null,
    �ֹ���¥ date,
    ȸ���̸� varchar(20),
    ȸ����ȣ varchar(10),
    ȸ���ּ� varchar(20),
    ��ȭ��ȣ varchar(20),
    ����_SNO number,
    ������ varchar(40),
    ���� number,
    �ܰ� number);

insert into �����ֹ� values(20190213123,to_date('2019-02-13','yyyy-mm-dd'),'lee','L-123','���� ������','010-3664-1234',9788123,'NoSQL�� ������ ������',1,25000);
insert into �����ֹ� values(20190509238,to_date('2019-05-09','yyyy-mm-dd'),'park','P-234','���� ������','010-5301-3456',97889234,'�����ͺ��̽� ���а� �ǽ�',1,27000);
insert into �����ֹ� values(20190509239,to_date('2019-05-09','yyyy-mm-dd'),'Park','P-234','���� ������','010-5301-3456',97889234,'JAVA for Beginner',2,18000);
insert into �����ֹ� values(20190721376,to_date('2019-07-21','yyyy-mm-dd'),'Kim','K-345','��⵵ ����','010-7341-2345',97889345,'�������� ���а� �ǽ�',5,24000);
insert into �����ֹ� values(20190729401,to_date('2019-07-29','yyyy-mm-dd'),'Nam','n-456','������ ����','010-9279-3456',97889234,'�����ͺ��̽� ���а� �ǽ�',1,27000);
insert into �����ֹ� values(20191005456,to_date('2019-10-05','yyyy-mm-dd'),'Park','P-234','���� ������','010-5301-3456',97889567,'����Ŭ ���α׷���',4,27000);

select * from �����ֹ�;

-- ��2����ȭ ����(�κ���������)
-- �ֹ�ȸ�� / �ֹ����� / �ֹ����� ���̺� ����
create table �ֹ�ȸ��(
    ȸ����ȣ number primary key not null,
    ȸ���̸� nvarchar2(20),
    ȸ���ּ� nvarchar2(40),
    ��ȭ��ȣ nvarchar2(20),
    �ֹ���ȣ number,
    �ֹ���¥ date);
    
create table �ֹ�����(
    �ֹ���ȣ number primary key not null,
    �ֹ���¥ date,
    ����_SNO number,
    ���� number,
    �ܰ� number);
    
create table �ֹ�����(
    ����_SNO number not null,
    ������ varchar(40),
    �ܰ� number);

-- ��3����ȭ ����(��������������)
-- �ֹ�ȸ�� / ȸ������ / �ֹ����� / �ֹ�����
create table �ֹ�ȸ��(
    ȸ����ȣ number references ȸ������(ȸ����ȣ),
    �ֹ���ȣ number references �ֹ�����(�ֹ���ȣ));
    
create table ȸ������(
    ȸ����ȣ number primary key not null,
    ȸ���̸� nvarchar2(20),
    ȸ���ּ� nvarchar2(40),
    ��ȭ��ȣ nvarchar2(20));
    
create table �ֹ�����(
    �ֹ���ȣ number primary key not null,
    �ֹ���¥ date,
    ����_SNO number references �ֹ�����(����_SNO),
    ���� number,
    �ܰ� number);
    
create table �ֹ�����(
    ����_SNO number not null primary key,
    ������ varchar(40),
    �ܰ� number);




