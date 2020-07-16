create table gamescore(
    name    varchar2(20) not null,
    score   number(8, 0) not null);
    
drop table gamescore;


insert into gamescore values('Á¤¿ì¼º', 12345);
insert into gamescore values('È«±æµ¿', 11345);
insert into gamescore values('±è¼º±Õ', 8698);
insert into gamescore values('±èÃ¶¼ö', 735);
insert into gamescore values('¼Û°­È£', 695);

select * from gamescore;