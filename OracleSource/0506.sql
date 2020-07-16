-- ���� (�����ȣ, �����̸�, ��ġ)
-- �󿵰� (�����ȣ, �󿵰���ȣ, ��ȭ����, ����, �¼���)
-- ���� (�����ȣ, �󿵰���ȣ, ����ȣ, �¼���ȣ, ��¥)
-- �� (����ȣ, �̸�, �ּ�)

create table ����(
    �����ȣ number not null primary key,
    �����̸� nvarchar2(20),
    ��ġ nvarchar2(20));
    
create table �󿵰�(
    �����ȣ number not null,   -- ���⼭ references ����(�����ȣ) �ص� �ǰ� �ؿ��� foreign key �ص� ��
    �󿵰���ȣ number not null primary key,
    ��ȭ���� nvarchar2(20),
    ���� number,
    �¼��� number,
    foreign key(�����ȣ) references ����(�����ȣ));
    
alter table �󿵰� add constraint �󿵰�_fk foreign key(�����ȣ) REFERENCES ����(�����ȣ);

alter table �󿵰� drop constraint �󿵰�_fk;

    
create table ��(
    ����ȣ number not null primary key,
    �̸� nvarchar2(20),
    �ּ� nvarchar2(20));
    
create table ����(
    �����ȣ number not null, -- REFERENCES ����(�����ȣ),
    �󿵰���ȣ number not null, -- REFERENCES �󿵰�(�󿵰���ȣ),
    ����ȣ number not null, -- REFERENCES ��(����ȣ),
    �¼���ȣ number not null primary key,
    ��¥ date,
    foreign key(�����ȣ) REFERENCES ����(�����ȣ),
    foreign key(�󿵰���ȣ) REFERENCES �󿵰�(�󿵰���ȣ),
    foreign key(����ȣ) REFERENCES ��(����ȣ));


insert into ���� values(1, '����', '����');
insert into ���� values(2, '��Ƽ', '����');
insert into ���� values(3, '��Ƽ', '���');
insert into ���� values(4, 'CGV', '����� ������');
insert into ���� values(5, '�ް��ڽ�', '����� ������');

select * from ����;

insert into �󿵰� values(1, 1, '�ż���', 9000, 35);
insert into �󿵰� values(1, 2, '����ȣ��', 9000, 40);
insert into �󿵰� values(3, 3, '���극��', 9000, 10);
insert into �󿵰� values(3, 4, '������ ����', 7000, 50);
insert into �󿵰� values(3, 5, '�Ű� �Բ�', 7500, 20);

select * from �󿵰�;

insert into �� values(1, '�����', '����� ������');
insert into �� values(2, 'ȫ�浿', '����� ������');
insert into �� values(3, '������', '����� ������');
insert into �� values(4, '����ȣ', '����� ������');
insert into �� values(5, '������', '����� ������');

select * from ��;

insert into ���� values(1, 1, 1, 30, to_date('2019-10-15', 'yyyy-mm-dd'));
insert into ���� values(2, 1, 2, 25, to_date('2019-10-15', 'yyyy-mm-dd'));
insert into ���� values(3, 1, 3, 35, to_date('2019-10-17', 'yyyy-mm-dd'));
insert into ���� values(4, 2, 4, 20, to_date('2020-09-01', 'yyyy-mm-dd'));

