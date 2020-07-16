-- 집합연산
-- UNION : 중복을 허용하지 않음
-- UNION ALL : 중복을 허용

select * from employees;
select * from job_history;

select employee_id, job_id from employees;

select employee_id, job_id from job_history;

select employee_id, job_id from employees
union
select employee_id, job_id from job_history;

-- 합집합
select employee_id, job_id from employees
union all
select employee_id, job_id from job_history;

-- 교집합
select employee_id, job_id from employees
intersect
select employee_id, job_id from job_history;

-- 조건부 논리 표현식 = 제어분 (CASE & DECODE)
/* CASE */
/* HR 부서에서는 신규 프로젝트를 성공으로 이끈 해당 업무자들의 급여를 인상키로 하였다.
사원은 현재 107명이며 19개 업무에 소속되어 근무중이다.
급여 인상 대상자는 회사의 업무(Distinct job_id) 중
다음 5개 업무에서 일하는 사원에 해당된다. 나머지 업무에 대해서는 급여가 동결된다.
5개 업무의 급여 인상안은 다음과 같다. */
-- HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(10%), IT_PROG(20%)

select last_name || first_name from employees;

select last_name ||' '|| first_name as "Name", job_id, salary from employees;

select employee_id, last_name ||' '|| first_name as "Name", job_id, salary,
    case job_id when 'hr_rep' then 1.10 * salary
                when 'mk_rep' then 1.12 * salary
                when 'pr_rep' then 1.15 * salary
                when 'sa_rep' then 1.10 * salary
                when 'it_rep' then 1.20 * salary
    else salary
    end  "New salary"
from employees;

select employee_id, last_name ||' '|| first_name as "Name", job_id, salary,
        decode(job_id, 'hr_rep', 1.10 * salary,
                        'mk_rep', 1.12 * salary,
                        'pr_rep', 1.15 * salary,
                        'sa_rep', 1.10 * salary,
                        'it_rep', 1.20 * salary,
                salary) "New salary"
from employees;

/* HR 부서에서는 최상위 입사일에 해당하는 2001년부터 2003년까지 입사자들의 급여를
각각 5%, 3%, 1% 인상하여 지분에 따른 배당금으로 지급하고자 한다.
전체 사원들 중 해당 년도에 해당하는 사원들의 급여를 검색하여 적용하고,
입사일자에 따른 오름차순 정렬을 수행하시오 */
--유형분석 hire_date는 DATE 유형으로 분석됨
desc employees;
-- 관계연산자를 활용한 case문
select employee_id, last_name ||' '|| first_name as "Name", hire_date, salary,
    case when hire_date < to_date('2002-01-01', 'yyyy-mm-dd') then salary * 1.05
        when hire_date < to_date('2003-01-01', 'yyyy-mm-dd') then salary * 1.03
        when hire_date < to_date('2004-01-01', 'yyyy-mm-dd') then salary * 1.01
    else salary
    end "New Salary"
from employees;

select * from employees;

-- department_id 별 salary 합계
select department_id, sum(salary) as sal_sum from employees group by department_id order by department_id;

/* CASE 문법을 활용하여 부서별 급여 합계를 구하고, 그 결과를 다음과 같이 표현하시오.
컬럼명 : "Department Grade Salary"

Sum_Sal > 100000 이면, "Excellent"
Sum_Sal > 50000 이면, "Good"
Sum_Sal > 10000 이면, "Mediaum"
Sum_Sal <= 10000 이면, "Well" */

select department_id, sal_sum,
        case when sal_sum > 100000 then 'Excellent'
                when sal_sum > 50000 then 'Good'
                when sal_sum > 10000 then 'Mediaum'
                when sal_sum <= 10000 then 'Well'
        end "Department Grade Salary"
from (select department_id, sum(salary) as sal_sum from employees group by department_id order by department_id);


/* 2005년 이전에 입사한 사원 중 업무에 "MGR"이 포함된 사원은 15%, "MAN"이 포함된 사원은 20% 급여를 인상한다.
또한 2005년부터 근무를 시작한 사원 중 "MGR"이 포함된 사원은 25% 급여를 인상한다.*/

select employee_id, last_name || ' ' || first_name as "Name", job_id, hire_date, salary,
    case when hire_date < to_date('2005-01-01', 'yyyy-mm-dd') then
        case when job_id like '%MGR' then salary * 1.15
             when job_id like '%MAN' then salary * 1.20 else salary
        end
    else case when job_id like '%MGR' then salary * 1.25 else salary
        end
    end "Job Salary"
from employees
where job_id like '%MGR%' or job_id like '%MAN%';

/* 월별로 입사한 사원 수 출력
월별로 입사한 사원 수를 각 행별로 출력 */
select to_char(hire_date, 'MM'), count(*)
from employees
group by to_char(hire_date, 'MM')
order by to_char(hire_date, 'MM');

select decode(to_char(hire_date, 'MM'), '01', count(*), 0) "1 Month",
        decode(to_char(hire_date, 'MM'), '02', count(*), 0) "2 MOnth",
        decode(to_char(hire_date, 'MM'), '03', count(*), 0) "3 MOnth",
        decode(to_char(hire_date, 'MM'), '04', count(*), 0) "4 MOnth",
        decode(to_char(hire_date, 'MM'), '05', count(*), 0) "5 MOnth",
        decode(to_char(hire_date, 'MM'), '06', count(*), 0) "6 MOnth",
        decode(to_char(hire_date, 'MM'), '07', count(*), 0) "7 MOnth",
        decode(to_char(hire_date, 'MM'), '08', count(*), 0) "8 MOnth",
        decode(to_char(hire_date, 'MM'), '09', count(*), 0) "9 MOnth",
        decode(to_char(hire_date, 'MM'), '10', count(*), 0) "10 MOnth",
        decode(to_char(hire_date, 'MM'), '11', count(*), 0) "11 MOnth",
        decode(to_char(hire_date, 'MM'), '12', count(*), 0) "12 MOnth"
from employees
group by to_char(hire_date, 'MM')
order by to_char(hire_date, 'MM');

select sum(decode(to_char(hire_date, 'MM'), '01', count(*), 0)) "1 Month",
        sum(decode(to_char(hire_date, 'MM'), '02', count(*), 0)) "2 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '03', count(*), 0)) "3 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '04', count(*), 0)) "4 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '05', count(*), 0)) "5 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '06', count(*), 0)) "6 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '07', count(*), 0)) "7 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '08', count(*), 0)) "8 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '09', count(*), 0)) "9 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '10', count(*), 0)) "10 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '11', count(*), 0)) "11 MOnth",
        sum(decode(to_char(hire_date, 'MM'), '12', count(*), 0)) "12 MOnth"
from employees
group by to_char(hire_date, 'MM')
order by to_char(hire_date, 'MM');












