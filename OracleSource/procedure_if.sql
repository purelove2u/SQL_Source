DROP PROCEDURE IF EXISTS ifProc_val;

DELIMITER $$
create procedure ifProc_val(in val int) -- 100
begin
DECLARE point int; -- 변수
DECLARE Credit char(4); -- 변수

SET point =val; -- 100
if point>100 then
SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT='100점 이상은 판단 할 수 없습니다.';
elseif point >=90 then -- 조건
set Credit ='A'; -- 실행문 (TRUE)
elseif point >= 80 then
set Credit='B';
elseif point >= 70 then
set Credit='C';
elseif point >=60 then 
set Credit ='D';
elseif point <60 && point >=0 then
set Credit = 'F';
else 
SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT='0점 이하의 점수는 판단 할 수 없습니다.';
end if;
select concat('취득점수==>',point), -- concat:이어서 여러개 출력
       concat('학점은==>',Credit);
end $$
DELIMITER ;

 -- #####################################

call ifProc_val(80);
