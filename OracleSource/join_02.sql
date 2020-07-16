-- HR ��Ű���� �����ϴ� Employees, Departments, Locations ���̺� ������ �ľ��� ��
-- Oxford�� �ٹ��ϴ� ����� �̸��� ��, ����, �μ��̸�, �����̸��� ����Ͻÿ�
select * from departments;

select e.first_name||''||e.last_name as "name", e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.city = 'Oxford';

select e.first_name||''||e.last_name as "name", e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where l.city = 'Oxford';
