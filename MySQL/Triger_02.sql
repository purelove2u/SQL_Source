use sqldb;

drop table backup_usertbl;
create table backup_usertbl(
userid char(8) not null primary key,
name varchar(10) not null,
birthyear int(10) not null,
addr char(2) not null,
mobile1 char(3),
mobile2 char(8),
height smallint,
mdate date,
delete_date date,
muser varchar(256));

drop trigger if exists backupusertbl_delete;

drop trigger backupusertbl_delete;

delimiter //
create trigger backupusertbl_delete
	after delete
    on usertbl
    for each row
begin
	insert into backup_usertbl values(old.userid, old.name, old.birthyear, old.addr, old.mobile1, old.mobile2, old.height, old.mdate, curdate(), current_user());
end //
delimiter ;

select * from backup_usertbl;
select * from usertbl;

delete from buytbl where userid = 'bbk';
delete from usertbl where name = '바비킴';