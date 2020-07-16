/* 기업 프로젝트 데이터베이스 */
/* Employee는 사원, Department는 부서, Project는 프로젝트 내용, 
Works는 사원이 프로젝트에 참여한 내용을 나타낸다.
한 사원이 여러 프로젝트에서 일할 수 있고, 한 프로젝트에서 여러 사원이 일할 수 있다. 
hours-worked 속성은 각 사원이 각 프로젝트에서 일한 시간 수를 나타낸다.*/

/* Department(deptno, deptname, manager)
   Employee(empno, name, phoneno, address, sex, position, deptno)
   Project(projno, projname, deptno)
   Works(empno, projno, hours-worked) */
/* (1) 각 릴레이션에서 기본키를 정하시오.
● Department: deptno
● Employee: empno
● Project: projno
● Work: empno, projno
(2) 릴레이션 간의 관계를 살펴보고 외래키를 찾아보시오.
● Employee : deptno
● Project : deptno
● Works : (empno, projno) */

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
    


---------------------------------------------------------------------------------------------------
create table 호텔(
    이름 nvarchar2(20) not null,
    주소 nvarchar2(30) not null,
    도시 nvarchar2(10),
    가격 number,
    방의_수 number,
    primary key(주소));
    
create table 투숙고객(
    고객이름 nvarchar2(20) not null,
    고객주소 nvarchar2(30),
    고객_전화번호 nvarchar2(10) not null,
    primary key(고객이름));
    
create table 숙박예약(
    호텔주소 nvarchar2(30) not null,
    고객이름 nvarchar2(20) not null,
    투숙객수 number,
    출발일 date,
    도착일 date,
    예약일 date,
    foreign key(호텔주소) references 호텔(주소),
    foreign key(고객이름) references 투숙고객(고객이름));
    
create table 투숙(
    고객이름 nvarchar2(20) not null,
    주소 nvarchar2(30) not null,
    실제도착일 date,
    실제출발일 date,
    선급금 number,
    지불방법 nvarchar2(10),
    foreign key(고객이름) references 투숙고객(고객이름),
    foreign key(주소) references 호텔(주소));
    



























    