6.
 CREATE OR REPLACE PROCEDURE InsertBook(
     myBookID IN NUMBER, -- IN은 입력 매개변수라는 뚯
     myBookName IN VARCHAR2,
     myPublisher IN VARCHAR2,
     myPrice IN NUMBER)
 AS
 BEGIN
      INSERT INTO Book(bookid, bookname, publisher, price)
      VALUES(myBookID, myBookName, myPublisher, myPrice);
 END;
/


7.
 CREATE OR REPLACE PROCEDURE Interest
 AS
    myInterest NUMERIC; --지역변수
    Price NUMERIC; --지역변수
    CURSOR InterestCursor IS SELECT saleprice FROM Orders; --커서변수선언
 BEGIN
   myInterest := 0.0;
   OPEN InterestCursor; --커서 사용을 알림
   LOOP
       FETCH InterestCursor INTO Price; --다음 튜풀을 가져오는 fetch
       EXIT WHEN InterestCursor%NOTFOUND;
       IF Price >= 30000 THEN
           myInterest := myInterest + Price * 0.1; --이익금을 계산하여 myinsertrest에 저장
       ELSE
           myInterest := myInterest + Price * 0.05;
       END IF; --if 끝냄
    END LOOP; --반복 끝냄
    CLOSE InterestCursor; --커서사용 끝냄
    DBMS_OUTPUT.PUT_LINE(' 전체 이익 금액 = ' || myInterest); --결과값 출력
 END;
 /


8.
 CREATE OR REPLACE PROCEDURE AveragePrice(
    AverageVal OUT NUMBER) –out은 출력 매개변수라는 의미
 AS
 BEGIN
    SELECT AVG(price) INTO AverageVal FROM Book WHERE price IS NOT
 NULL; --평균계산 into는 변수에 값을 저장할때 사용
 END;
 /
--------------------------------------------------------------------------------------------
   /* 프로시저 AveragePrice를 테스트하는 부분 */
   SET SERVEROUTPUT ON ;
   DECLARE
     AverageVal NUMBER;
   BEGIN
      AveragePrice(AverageVal);
     DBMS_OUTPUT.PUT_LINE('책값 평균: '|| AverageVal);
  END;


9.
CREATE OR REPLACE TRIGGER AfterInsertBook
AFTER INSERT ON Book FOR EACH ROW 
 -- insert문을 이용하여 book테이블에 트리거 자동 생성 
     DECLARE
         average NUMBER;
     BEGIN
        INSERT INTO Book_log  –book에 삽입된 트리거를 Book_log에 저장 
VALUES(:new.bookid, :new.bookname, :new.publisher, :new.price); 
     -- :new는 새로 삽입될 튜플
        DBMS_OUTPUT.PUT_LINE('삽입 투플을 Book_log 테이블에 백업..');
     END;


10.
CREATE OR REPLACE FUNCTION fun_increased(
pay number) RETURN int
is
 myincreased number;
 begin
 -- 급여가 2000 이상이면 5%, 2000원 이하면 3%
     if pay >=2000 then myincreased :=pay*0.05;
     else myincreased :=pay*0.03;
     end if;
     RETURN myincreased;
 end;

