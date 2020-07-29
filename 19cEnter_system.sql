
-- PDB 炼雀
select name from v$pdbs;


-- PDB 积己
create pluggable database hrpdb admin user dba1 identified by password;
create pluggable database pdb1 admin user hrpdb identified by password;


-- 寇何立加 倾侩
EXEC dbms_xdb.setlistenerlocalaccess(false);