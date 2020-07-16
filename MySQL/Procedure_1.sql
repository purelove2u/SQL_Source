drop procedure if exists ifProc3;

delimiter //
create procedure ifProc3(score int)
begin
declare point int;	-- 변수
declare credit char(4);	-- 변수

set point = score;

if point > 100 then
signal sqlstate '45000'
	set message_text = '100점 이상의 점수는 판단할 수 없습니다.';
elseif point >= 90 then -- 조건이 ture일 때만 아래줄 실행
set credit = 'A';	-- true
elseif point >= 80 then
set credit = 'B';
elseif point >= 70 then
set credit = 'C';
elseif point >= 60 then
set credit = 'D';
elseif point < 60 && point >= 0 then -- 그 밖에 또는 나머지 조건
set credit = 'F';
else 
signal sqlstate '45000'
	set message_text = '0점 이하의 점수는 판단할 수 없습니다.';
end if;
select concat('취득점수==>', point), concat('학점은==>', credit);	-- concat: 이어서 여러개 출력
end //
delimiter ;

call ifProc3(199)
