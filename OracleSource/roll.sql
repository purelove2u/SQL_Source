-- ROLE : �����ͺ��̽� ��ü�� ���� ������ ��Ƶ� ����
-- 1. programmer ��� ������ ����
create ROLE programmer; 

-- 2. programmer ���ҿ� create ANY table �� create ANY VIEW ������ �ο�
grant create any table, create any view to programmer;

-- 3. mdguest ���� programmer���� ������ �ο�
grant programmer to mdguest;

-- 4. mdguest ���Լ� programmer ���� ���� ȸ��
revoke programmer from mdguest;
