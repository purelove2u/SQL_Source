create table gamescore(
    name    varchar2(20) not null,
    score   number(8, 0) not null);
    
drop table gamescore;


insert into gamescore values('���켺', 12345);
insert into gamescore values('ȫ�浿', 11345);
insert into gamescore values('�輺��', 8698);
insert into gamescore values('��ö��', 735);
insert into gamescore values('�۰�ȣ', 695);

select * from gamescore;