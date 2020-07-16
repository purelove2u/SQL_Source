create table userTBL(
    no number(4) constraint pk_userTBL primary key,
    username nvarchar2(4) not null,
    birthYear number(4) not null,
    addr nvarchar2(10) not null,
    mobile nvarchar2(20));

-- 시퀀스 생성하기(auto_increment 역할)
-- 특정 규칙에 맞춰서 연속 숫자를 생성하는 객체
create sequence user_seq;

-- insert
insert into usertbl values(user_seq.nextval, '홍길동', 1955, '서울시', '01012341234');

commit;
