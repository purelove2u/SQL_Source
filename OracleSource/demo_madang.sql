create table book(
bookid number(2) not null primary key,
bookname varchar2(40),
publisher varchar2(40),
price number(9));

drop table book;

create table customer(
custid number(2) not null primary key,
name varchar2(40),
address varchar2(50),
phone varchar2(20));

drop table book;

create table orders(
orderid number(2) primary key,
custid number(2) references customer(custid),
bookid number(2) references book(booid),
saleprice number(8),
orderdate date);

create table imported_book(
bookid number(2),
bookname varchar2(40),
publisher varchar2(4),
price number(2));

-- Book, Customer, Orders ������ ����
INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO Book VALUES(6, '���� �ܰ躰���', '�½�����', 6000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�̱� Ŭ��������', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����',  NULL);

-- �ֹ�(Orders) ���̺��� å���� ���� �ǸŸ� ������
INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2014-07-01','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2014-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2014-07-03','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2014-07-04','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2014-07-05','yyyy-mm-dd'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2014-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE( '2014-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2014-07-08','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2014-07-09','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2014-07-10','yyyy-mm-dd'));

select * from customer;
select * from book;
select * from orders;
