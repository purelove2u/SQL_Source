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
insert into notice values(9, '윈도우매뉴얼', '빌게이츠', '홈페이지 참조', sysdate, 109, '');
insert into notice values(10, '아이폰북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 55, '');
insert into notice values(11, '갤럭시매뉴얼', '이재용', '홈페이지 참조', sysdate, 66, '');
insert into notice values(12, '앵귤러', '개발자누구냐', '앵귤러가 무엇인고?', sysdate, 10, '');
insert into notice values(13, 'jdbc란 무엇인가?', 'newlec', 'aaaa', sysdate, 0, '');
insert into notice values(14, 'jsp란 무엇인가?', 'myoungwon', 'bbbb', sysdate, 0, '');
insert into notice values(15, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');
insert into notice values(16, '허니버터칩', '해태', '존맛개맛', sysdate, 20, '');
insert into notice values(17, '김이연은 누구인가?', '김이연', '오키도키나이키', sysdate, 9, '');
insert into notice values(18, '재미있는 금요일', '서명원', '집에가야지', sysdate, 30, '');
insert into notice values(19, '스피링은 언제나가나', 'SON', '나 또 골 넣었다.', sysdate, 19, '');
insert into notice values(20, '맥북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 99, '');
insert into notice values(21, '윈도우매뉴얼', '빌게이츠', '홈페이지 참조', sysdate, 109, '');
insert into notice values(22, '아이폰북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 55, '');
insert into notice values(23, '갤럭시매뉴얼', '이재용', '홈페이지 참조', sysdate, 66, '');
insert into notice values(24, '앵귤러', '개발자누구냐', '앵귤러가 무엇인고?', sysdate, 10, '');
insert into notice values(25, 'jdbc란 무엇인가?', 'newlec', 'aaaa', sysdate, 0, '');
insert into notice values(26, 'jsp란 무엇인가?', 'myoungwon', 'bbbb', sysdate, 0, '');
insert into notice values(27, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');
insert into notice values(28, '허니버터칩', '해태', '존맛개맛', sysdate, 20, '');
insert into notice values(29, '김이연은 누구인가?', '김이연', '오키도키나이키', sysdate, 9, '');
insert into notice values(30, '재미있는 금요일', '서명원', '집에가야지', sysdate, 30, '');
insert into notice values(31, '스피링은 언제나가나', 'SON', '나 또 골 넣었다.', sysdate, 19, '');
insert into notice values(32, '맥북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 99, '');
insert into notice values(33, '윈도우매뉴얼', '빌게이츠', '홈페이지 참조', sysdate, 109, '');
insert into notice values(34, '아이폰북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 55, '');
insert into notice values(35, '갤럭시매뉴얼', '이재용', '홈페이지 참조', sysdate, 66, '');
insert into notice values(36, '앵귤러', '개발자누구냐', '앵귤러가 무엇인고?', sysdate, 10, '');
insert into notice values(37, 'jdbc란 무엇인가?', 'newlec', 'aaaa', sysdate, 0, '');
insert into notice values(38, 'jsp란 무엇인가?', 'myoungwon', 'bbbb', sysdate, 0, '');
insert into notice values(39, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');
insert into notice values(40, '허니버터칩', '해태', '존맛개맛', sysdate, 20, '');
insert into notice values(41, '김이연은 누구인가?', '김이연', '오키도키나이키', sysdate, 9, '');
insert into notice values(42, '재미있는 금요일', '서명원', '집에가야지', sysdate, 30, '');
insert into notice values(43, '스피링은 언제나가나', 'SON', '나 또 골 넣었다.', sysdate, 19, '');
insert into notice values(44, '맥북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 99, '');
insert into notice values(45, '윈도우매뉴얼', '빌게이츠', '홈페이지 참조', sysdate, 109, '');
insert into notice values(46, '아이폰북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 55, '');
insert into notice values(47, '갤럭시매뉴얼', '이재용', '홈페이지 참조', sysdate, 66, '');
insert into notice values(48, '앵귤러', '개발자누구냐', '앵귤러가 무엇인고?', sysdate, 10, '');
insert into notice values(49, 'jdbc란 무엇인가?', 'newlec', 'aaaa', sysdate, 0, '');
insert into notice values(50, 'jsp란 무엇인가?', 'myoungwon', 'bbbb', sysdate, 0, '');
insert into notice values(51, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');
insert into notice values(52, '허니버터칩', '해태', '존맛개맛', sysdate, 20, '');
insert into notice values(53, '김이연은 누구인가?', '김이연', '오키도키나이키', sysdate, 9, '');
insert into notice values(54, '재미있는 금요일', '서명원', '집에가야지', sysdate, 30, '');
insert into notice values(55, '스피링은 언제나가나', 'SON', '나 또 골 넣었다.', sysdate, 19, '');
insert into notice values(56, '맥북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 99, '');
insert into notice values(57, '윈도우매뉴얼', '빌게이츠', '홈페이지 참조', sysdate, 109, '');
insert into notice values(58, '아이폰북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 55, '');
insert into notice values(59, '갤럭시매뉴얼', '이재용', '홈페이지 참조', sysdate, 66, '');
insert into notice values(60, '앵귤러', '개발자누구냐', '앵귤러가 무엇인고?', sysdate, 10, '');
insert into notice values(61, 'jdbc란 무엇인가?', 'newlec', 'aaaa', sysdate, 0, '');
insert into notice values(62, 'jsp란 무엇인가?', 'myoungwon', 'bbbb', sysdate, 0, '');
insert into notice values(63, 'servlet이란 무엇인가?', 'park', 'cccc', sysdate, 11, '');
insert into notice values(64, '허니버터칩', '해태', '존맛개맛', sysdate, 20, '');
insert into notice values(65, '김이연은 누구인가?', '김이연', '오키도키나이키', sysdate, 9, '');
insert into notice values(66, '재미있는 금요일', '서명원', '집에가야지', sysdate, 30, '');
insert into notice values(67, '스피링은 언제나가나', 'SON', '나 또 골 넣었다.', sysdate, 19, '');
insert into notice values(68, '맥북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 99, '');
insert into notice values(69, '윈도우매뉴얼', '빌게이츠', '홈페이지 참조', sysdate, 109, '');
insert into notice values(70, '아이폰북매뉴얼', '스티브잡스', '직관적인데 무슨 매뉴얼 그냥 써', sysdate, 55, '');
insert into notice values(71, '갤럭시매뉴얼', '이재용', '홈페이지 참조', sysdate, 66, '');
insert into notice values(72, '앵귤러', '개발자누구냐', '앵귤러가 무엇인고?', sysdate, 10, '');

select * from notice order by regdate desc;

update notice set id = 3 where title = 'servlet이란 무엇인가?';
select value from v$parameter where name='service_names';
select instance_name, version, status from v$instance;

commit;


----------------------------------------------------------------------------------------------------------
--getNoticeList
select rownum, notice.* from notice order by regdate desc; -- 정렬이 개입되면서 rownum이 엉켜버림

select * from (
    select rownum num, n.* 
    from (select * from notice order by regdate desc) n
)
where num between 11 and 20;

select * from(
    select row_number() over (order  by regdate desc) num,
        notice.* from notice
)
where num between 1 and 5;

--getNoticeCount


--getNotice
select * from notice where id = 10;

--getNextNotice
select * from notice
where id = (select id from notice
            where regdate > (select regdate from notice where id = 3)
            and rownum = 1
);

--getPrevNotice
select * from notice
where id = (select id from (select * from notice order by regdate desc)
            where regdate < (select regdate from notice where id = 3)
            and rownum = 1 
);


-- comment 테이블과  notice 테이블 조인하여 댓글을 위한 준비하기
--1. 댓글을 포함한 테이블과의 조인을 위한 쿼리
select n.id, n.title, n.writer_id, n.regdate, n.hit, n.files, count(c.id) cmt_count
from notice n 
left join "comment" c on  n.id = c.notice_id
group by n.id, n.title, n.writer_id, n.regdate, n.hit, n.files
order by n.regdate desc;

--2. 글의 리스트를 뽑아오는 쿼리
select * from (select rownum num, n.*
                from (select * from notice where title like '%%' order by regdate desc) n 
)
where num between 1 and 10;

--3. 1과 2의 결합을 위해 1의 view를 생성하여 2에서 활용
--view 생성
create view notice_view
as
select n.id, n.title, n.writer_id, n.regdate, n.hit, n.files, count(c.id) cmt_count
from notice n 
left join "comment" c on  n.id = c.notice_id
group by n.id, n.title, n.writer_id, n.regdate, n.hit, n.files;

--2번에서 notice 대신 notice_view활용
select * from (
                select rownum num, n.*
                from (select * from notice_view where title like '%%' order by regdate desc) n 
)
where num between 1 and 10;

commit;






