use indexdb;

create table testtbl(
id int, girl_group varchar(10));

insert into testtbl values(1, '이엑스아이디');
insert into testtbl values(2, '에프터스쿨');
insert into testtbl values(3, '에이오에이');
insert into testtbl values(4, '나인뮤지스');

drop table testtrg;
create table testtrg(id int, girl_group varchar(10), delete_date date);

drop trigger testtbl_delete;

select * from testtbl;
select * from testtrg;

delimiter //
create trigger testtbl_delete -- 트리거 이름
	after delete -- 삭제를 하면
    on testtbl -- 트리거가 발생하는 테이블
    for each row -- 각 행마다 적용
begin
	insert into testtrg values(old.id, old.girl_group, curdate());		-- 원래 테이블과 백업 테이블은 타입만 같으면 됨.
end //
delimiter ;


set @msg = '';
delete from testtbl where girl_group = "에이오에이";
delete from testtbl where id = 4;
select @msg;

