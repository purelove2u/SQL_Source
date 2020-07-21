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
insert into notice values(3, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');
insert into notice values(4, '허니버터칩', '해태', '존맛개맛', sysdate, 20, '');
insert into notice values(5, '김이연은 누구인가?', '김이연', '오키도키나이키', sysdate, 9, '');
insert into notice values(6, '재미있는 금요일', '서명원', '집에가야지', sysdate, 30, '');
insert into notice values(7, '스피링은 언제나가나', 'SON', '나 또 골 넣었다.', sysdate, 19, '');
insert into notice values(8, '맥북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 99, '');

select * from notice order by id desc;

update notice set id = 3 where title = 'servlet이란 무엇인가?';
select value from v$parameter where name='service_names';
select instance_name, version, status from v$instance;
EXEC dbms_xdb.setlistenerlocalaccess(false);