set TRANSACTION ISOLATION level SERIALIZABLE;

select sum(price) �Ѿ� from book;

create tablespace md_tbs
datafile 'c:\madang\oradata\md_tbs_data01.dbf'
size 10M;

create TABLESPACE md_test
datafile 'c:\madang\oradata\md_test_data01.dbf'
size 20M;

-- ��Ϻ���
select * from dba_tablespaces;
select tablespace_name, status, contents from dba_tablespaces;
-- ���Ͽ뷮
select * from dba_data_files;
select file_name, tablespace_name, bytes, status from dba_data_files;

-- ���� ���� Ȯ��
select * from dba_free_space;
select tablespace_name, bytes, blocks from dba_free_space;

-- �������� �� �����̽� ����
-- mdguest
create user mdguest IDENTIFIED by mdguest;
-- mdguest2 ������ �����̽� �Ҵ�
create user mdguest2 IDENTIFIED by mdguest2
default tablespace md_tbs;
-- ����
grant connect, resource to mdguest;
grant connect, resource to mdguest2;

-- ���̺� �����̽� ����
drop tablespace md_test INCLUDING CONTENTS and DATAFILES;

--mdguest ���� book���̺��� select ���� �ο�
grant select on madang.book to mdguest;
--mdguest ���� customer ���̺��� select�� update ���� ���� �ο�
-- �� �ٸ� ����ڿ��� �㰡�� �� �ִ� ���� �߰�
grant select, update on madang.customer to mdguest with grant option;

--mdguest ���� ���¿��� book��ӿ���  ������ ������ (book���̺� ���� ���Ѹ��� �ο���)
grant select on madang.book to mdguest2;
--mdguest ���� ���¿��� customer��ӿ���  �����۵��Ǿ���
--(customer ���̺� ���� ������ �ο��ϸ鼭 with grant option���� Ÿ ����ڿ� ���� ���� �㰡���ѵ� �ο��߱� ����)
grant select on madang.customer to mdguest2;

-- orders ���̺� ���Ͽ� ��� ����ڰ� select �� �� �ֵ��� ���� �ο�
grant select on madang.orders to public;

/* ���� ��� REBOKE : from / CASCADE(:������)
            GRANT : to / with grant option */
            
-- mdguest �������
REVOKE select on customer from mdguest;
-- mdguest2 �������
REVOKE select on book from mdguest2;

REVOKE select on customer from mdguest CASCADE CONSTRAINTS; -- mdguest�� �ο��� �Ϳ� ���� �� ���� ȸ��
REVOKE update on customer from mdguest CASCADE CONSTRAINTS;


