
-- PDB ��ȸ
select name from v$pdbs;


-- PDB ����
create pluggable database hrpdb admin user dba1 identified by password;
create pluggable database pdb1 admin user hrpdb identified by password;


-- �ܺ����� ���
EXEC dbms_xdb.setlistenerlocalaccess(false);