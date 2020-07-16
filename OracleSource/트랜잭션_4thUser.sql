set TRANSACTION isolation level read COMMITTED;

select sum(price) 총액 from madang.book;

insert into madang.book values (13, '테스트', '테스트출판사', 5500);














select * from madang.book;
