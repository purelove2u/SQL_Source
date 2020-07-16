select * from buytbl;
select * from usertbl;

select userid, amount from buytbl;
select userid, amount from buytbl order by userid;
select userid, amount from buytbl order by amount;
select userid, amount from buytbl order by userid, amount;
-- order by asc : 오름차순, order by desc : 내림차순
select userid, sum(amount) as '총구매 개수', sum(price * amount) as '총 구매 액' from buytbl group by userid order by sum(price * amount) asc;
select userid, sum(amount) as '총구매 개수', sum(price * amount) as '총 구매 액' from buytbl group by userid order by sum(price * amount) desc;

select userid as '사용자 아이디', avg(price * amount) as '평균 구매액' from buytbl group by userid;


select usertbl.userid, name, sum(price * amount) as '총구매액' from usertbl  join buytbl on buytbl.userid = usertbl.userid group by userid;
select usertbl.userid, name, sum(price * amount) as '총구매액' from usertbl  left join buytbl on buytbl.userid = usertbl.userid group by userid order by sum(price * amount);
select usertbl.userid, name, sum(price * amount) as '총구매액' from buytbl  right join usertbl on buytbl.userid = usertbl.userid group by userid order by sum(price * amount);

update buytbl set price = 30000 where prodname  = '운동화';
update buytbl set price = 800000 where prodname  = '노트북';
update buytbl set price = 500000 where prodname  = '모니터';
update buytbl set price = 38000 where prodname  = '청바지';
update buytbl set price = 25000 where prodname  = '책';

drop procedure customer;
delimiter $$
create procedure customer()
begin
select usertbl.userid, name, sum(price * amount) as '총구매액', 
(case when sum(price * amount) >= 800000 then '최우수 고객'
	when (sum(price * amount) >= 500000 && sum(price * amount) < 800000) then '우수 고객'
    when (sum(price * amount) >= 100000 && sum(price * amount) < 500000) then '일반 고객'
	else '유령고객' 
end) as '고객등급'
from usertbl left join buytbl on buytbl.userid = usertbl.userid group by userid order by sum(price * amount) desc;
end $$
delimiter ;


call customer();