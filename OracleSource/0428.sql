-- 다차원 그룹 데이터 검색 : RollUp, Cube
/* HR 부서에서는 부서와 업무별 급여 합계를 구하여 신년도 급여 수준 레벨을 지정하고자 한다. */

select department_id, job_id, sum(salary)
from employees
group by department_id, job_id
order by department_id;

select department_id, job_id, to_char(sum(salary), '$999,999.00') as "Salary", count(employee_id) as "count EMPs"
from employees
group by department_id, job_id
order by department_id;

-- 부서 번호와 업무를 기준으로 전체 행을 그룹별로 나누어 급여 합계와 인원수를 출력
select department_id, job_id, to_char(sum(salary), '$999,999.00') as "Salary", count(employee_id) as "count EMPs"
from employees
group by rollup(department_id, job_id)
order by department_id;

-- 업무통계
select department_id, job_id, to_char(sum(salary), '$999,999.00') as "Salary", count(employee_id) as "count EMPs"
from employees
group by cube(department_id, job_id)
order by department_id;

-- 분석합수 : NTILE, RANK, DENSE_RANK, ROW_NUMBER
-- NTILE
select department_id, sum(salary) as "Sum salary",
NTILE (4) over(order by sum(salary) desc) as "Bucke#"
from employees
group by department_id;
-- RANK, DENSE_RANK, ROW_NUMBER
/* 
rank() : 동등 순위가 발생하면 다음 순위는 중복된 값만큼 증가시키고 매긴다.
dense_rank() : 동등 순위가 발생하면 다음 순위는 중복된 값을 무시하고 바로 다음 번호로 매긴다.
row_number() : 동등 순위 자체를 인식하지 않고 매번 번호가 증가하여 매긴다.
*/
-- 각 사원이 소속된 부서별로 급여를 기준으로 내림차순 정렬
select employee_id, last_name, salary, department_id,
rank() over (partition by department_id order by salary desc) as "Rank"
from employees;

select employee_id, last_name, salary, department_id,
dense_rank() over (partition by department_id order by salary desc) as "Dense Rank"
from employees;

select employee_id, last_name, salary, department_id,
row_number() over (partition by department_id order by salary desc) as "Row Number"
from employees;

select employee_id, last_name, salary, department_id,
rank() over (partition by department_id order by salary desc) as "Rank",
dense_rank() over (partition by department_id order by salary desc) as "Dense Rank",
row_number() over (partition by department_id order by salary desc) as "Row Number"
from employees;

