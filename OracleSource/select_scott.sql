select * from emp;
select * from bonus;
select * from dept;
select * from salgrade;

-- 30번 부서에 근무하는 모든 사원의 이름과 급여(emp)
select ename, sal from emp where deptno = 30;

-- 사원 번호와 이름, 현재 급여와 10% 인상된 급여(컬럼이름 인상된 급여)를 출력
-- 단, 사원번호순으로 오름차순
select empno, ename, sal, sal*(1.1) as "인상된 급여" from emp order by empno;

-- 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력
-- 열 이름 각각 MAX, MIN, SUM, AVG로 한다.(소숫점 이하는 반올림하여 정수로 출력)
 select MAX(sal) as MAX, MIN(sal) as MIN, sum(sal) as SUM, round(avg(sal), 0) as AVG    --'0' 소숫점 이하 절삭
 from emp;

-- 업무이름과 업무별로 동일한 업무를 하는 사원의 수를 출력
-- (열이름 '업무', '업무별 사원수')
select job as 업무, count(*) as "업무별 사원수" from emp group by job;

-- 평균급여가 가장 높은 부서의 번호를 출력(부속질의 활용)
select dept.deptno, avg(sal)
from emp, dept
where emp.deptno = dept.deptno
group by dept.deptno
having avg(sal) >= all(select avg(sal) from emp group by deptno);

-- sql 공통의 차집합 오라클에서는(-)
select dept.deptno
    from dept
    except
        select dept.deptno
        from dept, emp
        where dept.deptno = emp.deptno;

-- 같은 업무(job)를 하는 사람의 수가 4명 이상인 업무와 인원수 출력
select job, count(*) from emp group by job having count(*) >= 4;

-- 사원번호(empno)가 7400 이상 7600 이하인 사원의 이름(ename)을 출력
select ename from emp where empno between 7400 and 7600;

-- 사원 scott보다 급여(sal)를 많이 받는 사원의 이름(ename)을 출력(부속질의)
select ename from emp where sal > (select sal from emp where ename = 'SCOTT');



select * from emp;

-- SCOTT 데이터 베이스 (스칼라질의)
-- 사원의 이름과 부서의 이름을 출력
-- 조인
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select ename, (select dname from dept where emp.deptno = dept.deptno) "Dname"
from emp;

-- SCOTT 데이터베이스 (인라인 뷰)
-- 'CHICAGO'에 근무하는 사원의 이름 출력
select * from emp;
select * from dept;
-- 조인으로 
select ename
from emp, dept
where emp.deptno = dept.deptno and loc = 'CHICAGO';
-- 인라인뷰
select deptno from dept where loc like 'CHICAGO';

select ename
from emp e, (select deptno from dept where loc like 'CHICAGO') d
where e.deptno = d.deptno;
-- 중첩질의(IN활용)
select ename
from emp
where deptno IN(select deptno from dept where loc like 'CHICAGO');
-- 중첩질의(EXISTS)
select ename
from emp
where EXISTS (select * from dept where emp.deptno = dept.deptno and loc like 'CHICAGO');

-- 평균보다 급여가 많은 직원의 이름
select ename
from emp
where sal > (select avg(sal) from emp);

-- 부서별 평균보다 급여가 많은 직원의 이름과 급여
select deptno, ename, sal, round((select avg(sal) from emp e2 where e1.deptno = e2.deptno),1) "부서별 평균"
from emp e1
where sal > (select avg(sal) from emp e2 where e1.deptno = e2.deptno)
order by deptno;

select deptno, avg(sal) from emp group by deptno;