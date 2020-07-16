-- ���տ���
-- UNION : �ߺ��� ������� ����
-- UNION ALL : �ߺ��� ���

select * from employees;
select * from job_history;

select employee_id, job_id from employees;

select employee_id, job_id from job_history;

select employee_id, job_id from employees
union
select employee_id, job_id from job_history;

-- ������
select employee_id, job_id from employees
union all
select employee_id, job_id from job_history;

-- ������
select employee_id, job_id from employees
intersect
select employee_id, job_id from job_history;

-- ���Ǻ� �� ǥ���� = ����� (CASE & DECODE)
/* CASE */
/* HR �μ������� �ű� ������Ʈ�� �������� �̲� �ش� �����ڵ��� �޿��� �λ�Ű�� �Ͽ���.
����� ���� 107���̸� 19�� ������ �ҼӵǾ� �ٹ����̴�.
�޿� �λ� ����ڴ� ȸ���� ����(Distinct job_id) ��
���� 5�� �������� ���ϴ� ����� �ش�ȴ�. ������ ������ ���ؼ��� �޿��� ����ȴ�.
5�� ������ �޿� �λ���� ������ ����. */
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

/* HR �μ������� �ֻ��� �Ի��Ͽ� �ش��ϴ� 2001����� 2003����� �Ի��ڵ��� �޿���
���� 5%, 3%, 1% �λ��Ͽ� ���п� ���� �������� �����ϰ��� �Ѵ�.
��ü ����� �� �ش� �⵵�� �ش��ϴ� ������� �޿��� �˻��Ͽ� �����ϰ�,
�Ի����ڿ� ���� �������� ������ �����Ͻÿ� */
--�����м� hire_date�� DATE �������� �м���
desc employees;
-- ���迬���ڸ� Ȱ���� case��
select employee_id, last_name ||' '|| first_name as "Name", hire_date, salary,
    case when hire_date < to_date('2002-01-01', 'yyyy-mm-dd') then salary * 1.05
        when hire_date < to_date('2003-01-01', 'yyyy-mm-dd') then salary * 1.03
        when hire_date < to_date('2004-01-01', 'yyyy-mm-dd') then salary * 1.01
    else salary
    end "New Salary"
from employees;

select * from employees;

-- department_id �� salary �հ�
select department_id, sum(salary) as sal_sum from employees group by department_id order by department_id;

/* CASE ������ Ȱ���Ͽ� �μ��� �޿� �հ踦 ���ϰ�, �� ����� ������ ���� ǥ���Ͻÿ�.
�÷��� : "Department Grade Salary"

Sum_Sal > 100000 �̸�, "Excellent"
Sum_Sal > 50000 �̸�, "Good"
Sum_Sal > 10000 �̸�, "Mediaum"
Sum_Sal <= 10000 �̸�, "Well" */

select department_id, sal_sum,
        case when sal_sum > 100000 then 'Excellent'
                when sal_sum > 50000 then 'Good'
                when sal_sum > 10000 then 'Mediaum'
                when sal_sum <= 10000 then 'Well'
        end "Department Grade Salary"
from (select department_id, sum(salary) as sal_sum from employees group by department_id order by department_id);


/* 2005�� ������ �Ի��� ��� �� ������ "MGR"�� ���Ե� ����� 15%, "MAN"�� ���Ե� ����� 20% �޿��� �λ��Ѵ�.
���� 2005����� �ٹ��� ������ ��� �� "MGR"�� ���Ե� ����� 25% �޿��� �λ��Ѵ�.*/

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

/* ������ �Ի��� ��� �� ���
������ �Ի��� ��� ���� �� �ະ�� ��� */
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












