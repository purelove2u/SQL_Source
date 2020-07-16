-- Fuction (판매한 도서에 대한 이익을 계산하는 함수)

select * from orders;

create or replace function fun_interest(
price number) return int
is
    myinterest number;
    begin
        --가격이 20000원 이상이면 10%, 20000원 이하면 5%
        if price >= 20000 then myinterest := price * 0.1;
        else myinterest := price * 0.05;
        end if;
        return myinterest;
    end;
/
    
select custid, orderid, saleprice, fun_interest(saleprice) interest from orders;
