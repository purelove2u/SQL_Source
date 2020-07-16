
create table update_usertbl(
userid char(8) not null primary key,
name varchar(10) not null,
birthyear int(10) not null,
addr char(2) not null,
mobile1 char(3),
mobile2 char(8),
height smallint,
mdate date,
mtype char(2),
delete_date date,
muser varchar(256));

delimiter //
create trigger backupusertbl_update
	after update
    on usertbl
    for each row
begin
	insert into update_usertbl values(old.userid, old.name, old.birthyear, old.addr, old.mobile1, old.mobile2, old.height, old.mdate, '수정', curdate(), current_user());
end //
delimiter ;


update usertbl set mobile1 = "019" where name = "임재범";

select * from usertbl;
select * from update_usertbl;
