insert into member(id, pwd) values('myoungwon', '12345');
insert into member(id, pwd, name, age) values('you', '12345', '유재석', 49);
insert into member(id, pwd, name, age) values('kanghd', '12345', '강호동', 50);
insert into member(id, pwd, name, age) values('kimym', '12345', '김용만', 51);
insert into member(id, pwd, name, age) values('kimdh', '12345', '김두한', 80);
insert into member(id, pwd, name, age) values('dragonball', '12345', '손오공', 100);
insert into member(id, pwd, name, age) values('youks', '12345', '유관순', 17);


select id "UserID", name, pwd from member;

update member set pwd='111' where id = 'myoungwon';
update member set pwd = '333', name = '손오공' where id = 'dragon';
update member set name = '서명원' where id = 'myoungwon';

delete member where pwd = '12345';

commit; 
rollback;

select hit+1 hit from notice;
-- dual 은 더미 연산자
-- oracle은 절대 사칙연산기호로 문자열을 연산하지 않음
-- ==> '3'이 숫자로 바뀌어서 연산됨
select 1 + '3' from dual; -- 결과 : 4

-- 문자열 연산기호 '||'
select '3' || 10 from dual;  -- 결과 : 310

select name || '(' || id || ')' from member;

select * from notice where hit > 3;

select * from notice where content is null;

select * from notice where hit in (0, 2, 7);
select * from notice where hit not in (0, 2, 7);

select * from member where name like '서%';
select * from member where name like '서__';

select * from notice where title like 'j%';
select * from notice where title like 'j_________';

select * from notice where title not like 'j%';

select * from member where name like '%명%';
select * from notice where title like '%db%';

select * from notice where rownum between 1 and 5;
select * from notice where rownum between 6 and 10;

select rownum num, notice.* from notice;
select * from(
            select rownum num, notice.* from notice)
where num between 6 and 10;

update member set age = 37 where name = '서명원';
update member set age = 99 where name = '손오공';

select age from member;
