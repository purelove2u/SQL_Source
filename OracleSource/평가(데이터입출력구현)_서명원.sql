--1) ER 다이어그램을 이용하여 데이터베이스의 논리적 모델링을 구현하시오(병원 프로젝트)

--2) ER 다이어그램을 이용하여 기본키와 조인 제약조건을 완성하시오

--3) ER다이어그램으로 구현된 모델링을 DDL로 전환하시오(병원 프로젝트)

--4) TableSpace 생성하여 물리적인 저장소를 구현하시오
--(경로는 D:\ORADATE, 파일명은 sample, 용량은 10M로 생성하시오)
create tablespace md_admin
datafile 'd:\oradate\sample.dbf'
size 10M;

--5) 실제로 구현된 저장소를 ADMIN계정을 생성하여 할당하시오.
create user ADMIN IDENTIFIED by admin
default tablespace md_admin;

--6) Department테이블, Employee테이블, Project테이블 Works테이블를 생성하시오
create table department2(
    deptno number not null,
    deptname nvarchar2(20) not null,
    manager nvarchar2(20),
    primary key(deptno));
    
create table employee2(
    empno number not null,
    name nvarchar2(20),
    phoneno nvarchar2(10),
    address nvarchar2(30),
    sex nvarchar2(4),
    position nvarchar2(10),
    deptno number references department2(deptno),
    primary key(empno));
    
create table project2(
    projno number not null,
    projname nvarchar2(20),
    deptno number references department2(deptno),
    primary key(projno));
    
create table works2(
    empno number not null references employee2(empno),
    projno number not null references project2(projno),
    primary key(empno, projno));

--7) 모든 테이블이 내부조인과 외부조인이 가능하도록 구현하시오 
ALTER TABLE department2 ADD CONSTRAINT deptno_pk PRIMARY KEY ( deptno );
ALTER TABLE employee2 ADD CONSTRAINT empno_pk PRIMARY KEY ( empno );
ALTER TABLE project2 ADD CONSTRAINT projno_pk PRIMARY KEY ( projno );
ALTER TABLE works2 ADD CONSTRAINT empno_pk PRIMARY KEY ( empno );
ALTER TABLE works2 ADD CONSTRAINT projno_pk PRIMARY KEY ( projno );

ALTER TABLE employee2
    ADD CONSTRAINT emp_fk FOREIGN KEY ( deptno )
        REFERENCES department2 ( deptno );
ALTER TABLE works2
    ADD CONSTRAINT emp_fk FOREIGN KEY ( empno )
        REFERENCES employee2 ( emptno );
ALTER TABLE works2
    ADD CONSTRAINT proj_fk FOREIGN KEY ( projno )
        REFERENCES project2 ( projno );
        
--8) book테이블에 대한 업데이트 프로시저를 구현하시오(프로시저 명 : BookInsertOrUpdate)
create or replace procedure bookinsertorupdate(
mybookid  number,
mybookname  varchar2,
mypublisher  varchar2,
myprice int)
as
 mycount number;    -- 지역변수 선언
begin
select count(*) into mycount from book
where bookname like mybookname;     --같은 이름의 도서가 몇 권인지 검색

    if mycount !=0 then     -- 같은 도서가 있으면
        update book set price=myprice
        where bookname like mybookname;
    else
        insert into book(bookid,bookname,publisher,price)
        values(mybookid,mybookname,mypublisher,myprice);
    end if;
end;
/

--9) 데이터 조작 프로시저의 성능을 파악하기 위하여 기업프로젝트에 대한 평가지의 질의를 수행 하시오 (부속질의와 조인, 저장소 사용 필수)
--    (부속질의와 조인, 저장소 사용 필수)

--	- 모든 사원의 이름을 보이시오.
select name from employee;

--	- 여자 사원의 이름을 보이시오.
select name from employee where sex like '여';

--	- 팀장(manager)의 이름에 해당하는 empno를 보이시오
select empno
from employee
where name In (select manager from department);

--	- ‘IT’ 부서에서 일하는 사원의 이름과 주소를 보이시오.
select name, address
from employee e, department d
where e.deptno = d.deptno and deptname like 'IT';

--	- ‘홍길동’ 팀장(manager) 부서에서 일하는 사원의 수를 보이시오.
select count(deptno)
from employee e
where  e.deptno 
in (select deptno from department where manager like '홍길동');

--	- 부서번호와 부서별 사원들이 일한 시간 수를 보이시오(단, 부서별로  오름차순).
select deptno as 부서번호, sum(hours_worked) as 총근무시간
from employee em, works wk
where em.empno = wk.empno
group by deptno
order by deptno;

--	- 두 명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수를 보이시오.
SELECT Project.projno, Project.projname, count(name) 사원수
FROM Employee, Project
WHERE Project.deptno=Employee.deptno
GROUP BY Project.projno, Project.projname
HAVING COUNT(*) >= 2; 

--	- 세 명 이상의 사원이 있는 부서의 사원 이름을 보이시오.
SELECT name
	FROM Employee, Department
	WHERE Employee.deptno=Department.deptno and 
		deptname = (SELECT deptname FROM Employee, Department 
			WHERE Employee.deptno=Department.deptno 
			GROUP BY deptname
			HAVING COUNT(name) >= 3);
            
--10) ADMIN 계정에게 다음 권한 부여하시오
-- SELECT, UPDATE, INSERT, CONNECT, RESOURCE, 모든 테이블 생성
grant select, update, insert, connect, resource to admin;
grant create any table to admin;

-- MADANG 데이터베이스의 Order 테이블을 모든 사용자가 SELECT 할수 있도록 권한을 부여하시오
grant select on madang.order to public;




