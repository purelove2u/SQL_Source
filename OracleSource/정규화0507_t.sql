CREATE TABLE Summer
(   sid 	NUMBER,
    class 	VARCHAR2(20),
    price 	NUMBER
);

INSERT INTO Summer VALUES (100, 'JAVA', 20000);
INSERT INTO Summer VALUES (150, 'Python', 15000);
INSERT INTO Summer VALUES (200, 'C++', 25000);
INSERT INTO Summer VALUES (250, 'JAVA', 20000);

select * from summer;
select sid,class from summer;
select price from summer where class='C++';

select DISTINCT class
from summer
where price IN (select max(price) 
                from summer);
                
select count(*),sum(price)
from summer;

-- �����̻�����
select price "C++ ������" from summer where class='C++';

/* 200�� �л��� ������� */
delete from summer
where sid=200;

select price "C++ ������" from summer where class='C++';

-- �����̻� (NULL)
/* JAVA ���� ���� */
insert into summer VALUES(NULL,'JAVA',25000);

/*�����ο� �˻�*/
SELECT count(*) "�����ο�"
from summer;
-- ==============================
SELECT count(sid) "�����ο�"
from summer;

SELECT count(*) "�����ο�"
from summer
where sid is not NULL;

-- �����̻�����
select * from summer;

update summer
set price=15000
where class='JAVA';

select DISTINCT price "JAVA ������"
from summer
where class='JAVA';
-- =====================================
update summer
set price=20000
where class='JAVA' and sid=100;

update summer
set price=20000
where class='JAVA';

-- ������ �����б� �����ͺ��̽�
drop table summerPrice; -- sid class
drop table summerEnroll; -- class price

/* SummerPrice ���̺� ���� */
CREATE TABLE SummerPrice
(   class VARCHAR2(20),
    price NUMBER
);
INSERT INTO SummerPrice VALUES ('JAVA', 20000);
INSERT INTO SummerPrice VALUES ('Python', 15000);
INSERT INTO SummerPrice VALUES ('C++', 10000);

/* SummerEnroll ���̺� ���� */
CREATE TABLE SummerEnroll
(   sid NUMBER,
    class VARCHAR2(20)
);
INSERT INTO SummerEnroll VALUES (100, 'JAVA');
INSERT INTO SummerEnroll VALUES (150, 'Python');
INSERT INTO SummerEnroll VALUES (200, 'C++');
INSERT INTO SummerEnroll VALUES (250, 'JAVA');


-- ����
select price "C++ ������" from SummerPrice where class='C++';

/* 200�� �л��� ������� */
delete from Summerenroll
where sid=200;

select price "C++ ������" from SummerPrice where class='C++';

-- ���� (NULL)
/* JAVA ���� ���� */
insert into SummerPrice VALUES('JAVA',25000);

/*�����ο� �˻�*/
SELECT count(*) "�����ο�"
from SummerPrice;

-- ����
select * from SummerPrice;

update SummerPrice
set price=15000
where class='JAVA';

select DISTINCT price "JAVA ������"
from SummerPrice
where class='JAVA';





