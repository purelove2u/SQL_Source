-- HR 스키마에 존재하는 Employees, Departments, Locations 테이블 구조를 파악한 후
-- Oxford에 근무하는 사원의 이름과 성, 업무, 부서이름, 도시이름을 출력하시오
select * from departments;

select e.first_name||''||e.last_name as "name", e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.city = 'Oxford';

select e.first_name||''||e.last_name as "name", e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where l.city = 'Oxford';
