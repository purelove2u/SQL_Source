select * from book;

create index ix_book on book(bookname);
create index ix_book2 on book(publisher, price);

select * from book
where publisher = '�������ǻ�' and price >= 30000;

select * from book
where bookname = '�౸�� ����';

--����ȭ�� �����ϴ� �۾�
alter index ix_book rebuild;

--�ε��� ����
drop index ix_book;

--�ڼ��� ���� �����̵�
select custid from customer where name like '�ڼ���';

--customer���� name�� �ε����� ����(cust_idx)
create index cust_idx on customer(name);
drop index cust_idx;

