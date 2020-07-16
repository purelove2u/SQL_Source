use sqldb;

create table sungjuk(
id int(10),
score int(10));

insert into sungjuk values(1, 80);
insert into sungjuk values(2, 70);
insert into sungjuk values(3, 60);
insert into sungjuk values(4, 50);
insert into sungjuk values(5, 90);
insert into sungjuk values(6, 96);

select * from sungjuk

delimiter //
create procedure score()
begin
select *, 
	(case when score >= 90 then 'A학점'
		when (score >= 80 && score < 90) then 'B학점'
        when (score >= 70 && score < 80) then 'C학점'
        when (score >= 60 && score < 70) then 'D학점'
        else 'F학점'
        end) as '학점'
from sungjuk;
end //
delimiter ;

drop procedure score;
call score();