select * from emp; -- deptno
select * from dept; -- deptno

-- 30번 부서에 근무하는 모든 사원의 이름과 급여(emp)
select ename,sal from emp where dept=30;
-- 사원 번호와 이름, 현재 급여와 10% 인상된 급여(컬럼이름 인상된 급여)를 출력
-- 단 사원 번호순으로 오름차순
select empno, ename, sal, sal*1.1 as "인상된 급여"
from emp
order by empno;
-- 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력
-- 열이름은 각각 MAX,MIN,SUM,AVG로 한다(소수점 이하는 반올림하여 정수로 출력)
select MAX(sal) as MAX, MIN(sal) as MIN, sum(sal) as SUM,
round(avg(sal),0) as AVG
from emp;

-- 업무이름과 업무별로 동일한 업무를 하는 사원의 수를 출력 
-- (열이름 '업무','업무별 사원수')
select job as 업무, count(ename) as "업무별 사원수"
from emp
group by job;

-- 평균급여가 가장 높은 부서의 번호를 출력(부속질의 활용)
select dept.detpno, avg(sal)
from emp,dept
where emp.deptno=dept.deptno
group by dept.deptno 
having avg(sal) >= all (SELECT (avg(sal)) from emp group by deptno);
-- sql 공통 차집합
SELECT Dept.deptno
	FROM Dept
	EXCEPT 
		SELECT Dept. deptno
		FROM Dept, Emp
		WHERE Dept.deptno=Emp.deptno;
        
-- 같은 업무(job)를 하는 사람의 수가 4명 이상인 업무(job)와 인원수 출력
select job, count(ename) as 사원수
from emp
group by job
having 사원수>=4;
-- 사원번호(empno)가 7400이상 7600이하인 사원의 이름(ename)을 출력
select ename
from emp
where empno between 7400 and 7600;
-- 사원 scott보다 급여(sal)를 많이 받는 사원의 이름(ename)을 출력(부속질의)
select ename from emp where sal > 
        (select sal from emp where ename like 'SCOTT');







