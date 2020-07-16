create table a(
num int primary key not null);

create table b(
num int primary key not null,
foreign key(num) references a(num));

insert into a values(1);
insert into a values(2);
insert into a values(3);
insert into a values(4);
insert into a values(5);
insert into a values(6);

insert into b values(3);
insert into b values(4);
insert into b values(5);
insert into b values(6);

select * from a;
select * from b;

select * from a join b on a.num = b.num;
select * from a left join b on a.num = b.num;
select * from a right join b on a.num = b.num;

