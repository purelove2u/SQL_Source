-- 기업 프로젝트 : 데이터베이스는 MADANG
-- Employee는 사원 / Department는 부서 / Project는 프로젝트 / Works는 사원
-- 한 사원이 여러 프로젝트에 참여할 수 있으며 한 프로젝트에 참여 인원수는 제한이 없다

-- Department(deptno(pk), deptname, manager)
-- Employee(empno(pk), name, phoneno, address, sex, position, deptno)
-- Project(projno(PK), projname, deptno)
-- Works(empno(PK), projno(PK), hours_worked)

-- 제약조건
-- Employee테이블은 Department테이블과 참조조건
-- Project테이블은 Department테이블과 참조조건
-- Works테이블은 Project테이블과 Employee테이블과 참조조건 
DROP TABLE Department;
CREATE TABLE Department
	(
		deptno number not null,
		deptname varchar(20),
		manager varchar(20),
		primary key(deptno)
	);

CREATE TABLE Employee
(
		empno number not null,
		name varchar(20),
		phoneno number,
		address varchar(20),
		gender varchar(20),
		position varchar(20),
		deptno number,
		primary key(empno)
);
ALTER TABLE Employee ADD CONSTRAINT　EMP_FK 
foreign key(deptno) references Department(deptno);

select * from employee;
	CREATE TABLE Project
	(
		projno number not null,
		projname varchar(20),
		deptno number,
		primary key(projno),
		foreign key(deptno) references Department(deptno)
	);
    drop table Works;
	CREATE TABLE Works
	(
		projno number not null,
		empno number not null,
		hours_worked number,
		PRIMARY key(projno, empno),
		foreign key(projno) references Project(projno),
		foreign key(empno) references Employee(empno)
	);

select * from department;
insert into Department values(1,'IT', '고남순');
insert into Department values(2,'Marketing', '홍길동');

select * from Employee;
insert into Employee 
values(1, '김덕성', 01012341232, '서울', '여', 'Programmer',1);
insert into Employee 
values(2, '이서울', 01012323122, '서울', '남', 'Programmer',1);
insert into Employee 
values(3, '박연세', 01076851231, '대전', '여', 'Salesperson',2);
insert into Employee 
values(4, '홍길동', 01012341546, '서울', '남', 'Manager',2);
insert into Employee 
values(5, '고남순', 01012311112, '서울', '여', 'Manager',1);

select * from project;
insert into Project values(1,'DB구축',1);
insert into Project values(2,'시장조사',2);

select * from Works;
insert into Works values(1, 1, 3);
insert into Works values(1, 2, 1);
insert into Works values(2, 3, 1);
insert into Works values(2, 4, 5);
insert into Works values(1, 5, 1);


-- 모든 사원의 이름을 검색
select name from employee;
-- 여자 사원의 이름을 모두 검색
select name from employee where gender like '여';

-- 20200414
-- 팀장(manager)의 이름에 해당한 empno를 검색
select empno
from employee
where name In (select manager from department);

select manager from department;
select * from department;
select * from Employee;
select * from Works;
select * from book;

-- IT 부서에서 일하는 사원의 이름과 주소
select name, address
from employee e, department d
where e.deptno = d.deptno and deptname like 'IT';


select name, address
from employee e, department d
where e.deptno = d.deptno;

-- 홍길동 팀장부서에서 일하는 사원의 수(count)
select count(deptno)
from employee e
where  e.deptno 
in (select deptno from department where manager like '홍길동');
-- 1. IN
-- 홍길동 팀장의 부서번호
select deptno from department where manager like '홍길동';
select *
from employee 
where deptno in (select deptno from department where manager like '홍길동');

-- IT 부서에서 일하는 사원의 이름과 주소
-- 홍길동 팀장부서에서 일하는 사원의 수
select count(*)
from department d, employee e
where d.deptno = e.deptno and manager like '홍길동';

-- 부서번호와 부서별 사원들이 일한 시간의 합 (단, 부서별 오름차순)
select deptno as 부서번호, sum(hours_worked) as 총근무시간
from employee em, works wk
where em.empno = wk.empno
group by deptno
order by deptno;

-- 두 명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수를 보이시오.
	SELECT Project.projno, Project.projname, count(name) 사원수
	FROM Employee, Project
	WHERE Project.deptno=Employee.deptno
	GROUP BY Project.projno, Project.projname
	HAVING COUNT(*) >= 2; 

-- 세 명 이상의 사원이 있는 부서의 사원 이름을 보이시오.
SELECT name
	FROM Employee, Department
	WHERE Employee.deptno=Department.deptno and 
		deptname = (SELECT deptname FROM Employee, Department 
			WHERE Employee.deptno=Department.deptno 
			GROUP BY deptname
			HAVING COUNT(name) >= 3);


select * 
from orders od, customer cs 
where od.custid = cs.custid;

select name, saleprice
from orders od
inner join customer cs on od.custid = cs.custid;

select name, sum(saleprice)
from orders od
inner join customer cs on od.custid = cs.custid
group by cs.name
order by name;

select * from customer;
select * from orders;
select * from book;


select * from orders od, customer cs, book bk
where od.custid = cs.custid and od.bookid = bk.bookid;

select *
from orders od
inner join customer cs on od.custid = cs.custid
inner join book bk on od.bookid = bk.bookid;

select name, bookname
from orders od, customer cs, book bk
where cs.custid = od.custid and od.bookid = bk.bookid and price = 20000;



-- 외부조인 (합집합)
select name, saleprice
from customer cs
left outer join orders od on od.custid = cs.custid;

select name, saleprice 
from customer cs
right outer join orders od on cs.custid = od.custid;


select name, saleprice
from orders od
inner join customer cs on od.custid = cs.custid;

select * from customer;
select * from orders;
select * from book;

select bookname, saleprice   
from book bk
inner outer join orders od on bk.bookid = od.bookid; 


-- 부속질의
select bookname
from book 
where price = (select MAX(price) from book);

select custid
from orders;

select name
from customer
where custid IN (select custid from orders);



-- 대한미디어에서 출판한 도서를 구매한 고객의 이름
select name 
from customer
where custid  IN (select custid from orders where bookid in
                          (select bookid from book where publisher = '대한미디어'));
                          
                          
-- book테이블에서 출판사별 price의 평균(avg)                          
select publisher, avg(price)
from book
group by publisher;

-- book테이블에서 출판사별 price의 평균(avg)보다 비싼 도서의 이름
select bookname, b1.publisher
from book b1
where b1.price > (select avg(b2.price)
                            from book b2
                            where b1.publisher = b2.publisher);

-- 집합연산(UNION, MINUS, INTERSECT)
select name
from customer
where custid IN (select custid from orders);



-- EXISTS
select *
from orders od;

select name, address
from customer cs
where exists (select * from orders od
                     where cs.custid = od.custid);
                     
                     
-- 박지성이 구매하지 않은 도서의 이름 (단 EXISTS사용)
select bookname
from customer cs, orders od, book bk
where cs.custid = od.custid AND Orders.bookid = b1.bookid
AND name LIKE '박지성';
                         



-- 주문하지 않은 고객의 이름 (단 NOT IN 사용)

