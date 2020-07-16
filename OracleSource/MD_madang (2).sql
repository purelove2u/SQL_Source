select * from book;

create index ix_book on book(bookname);
create index ix_book2 on book(publisher, price);

select * from book
where publisher = '대한출판사' and price >= 30000;

select * from book
where bookname = '축구의 역사';

--단편화를 정리하는 작업
alter index ix_book rebuild;

--인덱스 삭제
drop index ix_book;

--박세리 고객의 고객아이디
select custid from customer where name like '박세리';

--customer에서 name을 인덱스로 구현(cust_idx)
create index cust_idx on customer(name);
drop index cust_idx;