insert into ���� values(4, 2, 4, 10, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into ���� values(1, 3, 2, 40, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into ���� values(3, 1, 2, 45, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into ���� values(2, 2, 1, 50, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into ���� values(2, 3, 1, 55, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into ���� values(1, 2, 4, 15, to_date('2020-09-01', 'yyyy-mm-dd'));


select * from ����;

-- <�ܼ�����>
-- 1. ��� ������ �̸��� ��ġ �˻�
select �����̸�, ��ġ from ����;
-- 2. '���'�� �ִ� �������� �˻�
select * from ���� where ��ġ LIKE '���';
-- 3. '����� ������'�� ��� ���� ������ ���̵� �̸��� ��������
select * from �� where �ּ� LIKE '����� ������' order by "�̸�";
-- 4. ������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ �˻�
select �����ȣ, �󿵰���ȣ, ��ȭ����, ���� from �󿵰� where ���� <= 8000; 
-- 5. ���� ��ġ�� ���� �ּҰ� ���� ������ �˻�
select * from ��, ���� where ����.��ġ LIKE ��.�ּ�;

-- <��������>
-- 1. ������ ���� ���
select count(*) from ����;
-- 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
select avg(����) from �󿵰�;
-- 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���
select count(*) from ���� where ��¥ = to_date('2020-09-01', 'yyyy-mm-dd');
-- ���� ���� �̸����� ����� ���� ������ �̷��� ��� ����
select count(�̸�) from ��, ���� where ����.����ȣ = ��.����ȣ and ��¥ like to_date('2020-09-01', 'yyyy-mm-dd');

-- <�μ����ǿ� ����>
-- 1. ���� ���忡�� �󿵵� ��ȭ������ ���(�������� ���)
select ��ȭ���� from �󿵰� inner join ���� on �󿵰�.�����ȣ = ����.�����ȣ where ����.�����̸� = '����';
--
select ��ȭ���� from �󿵰�, ���� where ����.�����ȣ = �󿵰�.�����ȣ and �����̸� like '����';

-- 2. ���� ���忡�� ��ȭ�� �� ���� �̸��� ���(�������� ���)
select �̸� 
    from �� 
    inner join ���� 
    on ��.����ȣ like (select ����.����ȣ from ���� inner join ���� on ����.�����ȣ = ����.�����ȣ where �����̸� = '����'); 
--
select ��.�̸�
    from ����, ����, ��
    where ����.�����ȣ = ����.�����ȣ and ����.����ȣ = ��.����ȣ
        and �����̸� like '����';

-- 3. ���ѱ����� ��ü ����
select sum(�󿵰�.����)
    from �󿵰�, ����
    where �󿵰�.�����ȣ = ����.�����ȣ
        and �����̸� like '����';
        
-- <�׷�����>
-- 1. ���庰 �󿵰� ���� ���̽ÿ�
select �����ȣ, count(�����ȣ) from �󿵰� group by "�����ȣ";

-- 2. '���'�� �ִ� �����̸��� ���̽ÿ�
select �����̸� from ���� where ��ġ = '���';
--
select �����̸� from ����, �󿵰�
    where ����.�����ȣ = �󿵰�.�����ȣ and ��ġ like '���';

-- 3. 2020�� 9�� 1�Ͽ� ���庰 ���� ���� ���� ���̽ÿ�.
/* select avg(����.����ȣ)
    from ����, �󿵰�, ����
    where ����.�����ȣ = �󿵰�.�����ȣ and �󿵰�.�����ȣ = ����.�����ȣ
    group by ����.�����ȣ; */
--
select �����ȣ, count(*)
from ����
where ��¥ like to_date('2020-09-01', 'yyyy-mm-dd')
group by "�����ȣ";

-- 4. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ������ ���̽ÿ�.
select ��ȭ����
    from �󿵰�, ����
    where �󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ and ��¥ like to_date('2020-09-01', 'yyyy-mm-dd')
    group by ��ȭ����
    having count(*) in
    (select max(count(*))
        from �󿵰�, ����
        where �󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ and ��¥ like to_date('2020-09-01', 'yyyy-mm-dd')
        group by ��ȭ����);

select ��ȭ����, count(�󿵰�.��ȭ����)        
    from �󿵰�, ����
    where �󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ and ��¥ like to_date('2020-09-01', 'yyyy-mm-dd')
    group by ��ȭ����
    order by count(�󿵰�.��ȭ����) desc;
