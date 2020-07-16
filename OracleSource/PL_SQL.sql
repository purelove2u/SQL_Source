-- PL/SQL : 선언부(create...) / 실행부(Begin-End)

-- 선언부
create or replace procedure InsertBook(
mybookid in number,-- in 입력 매개변수라는 뜻
mybookname in varchar2,
mypublisher in varchar2,
myprice in number)
as
begin
insert into book(bookid,bookname,publisher,price)
values(mybookid,mybookname,mypublisher,myprice);
end;
/

EXEC InsertBook(13,'스포츠과학','마당과학서적',25000);

select * from book;


create or replace procedure bookinsertorupdate(
mybookid  number,
mybookname  varchar2,
mypublisher  varchar2,
myprice int)
as
 mycount number; -- 지역변수선언
begin
select count(*) into mycount from book
where bookname like mybookname; -- 같은 이름의 도서가 몇권인지 검색

    if mycount !=0 then -- 같은 도서가 있으면
        update book set price=myprice
        where bookname like mybookname;
    else
        insert into book(bookid,bookname,publisher,price)
        values(mybookid,mybookname,mypublisher,myprice);
    end if;
    
end;
/

-- 신규도서 입력
EXEC bookinsertorupdate(15,'스포츠 즐거움','마당과학서적',25000);
select * from book;
-- 가격이 업데이트
EXEC bookinsertorupdate(15,'스포츠 즐거움','마당과학서적',20000);
select * from book;

-- Book 테이블에 저장된 도서의 평균가격을 반환하는 프로시저(AveragePrice)
create or replace procedure AveragePrice1(
AverageVal out number) -- out : 출력 매개변수의 의미
as
begin
select round(avg(price),2) into AverageVal from book where price is not null;
end;
/

-- 프로시저 실행
-- DBMS_OUTPUT.PUT_LINE : 출력 명령어
SET SERVEROUTPUT ON;
DECLARE
AverageVal NUMBER; 
begin
AveragePrice1(AverageVal);
DBMS_OUTPUT.PUT_LINE('도서의 평균가격 : ' || AverageVal);
end;

-- CURSOR : 커서를 생성(작업 영역 설정)
-- OPEN : 커서의 사용를 시작
-- FETCH : 행 데이터 가져옴
-- CLOSE : 커서의 사용을 끝냄

-- 커서를 사용한 전체이익금액을 반환하는 프로시져 (Interest)
create or replace procedure Interest
as
 myInterest NUMERIC; -- 지역변수
 price NUMERIC; -- 지역변수
 CURSOR interestCURSOR is select saleprice from orders; -- 커서 변수 선언
begin
 myInterest :=0.0;
 open interestCURSOR; 
     loop
       fetch interestCURSOR into price; 
       exit when interestCURSOR%notfound; 
            if price >= 20000 then
              myinterest :=myinterest+price*0.1;
            else
              myinterest :=myinterest+price*0.05;
            end if;
     end loop; 
 close interestCURSOR; 
 DBMS_OUTPUT.PUT_LINE('전체 이익 금액 : ' || myinterest); 
end;
/

SET SERVEROUTPUT ON;
exec interest;
















