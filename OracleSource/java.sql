create table userTBL(
    no number(4) constraint pk_userTBL primary key,
    username nvarchar2(4) not null,
    birthYear number(4) not null,
    addr nvarchar2(10) not null,
    mobile nvarchar2(20));

-- ������ �����ϱ�(auto_increment ����)
-- Ư�� ��Ģ�� ���缭 ���� ���ڸ� �����ϴ� ��ü
create sequence user_seq;

-- insert
insert into usertbl values(user_seq.nextval, 'ȫ�浿', 1955, '�����', '01012341234');

commit;
