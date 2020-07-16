-- insert into
insert into membertbl values('Han', '한주연', '인천 남구 주안동');
insert into membertbl values('Jee', '지운이', '서울시 은평구 증산동');
insert into membertbl values('sang', '상길이', '경기 성남시 분당구');

insert into producttbl values('냉장고', 5, '2019-02-01', '대우', 22);
insert into producttbl values('세탁기', 20, '2020-09-01', 'LG', 3);
insert into producttbl values('컴퓨터', 10, '2018-01-01', '삼성', 17);

-- select
select * from membertbl;
select * from producttbl;

select * from membertbl where membername = '한주연';
select * from producttbl where productname = '냉장고';
select productname from producttbl;
select productname, cost from producttbl;
select * from producttbl where amount >= 15;
select productname from producttbl where amount >= 15;

select membername, memberaddress from membertbl;

-- delete
delete from membertbl where membername = '지운이';
delete from producttbl where cost = 5 ;

-- update
update producttbl set cost = 800000 where productname = '세탁기'; 
-- 회사가 삼성인 가전제품에 대하여 원가를 960000 원으로 수정하시오
update producttbl set cost = 960000 where company = '삼성';
-- 한주연의 주소를 경기도 일산동구 식사동 으로 변경
update membertbl set memberaddress = "경기도 일산동구 식사동" where membername = "한주연";
