create user 'javadb'@'localhost' identified by '12345';

create database javadb default character set utf8mb4;

grant all privileges on javadb.* to 'javadb'@'localhost';
