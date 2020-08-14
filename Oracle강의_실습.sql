insert into member(id, pwd) values('myoungwon', '12345');
insert into member(id, pwd) values('dragon', '12345');
insert into member(id, pwd) values('test', '12345');

select id "UserID", name, pwd from member;

update member set pwd='111' where id = 'myoungwon';
update member set pwd = '333', name = '손오공' where id = 'dragon';
update member set name = '서명원' where id = 'myoungwon';

delete member where id = 'test';

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

