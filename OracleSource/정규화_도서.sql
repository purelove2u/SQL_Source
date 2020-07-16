-- 정규화 실습
-- 제1정규화
drop table 도서주문;
create table 도서주문(
    주문번호 number(30) primary key not null,
    주문날짜 date,
    회원이름 varchar(20),
    회원번호 varchar(10),
    회원주소 varchar(20),
    전화번호 varchar(20),
    도서_SNO number,
    도서명 varchar(40),
    수량 number,
    단가 number);

insert into 도서주문 values(20190213123,to_date('2019-02-13','yyyy-mm-dd'),'lee','L-123','서울 강남구','010-3664-1234',9788123,'NoSQL의 진수를 만나다',1,25000);
insert into 도서주문 values(20190509238,to_date('2019-05-09','yyyy-mm-dd'),'park','P-234','서울 성동구','010-5301-3456',97889234,'데이터베이스 개론과 실습',1,27000);
insert into 도서주문 values(20190509239,to_date('2019-05-09','yyyy-mm-dd'),'Park','P-234','서울 성동구','010-5301-3456',97889234,'JAVA for Beginner',2,18000);
insert into 도서주문 values(20190721376,to_date('2019-07-21','yyyy-mm-dd'),'Kim','K-345','경기도 용인','010-7341-2345',97889345,'정보보안 개론과 실습',5,24000);
insert into 도서주문 values(20190729401,to_date('2019-07-29','yyyy-mm-dd'),'Nam','n-456','강원도 속초','010-9279-3456',97889234,'데이터베이스 개론과 실습',1,27000);
insert into 도서주문 values(20191005456,to_date('2019-10-05','yyyy-mm-dd'),'Park','P-234','서울 성동구','010-5301-3456',97889567,'오라클 프로그래밍',4,27000);

select * from 도서주문;

-- 제2정규화 과정(부분종속제거)
-- 주문회원 / 주문내역 / 주문도서 테이블 생성
create table 주문회원(
    회원번호 number primary key not null,
    회원이름 nvarchar2(20),
    회원주소 nvarchar2(40),
    전화번호 nvarchar2(20),
    주문번호 number,
    주문날짜 date);
    
create table 주문내역(
    주문번호 number primary key not null,
    주문날짜 date,
    도서_SNO number,
    수량 number,
    단가 number);
    
create table 주문도서(
    도서_SNO number not null,
    도서명 varchar(40),
    단가 number);

-- 제3정규화 과정(이행적종속제거)
-- 주문회원 / 회원정보 / 주문내역 / 주문도서
create table 주문회원(
    회원번호 number references 회원정보(회원번호),
    주문번호 number references 주문내역(주문번호));
    
create table 회원정보(
    회원번호 number primary key not null,
    회원이름 nvarchar2(20),
    회원주소 nvarchar2(40),
    전화번호 nvarchar2(20));
    
create table 주문내역(
    주문번호 number primary key not null,
    주문날짜 date,
    도서_SNO number references 주문도서(도서_SNO),
    수량 number,
    단가 number);
    
create table 주문도서(
    도서_SNO number not null primary key,
    도서명 varchar(40),
    단가 number);




