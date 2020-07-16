create database shopdb;
use shopdb;
create table membertbl(
memberid varchar(8) not null primary key,
membername varchar(10) not null,
memberaddress varchar(20));

-- 테이블 명 : producttbl
-- 속성 or 필드 : *productname(기본키), cost(int), makedate(date), company(varchar), *amount(int)
create table producttbl(
productname char(10) not null,
cost int(10) not null,
makedate date,
company char(10),
amount int(10) not null, primary key(`productname`));

-- alter
-- 컬럼타입 변경(modify)
alter table shopdb.membertbl modify memberid varchar(20);
alter table shopdb.producttbl modify productname varchar(20);
alter table shopdb.producttbl modify company varchar(20);

-- 컬럼추가(add)
alter table shopdb.membertbl add phone varchar(20);
alter table shopdb.producttbl add price int(10);

-- 컬럼명 변경(change)
alter table shopdb.membertbl change phone mobilephone varchar(20);
alter table shopdb.producttbl change price saleprice int(10);

-- 컬럼명 삭제
alter table membertbl drop mobilephone;
alter table producttbl drop saleprice;

-- 기본키 제약조건 삭제(drop)
alter table membertbl drop primary key;

-- 기본키 제약조건 생성
alter table membertbl add constraint pk_membertbl primary key(memberid);

-- 외래키 제약조건 삭제/생성
alter table buytbl drop foreign key FK_usertbl_buytbl;
alter table buytbl add constraint FK_usertbl_buytbl foreign key (userid) references usertbl(userid);
