set TRANSACTION ISOLATION level SERIALIZABLE;

select sum(price) 총액 from book;

create tablespace md_tbs
datafile 'c:\madang\oradata\md_tbs_data01.dbf'
size 10M;

create TABLESPACE md_test
datafile 'c:\madang\oradata\md_test_data01.dbf'
size 20M;

-- 목록보기
select * from dba_tablespaces;
select tablespace_name, status, contents from dba_tablespaces;
-- 파일용량
select * from dba_data_files;
select file_name, tablespace_name, bytes, status from dba_data_files;

-- 남은 공간 확인
select * from dba_free_space;
select tablespace_name, bytes, blocks from dba_free_space;

-- 계정생성 및 스페이스 적용
-- mdguest
create user mdguest IDENTIFIED by mdguest;
-- mdguest2 생성과 스페이스 할당
create user mdguest2 IDENTIFIED by mdguest2
default tablespace md_tbs;
-- 권한
grant connect, resource to mdguest;
grant connect, resource to mdguest2;

-- 테이블 스페이스 삭제
drop tablespace md_test INCLUDING CONTENTS and DATAFILES;

--mdguest 에게 book테이블의 select 권한 부여
grant select on madang.book to mdguest;
--mdguest 에게 customer 테이블의 select와 update 권한 동시 부여
-- 단 다른 사용자에게 허가할 수 있는 권한 추가
grant select, update on madang.customer to mdguest with grant option;

--mdguest 접속 상태에서 book상속여부  에러가 나야함 (book테이블에 대한 권한만을 부여함)
grant select on madang.book to mdguest2;
--mdguest 접속 상태에서 customer상속여부  정상작동되야함
--(customer 테이블에 대한 권한을 부여하면서 with grant option으로 타 사용자에 대한 권한 허가권한도 부여했기 때문)
grant select on madang.customer to mdguest2;

-- orders 테이블에 대하여 모든 사용자가 select 할 수 있도록 권한 부여
grant select on madang.orders to public;

/* 권한 취소 REBOKE : from / CASCADE(:연속적)
            GRANT : to / with grant option */
            
-- mdguest 권한취소
REVOKE select on customer from mdguest;
-- mdguest2 권한취소
REVOKE select on book from mdguest2;

REVOKE select on customer from mdguest CASCADE CONSTRAINTS; -- mdguest가 부여한 것에 대한 것 까지 회수
REVOKE update on customer from mdguest CASCADE CONSTRAINTS;


