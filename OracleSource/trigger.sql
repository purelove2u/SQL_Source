-- Ʈ����
-- ���ο� ������ ������ �� �ڵ����� book_log ���̺� ������ ������ ����ϴ� Ʈ����

-- Book_log ���̺� ����
create table Book_log(
bookid_l number,
bookname_l varchar(40),
publisher_l varchar(40),
price_l number);


create or replace trigger AfterInsertBook
after insert on book for each row -- insert���� �̿��Ͽ� book���̺� �����͸� ����
begin
insert into book_log
values(:new.bookid, :new.bookname, :new.publisher, :new.price);
dbms_output.put_line('���Ե� Ʃ���� Book_log ���̺� ��� �Ϸ��');
end;
/

set serveroutput on

insert into book values(11, '������������', '�̻� �̵��', 25000);
insert into book values(12, '������������2', '�̻� �̵��', 25000);

select * from book_log;

-- Book_delete ���̺� ����
create table Book_delete(
bookid_l number,
bookname_l varchar(40),
publisher_l varchar(40),
price_l number);


create or replace trigger AfterDeleteBook
after delete on book for each row -- delete���� �̿��Ͽ� book���̺� �����͸� ����
begin
insert into book_delete
values(:old.bookid, :old.bookname, :old.publisher, :old.price);
dbms_output.put_line('������ Ʃ���� Book_delete ���̺� ��� �Ϸ��');
end;
/
set serveroutput on

delete from book where bookid = 15;

select * from book_delete;

-- Book_update ���̺� ����
create table Book_update(
bookid_l number,
bookname_l varchar(40),
publisher_l varchar(40),
price_l number);


create or replace trigger AfterUpdateBook
after update on book for each row -- delete���� �̿��Ͽ� book���̺� �����͸� ����
begin
insert into book_update
values(:old.bookid, :old.bookname, :old.publisher, :old.price);
dbms_output.put_line('������Ʈ ���� Ʃ���� Book_update ���̺� ��� �Ϸ��');
end;
/

update book set bookname = '������������1' where bookname = '������������';
select * from book;
select * from book_update;

-- ���� ���̺�
create table books(
    id integer primary key,
    name varchar(20) not null,
    writer varchar(20) not null,
    price number(10, 2) default 0,
    genre varchar(20) not null,
    publisher varchar(20) not null,
    cnt number(10, 0) default 0);


-- ��� ���̺�
create table books_bak(
    id integer primary key,
    name varchar(20) not null,
    writer varchar(20) not null,
    price number(10, 2) default 0,
    genre varchar(20) not null,
    publisher varchar(20) not null,
    cnt number(10, 0) default 0);

drop sequence books_seqid;
    
-- sequence ����
create sequence books_seqid
increment by 1;
-- start with 1
-- �̺κ��� �ɼ� ���û��� maxvalue 99999 cycle nocache;

-- sequence ����
alter sequence books_seqid increment by 10;


-- ������ �Է�
insert into books(id, name, writer, price, genre, publisher)
values(books_seqid.nextval, 'ȫ�浿��', '���', 300, '�Ҽ�', '��� ���ǻ�');

insert into books(id, name, writer, price, genre, publisher)
values(books_seqid.nextval, '���������', '���丣 ����', 900, '�Ҽ�', '���丣 ���ǻ�');

commit;

drop table books;
select * from books;

-- ���ν��� ���� ����
create or replace procedure pro_backup_book(
    book_id in books.id%type    -- books���̺��� id�� ���� �÷� Ÿ�� (�ܺο��� �޴� ��)
)
is  -- as �� ���� ����
-- Ŀ�� ����
    cursor csor is select id, name, writer, price, genre, publisher, cnt
    from books
    where id = book_id;
-- ����� ���� ����
    b_id books.id%type;     -- ���̺�.�÷�%type ( �ش� ���̺��� �÷� Ÿ�԰� �����ϰ� �����ϰڴ�)
    b_name books.name%type;
    b_writer books.writer%type;
    b_price books.price%type;
    b_genre books.genre%type;
    b_publisher books.publisher%type;
    b_cnt books.cnt%type;
begin
    open csor; --Ŀ�� ����
        loop --��������
        -- Ŀ������ ������ ���� ������ ������ ����(���� ��ġ)
            fetch csor
            into b_id, b_name, b_writer, b_price, b_genre, b_publisher, b_cnt;
            exit when csor%notfound;    --loop�� ���������� ����
                insert into books_bak(id, name, writer, price, genre, publisher, cnt)   --������̺� �Է�
                values(b_id, b_name, b_writer, b_price, b_genre, b_publisher, b_cnt);
            commit; --Ʈ����� �Ϸ�. Ŀ��
        end loop;   --���� ����
    close csor;     --Ŀ�� �ݱ�
end;
/

execute pro_backup_book(3);
select * from books;
select * from books_bak;



create or replace procedure update_proc(
b_bookid in number, -- in �Ű�����
b_bookname in varchar,
b_publisher in varchar,
b_price in number)
is
begin
    update book
    set bookid = b_bookid,
    bookname = b_bookname,
    publisher = b_publisher,
    price = b_price
    where bookid = b_bookid;
end;

/

exec update_proc(13, '�������� ���нø���', '�½�����', 30000);

select * from book order by bookid;
desc customer;


--delete procedure
create or replace procedure delete_proc(
b_bookid in number)
is
begin
    delete from book where bookid = b_bookid;
end;
/

exec delete_proc(13);

create or replace procedure delete_proc1(
c_custid in varchar)
is
begin
    delete from customer where custid = c_custid;
end;
/

exec delete_proc1(6);

select * from customer;
insert into customer values(6, '����ȯ', '���ѹα� ����', '010-1234-1234');
