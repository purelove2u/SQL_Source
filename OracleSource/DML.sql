insert into book values (11, '스포츠 의학', '한솔의학서적', 90000);

-- book 테이블에 새로운 도서 '스포츠 과학'을 삽입 출판사는 대우의학서적
create SEQUENCE user_seq;
insert into book(bookid, bookname, publisher) values (14, '스포츠 과학', '대우의학서적');

-- insert 실습에 사용되는 Imported_book 테이블
alter table Imported_book modify publisher varchar(40);
alter table Imported_book modify price number(8);

insert into imported_book values(21, 'Zen Golf', 'Pearson', 12000);
insert into imported_book values(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- 대량의 데이터를 한꺼번에 튜플에 삽입(Imported_book -> book)
select * from imported_book;
select * from book order by bookid asc;
insert into book(booid, bookname) select bookid, bookname from imported_book; -- 2개만 뽑아서 가져오기
insert into book select * from imported_book; -- 다가져오기
select * from book order by bookid asc;

-- UPDATE
-- customer 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경
select * from customer;
update customer set address = '대한민국 부산' where custid = 5;

select address from customer where name = '김연아';
-- 박세리의 주소를 김연아의 주소와 동일하게 변경
update customer set address = (select address from customer where name = '김연아') where name = '박세리';

