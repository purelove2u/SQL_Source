--'삼성당'에서 출판한 도서를 삭제하시오
delete from book where publisher like '삼성당';

-- 출판사 '대한미디어'를 '대한출판사'로 변경하시오
update book set publisher = '대한출판사' where publisher = '대한미디어';

--테이블 이름 : bookcompany
create table bookcompany(
    name varchar(20) primary key,
    address varchar(20),
    begin date);
    
select * from bookcompany;
drop table bookcompany;

-- webaddress varchar(30) 추가
alter table bookcompany add webaddress varchar(30);

insert into bookcompany values ('한빛 아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');

-- 컬럼명 변경(rename column) name -> company
alter table bookcompany rename column name to company;

-- 타입 수정(modify) company VARCHAR(30)
alter table bookcompany modify company varchar(30);

-- 컬럼 삭제(drop column) -> company
alter table bookcompany drop column company;

-- 제약조건 삭제(drop) PRIMARY KEY
alter table bookcompany drop primary key;

alter table bookcompany add company varchar(30);

-- 제약조건 추가(add) primary key(company)
alter table bookcompany add primary key(company);

create table newbook(
    bookid      number primary key,
    bookname    varchar2(20),
    publisher   varchar2(20),
    price       number default 10000 check (price > 1000));
    
create table newcustomer(
    custid      number primary key,
    name        varchar2(40),
    address     varchar2(40),
    phone       varchar2(30));
    
create table neworders(
    orderid     number,
    custid      number not null,
    bookid      number not null,
    saleprice   number,
    orderdate   date,
    primary key (orderid),
    foreign key (custid) references newcustomer(custid) on delete cascade);
    
create sequence seq_testtable
start with 1
increment by 1
maxvalue 99999 cycle nocache;

insert into newbook values(seq_testtable.nextval, '축구', '대한미디어', 25000);
insert into newbook values(seq_testtable.nextval, '야구', '이상미디어', 28000);
insert into newbook values(seq_testtable.nextval, '농구', '대한미디어', 20000);

select * from newbook;

--newbook 테이블을 TB_newbook으로 변경
alter table newbook rename to TB_newbook;

-- newbook 테이블에 isbn 속성을 추가 (타입 varchar2(20))
alter table TB_newbook add isbn varchar2(20);

-- isbn 속성을 number로 변경
alter table TB_newbook modify isbn number;

-- isbn 속성명을 iss로 변경
alter table TB_newbook rename column isbn to iss;

-- iss 속성 삭제
alter table TB_newbook drop column iss;

-- 제약조건
-- TB_newbook bookid를 기본키로 설정
alter table TB_newbook add primary key (bookid);

-- TB_newbook book의 기본키를 제거
alter table TB_newbook drop primary key;

-- TB_newbook bookid에 NOT NULL 제약조건을 적용
alter table TB_newbook modify bookid not null;

-- TB_newbook 테이블을 neworders 테이블에 외래키로 참조조건 설정
alter table neworders add constraint test_FK foreign key (bookid) references TB_newbook(bookid);

-- TB_newbook 테이블을 neworders 테이블에 외래키로 참조조건 제거
alter table neworders drop constraint test_FK;

-- TB_newbook 테이블 삭제
drop table TB_newbook;
-- newcustomer는 제약조건이 걸려있어서 삭제가 안됨
drop table newcustomer; -- 제약조건 위배 Error
--delete from newcustomer where address like '%서울%';
alter table neworders drop constraint SYS_C0011071;
drop table newcustomer;

-- 테이블 속성 검색
desc neworders;

select * from book;