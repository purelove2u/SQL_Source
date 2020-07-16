-- ������ �׷� ������ �˻� : RollUp, Cube
/* HR �μ������� �μ��� ������ �޿� �հ踦 ���Ͽ� �ų⵵ �޿� ���� ������ �����ϰ��� �Ѵ�. */

select department_id, job_id, sum(salary)
from employees
group by department_id, job_id
order by department_id;

select department_id, job_id, to_char(sum(salary), '$999,999.00') as "Salary", count(employee_id) as "count EMPs"
from employees
group by department_id, job_id
order by department_id;

-- �μ� ��ȣ�� ������ �������� ��ü ���� �׷캰�� ������ �޿� �հ�� �ο����� ���
select department_id, job_id, to_char(sum(salary), '$999,999.00') as "Salary", count(employee_id) as "count EMPs"
from employees
group by rollup(department_id, job_id)
order by department_id;

-- �������
select department_id, job_id, to_char(sum(salary), '$999,999.00') as "Salary", count(employee_id) as "count EMPs"
from employees
group by cube(department_id, job_id)
order by department_id;

-- �м��ռ� : NTILE, RANK, DENSE_RANK, ROW_NUMBER
-- NTILE
select department_id, sum(salary) as "Sum salary",
NTILE (4) over(order by sum(salary) desc) as "Bucke#"
from employees
group by department_id;
-- RANK, DENSE_RANK, ROW_NUMBER
/* 
rank() : ���� ������ �߻��ϸ� ���� ������ �ߺ��� ����ŭ ������Ű�� �ű��.
dense_rank() : ���� ������ �߻��ϸ� ���� ������ �ߺ��� ���� �����ϰ� �ٷ� ���� ��ȣ�� �ű��.
row_number() : ���� ���� ��ü�� �ν����� �ʰ� �Ź� ��ȣ�� �����Ͽ� �ű��.
*/
-- �� ����� �Ҽӵ� �μ����� �޿��� �������� �������� ����
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

