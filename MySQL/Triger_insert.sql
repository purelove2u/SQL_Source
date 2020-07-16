
delimiter //
create trigger backupusertbl_insert
	after insert
    on usertbl
    for each row
begin
	signal sqlstate '45000'	-- 서버에서 차단된 상태
		set message_text = '데이터의 입력을 시도했습니다. 귀하의 정보가 서버에 입력되었습니다.';
end //
delimiter ;


insert into usertbl values('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
insert into usertbl values('NLM', '폴킴', 1994, '서울', '011', '55555555', 182, '2019-5-5');

select * from usertbl;
