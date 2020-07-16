create user javadb identified by 12345 default tablespace users temporary tablespace temp;

grant connect, resource to javadb;
