insert into book values (11, '������ ����', '�Ѽ����м���', 90000);

-- book ���̺� ���ο� ���� '������ ����'�� ���� ���ǻ�� ������м���
create SEQUENCE user_seq;
insert into book(bookid, bookname, publisher) values (14, '������ ����', '������м���');

-- insert �ǽ��� ���Ǵ� Imported_book ���̺�
alter table Imported_book modify publisher varchar(40);
alter table Imported_book modify price number(8);

insert into imported_book values(21, 'Zen Golf', 'Pearson', 12000);
insert into imported_book values(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- �뷮�� �����͸� �Ѳ����� Ʃ�ÿ� ����(Imported_book -> book)
select * from imported_book;
select * from book order by bookid asc;
insert into book(booid, bookname) select bookid, bookname from imported_book; -- 2���� �̾Ƽ� ��������
insert into book select * from imported_book; -- �ٰ�������
select * from book order by bookid asc;

-- UPDATE
-- customer ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� ����
select * from customer;
update customer set address = '���ѹα� �λ�' where custid = 5;

select address from customer where name = '�迬��';
-- �ڼ����� �ּҸ� �迬���� �ּҿ� �����ϰ� ����
update customer set address = (select address from customer where name = '�迬��') where name = '�ڼ���';

