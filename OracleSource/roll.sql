-- ROLE : 데이터베이스 객체에 대한 권한을 모아둔 집합
-- 1. programmer 라는 역할을 생성
create ROLE programmer; 

-- 2. programmer 역할에 create ANY table 과 create ANY VIEW 권한을 부여
grant create any table, create any view to programmer;

-- 3. mdguest 에게 programmer역할 권한을 부여
grant programmer to mdguest;

-- 4. mdguest 에게서 programmer 역할 권한 회수
revoke programmer from mdguest;
