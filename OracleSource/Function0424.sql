-- Fuction (�Ǹ��� ������ ���� ������ ����ϴ� �Լ�)

select * from orders;

create or replace function fun_interest(
price number) return int
is
    myinterest number;
    begin
        --������ 20000�� �̻��̸� 10%, 20000�� ���ϸ� 5%
        if price >= 20000 then myinterest := price * 0.1;
        else myinterest := price * 0.05;
        end if;
        return myinterest;
    end;
/
    
select custid, orderid, saleprice, fun_interest(saleprice) interest from orders;
