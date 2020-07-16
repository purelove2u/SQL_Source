create table member(
    id          varchar2(50),
    pwd         varchar2(50),
    name        nvarchar2(50),
    gender      nchar(2),
    age         number(3),
    birthday    char(10),
    phone       char(13),
    regdate     date
);

alter table member modify id nvarchar2(50);
alter table member drop column age;
alter table member add email varchar2(200);

drop table member;
select * from nls_database_parameters;

create table member(
    id          nvarchar2(50),
    pwd         varchar2(50),
    name        nvarchar2(50),
    gender      nchar(2),
    birthday    char(10),
    phone       char(13),
    regdate     date,
    email       varchar2(200)
);

create table notice(
    id          number,
    title       nvarchar2(100),
    writer_id   nvarchar2(50),
    content     clob,
    regdate     timestamp,
    hit         number,
    files       nvarchar2(1000)
);

create table "comment"(
    id          number,
    content     nvarchar2(2000),
    regdate     timestamp,
    writer_id   nvarchar2(50),
    notice_id   number
);

create table role(
    id          varchar2(50),
    discription nvarchar2(500)
);

create table member_role(
    member_id   nvarchar2(50),
    role_id     varchar2(50)
);

insert into notice values(1, 'jdbc란 무엇인가?', 'newlec', 'aaaa', sysdate, 0, '');
insert into notice values(2, 'jsp란 무엇인가?', 'myoungwon', 'bbbb', sysdate, 0, '');
insert into notice values(2, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');

commit;
update notice set hit = 12 where id = 2;
select * from notice;

select value from v$parameter where name='service_names';
select instance_name, version, status from v$instance;
