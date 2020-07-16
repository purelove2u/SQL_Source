select * from emp;
desc emp;

create or replace function salary_increase(
sal number) return int
is
    mysal number;
    begin
        if sal >= 2000 then mysal := sal * 1.05;
        else mysal := sal * 1.03;
        end if;
        return mysal;
    end;
/
drop function salary_increase;
select empno, ename, job, sal, salary_increase(sal) mysal from emp;
