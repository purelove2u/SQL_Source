use sqldb;

-- sqldb buytbl에서 amount 5개 이상인것만 검색
-- stored procedures로 생성

-- stored
delimiter //

create procedure amount()

begin
	select * from buytbl where amount >= 5;
end;

delimiter;



delimiter //
create procedure mproc()

begin
select * from membertbl where membername = '상길이';
end;

delimiter;


