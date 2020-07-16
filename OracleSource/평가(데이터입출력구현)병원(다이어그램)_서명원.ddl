-- 생성자 Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   위치:        2020-05-12 10:19:19 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE TABLE 간호사 (
    간호사id  VARCHAR2(20) NOT NULL,
    담당업무   VARCHAR2(20),
    성명     VARCHAR2(20),
    성별     VARCHAR2(10),
    전화번호   VARCHAR2(20),
    이메일    VARCHAR2(20),
    직급     VARCHAR2(20)
);

ALTER TABLE 간호사 ADD CONSTRAINT 간호사_pk PRIMARY KEY ( 간호사id );

CREATE TABLE 의사 (
    의사id    VARCHAR2(20) NOT NULL,
    담당진료과목  VARCHAR2(20),
    성명      VARCHAR2(20),
    성별      VARCHAR2(10),
    전화번호    VARCHAR2(20),
    이메일     VARCHAR2(20),
    직급      VARCHAR2(20)
);

ALTER TABLE 의사 ADD CONSTRAINT 의사_pk PRIMARY KEY ( 의사id );

CREATE TABLE 진료 (
    진료id  VARCHAR2(20) NOT NULL,
    환자id  VARCHAR2(20) NOT NULL,
    의사id  VARCHAR2(20) NOT NULL,
    진료내용  VARCHAR2(20),
    진료날짜  DATE
);

ALTER TABLE 진료 ADD CONSTRAINT 진료_pk PRIMARY KEY ( 진료id );

CREATE TABLE 차트 (
    차트번호   NUMBER(20) NOT NULL,
    진료id   VARCHAR2(20) NOT NULL,
    의사id   VARCHAR2(20) NOT NULL,
    환자id   VARCHAR2(20) NOT NULL,
    간호사id  VARCHAR2(20) NOT NULL,
    차트내용   VARCHAR2(40)
);

ALTER TABLE 차트 ADD CONSTRAINT 차트_pk PRIMARY KEY ( 차트번호 );

CREATE TABLE 환자 (
    환자id   VARCHAR2(20) NOT NULL,
    간호사id  VARCHAR2(20) NOT NULL,
    의사id   VARCHAR2(20) NOT NULL,
    환자성명   VARCHAR2(20),
    환자성별   VARCHAR2(10),
    주민번호   VARCHAR2(20),
    주소     VARCHAR2(40),
    전화번호   VARCHAR2(20),
    이메일    VARCHAR2(20),
    직업     VARCHAR2(20)
);

ALTER TABLE 환자 ADD CONSTRAINT 환자_pk PRIMARY KEY ( 환자id );

ALTER TABLE 진료
    ADD CONSTRAINT 진료_의사_fk FOREIGN KEY ( 의사id )
        REFERENCES 의사 ( 의사id );

ALTER TABLE 진료
    ADD CONSTRAINT 진료_환자_fk FOREIGN KEY ( 환자id )
        REFERENCES 환자 ( 환자id );

ALTER TABLE 차트
    ADD CONSTRAINT 차트_간호사_fk FOREIGN KEY ( 간호사id )
        REFERENCES 간호사 ( 간호사id );

ALTER TABLE 차트
    ADD CONSTRAINT 차트_진료_fk FOREIGN KEY ( 진료id )
        REFERENCES 진료 ( 진료id );

ALTER TABLE 환자
    ADD CONSTRAINT 환자_간호사_fk FOREIGN KEY ( 간호사id )
        REFERENCES 간호사 ( 간호사id );

ALTER TABLE 환자
    ADD CONSTRAINT 환자_의사_fk FOREIGN KEY ( 의사id )
        REFERENCES 의사 ( 의사id );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
