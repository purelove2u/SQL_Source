-- 트리거
-- 새로운 도서를 삽입한 후 자동으로 book_log 테이블에 삽입한 내용을 기록하는 트리거

-- Book_log 테이블 생성
create table Book_log(
bookid_l number,
bookname_l varchar(40),
publisher_l varchar(40),
price_l number);


create or replace trigger AfterInsertBook
after insert on book for each row -- insert문을 이용하여 book테이블에 데이터를 삽입
begin
insert into book_log
values(:new.bookid, :new.bookname, :new.publisher, :new.price);
dbms_output.put_line('삽입된 튜플을 Book_log 테이블에 백업 완료됨');
end;
/

set serveroutput on

insert into book values(11, '스포츠마케팅', '이상 미디어', 25000);
insert into book values(12, '스포츠마케팅2', '이상 미디어', 25000);

select * from book_log;

-- Book_delete 테이블 생성
create table Book_delete(
bookid_l number,
bookname_l varchar(40),
publisher_l varchar(40),
price_l number);


create or replace trigger AfterDeleteBook
after delete on book for each row -- delete문을 이용하여 book테이블에 데이터를 삭제
begin
insert into book_delete
values(:old.bookid, :old.bookname, :old.publisher, :old.price);
dbms_output.put_line('삭제된 튜플을 Book_delete 테이블에 백업 완료됨');
end;
/
set serveroutput on

delete from book where bookid = 15;

select * from book_delete;

-- Book_update 테이블 생성
create table Book_update(
bookid_l number,
bookname_l varchar(40),
publisher_l varchar(40),
price_l number);


create or replace trigger AfterUpdateBook
after update on book for each row -- delete문을 이용하여 book테이블에 데이터를 삭제
begin
insert into book_update
values(:old.bookid, :old.bookname, :old.publisher, :old.price);
dbms_output.put_line('업데이트 이전 튜플을 Book_update 테이블에 백업 완료됨');
end;
/

update book set bookname = '스포츠마케팅1' where bookname = '스포츠마케팅';
select * from book;
select * from book_update;

-- 원본 테이블
create table books(
    id integer primary key,
    name varchar(20) not null,
    writer varchar(20) not null,
    price number(10, 2) default 0,
    genre varchar(20) not null,
    publisher varchar(20) not null,
    cnt number(10, 0) default 0);


-- 백업 테이블
create table books_bak(
    id integer primary key,
    name varchar(20) not null,
    writer varchar(20) not null,
    price number(10, 2) default 0,
    genre varchar(20) not null,
    publisher varchar(20) not null,
    cnt number(10, 0) default 0);

drop sequence books_seqid;
    
-- sequence 생성
create sequence books_seqid
increment by 1;
-- start with 1
-- 이부분은 옵션 선택사항 maxvalue 99999 cycle nocache;

-- sequence 수정
alter sequence books_seqid increment by 10;


-- 데이터 입력
insert into books(id, name, writer, price, genre, publisher)
values(books_seqid.nextval, '홍길동전', '허균', 300, '소설', '허균 출판사');

insert into books(id, name, writer, price, genre, publisher)
values(books_seqid.nextval, '레미제라블', '빅토르 위고', 900, '소설', '빅토르 출판사');

commit;

drop table books;
select * from books;

-- 프로시져 생성 시작
create or replace procedure pro_backup_book(
    book_id in books.id%type    -- books테이블의 id와 같은 컬럼 타입 (외부에서 받는 값)
)
is  -- as 와 같은 구문
-- 커서 선언
    cursor csor is select id, name, writer, price, genre, publisher, cnt
    from books
    where id = book_id;
-- 사용할 변수 선언
    b_id books.id%type;     -- 테이블.컬럼%type ( 해당 테이블의 컬럼 타입과 동일하게 선언하겠다)
    b_name books.name%type;
    b_writer books.writer%type;
    b_price books.price%type;
    b_genre books.genre%type;
    b_publisher books.publisher%type;
    b_cnt books.cnt%type;
begin
    open csor; --커서 열기
        loop --루프시작
        -- 커서에서 가져와 위에 선언한 변수에 삽입(갯수 일치)
            fetch csor
            into b_id, b_name, b_writer, b_price, b_genre, b_publisher, b_cnt;
            exit when csor%notfound;    --loop를 빠져나오는 조건
                insert into books_bak(id, name, writer, price, genre, publisher, cnt)   --백업테이블에 입력
                values(b_id, b_name, b_writer, b_price, b_genre, b_publisher, b_cnt);
            commit; --트랜잭션 완료. 커밋
        end loop;   --루프 종료
    close csor;     --커서 닫기
end;
/

execute pro_backup_book(3);
select * from books;
select * from books_bak;



create or replace procedure update_proc(
b_bookid in number, -- in 매개변수
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

exec update_proc(13, '스포츠의 과학시리즈', '굿스포츠', 30000);

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
insert into customer values(6, '박태환', '대한민국 서울', '010-1234-1234');
