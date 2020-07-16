select cast('2020-10-08 12:00:00' as date) as 'date';
select cast('2020-10-08 12:00:00' as time) as 'time';
select cast('2020-10-08 12:00:00' as datetime) as 'datetime';

use sqldb;
set @myvar1 = 5;
set @myvar2 = 3;
set @myvar3 = 4.25;
set @myvar4 = '가수 이름 -->';

select @myvar1;
select @myvar2 + @myvar3;
select round(@myvar2 + @myvar3, 2); -- round : 소숫점 잘라내기
select @myvar4, name from usertbl where height > 180;

select name, height from usertbl order by height;
prepare myQuery from 'select name, height from usertbl order by height limit ?';
execute myQuery using @myvar1;


select * from buytbl;
select round(avg (price)) as '평균구매액' from buytbl;  -- round(value, 소수점자리수) 함수로 소수점 제거
select cast(avg (price) as signed integer) '평균구매액' from buytbl; -- signed integer로 형변환을 통해 소수점 제거

select 100 + 200;
select (100, '+', 200); -- select문은 요소 하나만을 처리할 수 있기 때문에 오류가 남.
select concat(100, '+', 200); -- concat()을 사용하면 이어서 계속 출력
select concat('안녕', ' ', 'MySql') as 'Hi';
select concat(3000, 'X', 3);

select num, concat(price, 'x', amount, '=') as '수식', price * amount as '구매액' from buytbl;