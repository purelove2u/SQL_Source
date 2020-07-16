-- 기업 프로젝트 : 데이터베이스는 madang
-- Relation(table) : Employee 사원 / Department 부서 / Project 프로젝트 / Works 사원
-- 한 사원이 여러 프로젝트에 참여할 수 있으며 한 프로젝트에 참여 인원 수는 제한이 없다.

-- Department (deptno(pk), deptname, manager)
-- Employee (empno(pk), name, phoneno, address, sex, position, deptno)
-- Project (projno(pk), projname, deptno)
-- Works ( empno(pk), projno(pk), hours-worked)

-- 제약조건
-- Employee 테이블은 Department 테이블과 참조조건
-- Project 테이블은 Department 테이블과 참조조건
-- Works 테이블은 Project 테이블과 Employee 테이블과 참조조건
drop table department;
create table Department(
    deptno number not null primary key,
    deptname varchar(20),
    manager varchar(20));
        
create table Employee(
    empno number not null primary key,
    name varchar(20),
    phoneno number,
    address varchar(20),
    sex varchar(20),
    position varchar(20),
    deptno number,
    foreign key (deptno) references Department(deptno));
    
create table Project(
    projno number not null primary key,
    projname varchar(20),
    deptno number,
    foreign key (deptno) references Department(deptno));

alter table project modify projname varchar(40);
    
create table Works(
    empno number not null,
    projno number not null,
    hours_worked number,
    primary key(empno, projno),
    foreign key(empno) references employee(empno),
    foreign key(projno) references project(projno));

insert into department values (1, 'IT', '고남순');
insert into department values (2, 'Marketing', '홍길동');
select * from department;

insert into employee values (1, '김덕성', 01012341232, '서울', '여', 'Programmer', 1);
insert into employee values (2, '이서울', 01012323122, '서울', '남', 'Programmer', 1);
insert into employee values (3, '박연세', 01076851231, '대전', '여', 'Salesperson', 2);
insert into employee values (4, '홍길동', 01012341546, '서울', '남', 'Manager', 2);
insert into employee values (5, '고남순', 01012311112, '서울', '여', 'Manager', 1);
select * from employee;

insert into project values (1, '데이터베이스구축', 1);
insert into project values (2, '시장조사', 2);
select * from project;

insert into works values (1, 1, 3);
insert into works values (2, 1, 1);
insert into works values (3, 2, 1);
insert into works values (4, 2, 5);
insert into works values (5, 1, 1);
select * from works;
delete from works;

-- 모든 사원의 이름을 검색
select name from employee;
-- 여자 사원의 이름을 모두 검색
select name from employee where sex = '여';
select name from employee where sex like '여';
-- 팀장(manager)의 이름을 검색
select name from employee where position = 'Manager';
-- 팀장(manager)의 이름에 해당한 empno를 검색
select empno from employee where name In (select manager from department);
-- IT부서에서 일하는 사원의 이름과 주소
select name, address from employee where deptno = 1;
select name, address from employee e, department d where d.deptname like 'IT'; --단, 두 테이블이 join되어 있어야함.
select name, address from employee e, department d where e.deptno = d.deptno;

-- 홍길동 팀장부서에서 일하는 사원의 수(count)
-- 1. IN
-- 홍길동 팀장의 부서번호
-- dept IN (select .....)
select deptno from department where manager = '홍길동';
select count(name) || '명' from employee where deptno in (select deptno from department where manager = '홍길동');

-- 2. JOIN
select * from employee where employee.deptno = (select deptno from department where manager = '홍길동');
select count(name) || '명' from employee where employee.deptno = (select deptno from department where manager = '홍길동');
-- select count(*) from department d, employee e where e.deptno like manager '홍길동';


-- 부서번호와 부서별 사원들이 일한 시간의 합 (단, 부서별 오름차순)
select deptno, sum(hours_worked) as 총근무시간 
from employee em, works wk 
where em.empno = wk.empno 
group by deptno 
order by deptno;

-- (세 명 이상의 사원이 참여한) 프로젝트별 프로젝트 번호, 프로젝트 이름, 사원의 수
-- 내답
select projno, projname, count(*) || '명' 
from employee e, project p 
where e.deptno = p.projno 
group by projno, projname;

-- 정답
select projno, projname, count(name)
from employee, project
where project.deptno = employee.deptno
group by projno, projname
having count(*) >= 3; -- 3명 이상


