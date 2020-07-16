-- 생성자 Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   위치:        2020-05-08 11:11:51 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE TABLE 주문내역 (
    주문번호    NUMBER(20) NOT NULL,
    주문날짜    DATE,
    도서_sno  NUMBER(20) NOT NULL,
    수량      NUMBER(20),
    단가      NUMBER
);

ALTER TABLE 주문내역 ADD CONSTRAINT 주문내역_pk PRIMARY KEY ( 주문번호 );

CREATE TABLE 주문도서 (
    도서_sno  NUMBER(20) NOT NULL,
    도서명     VARCHAR2(20),
    단가      NUMBER(20)
);

ALTER TABLE 주문도서 ADD CONSTRAINT 주문도서_pk PRIMARY KEY ( 도서_sno );

CREATE TABLE 주문회원 (
    회원번호  VARCHAR2(20) NOT NULL,
    주문번호  NUMBER(20) NOT NULL
);

CREATE TABLE 회원정보 (
    회원번호  VARCHAR2(20) NOT NULL,
    회원이름  VARCHAR2(20),
    회원주소  VARCHAR2(20),
    전화번호  VARCHAR2(20)
);

ALTER TABLE 회원정보 ADD CONSTRAINT 회원정보_pk PRIMARY KEY ( 회원번호 );

ALTER TABLE 주문내역
    ADD CONSTRAINT 주문내역_주문도서_fk FOREIGN KEY ( 도서_sno )
        REFERENCES 주문도서 ( 도서_sno );

ALTER TABLE 주문회원
    ADD CONSTRAINT 주문회원_주문내역_fk FOREIGN KEY ( 주문번호 )
        REFERENCES 주문내역 ( 주문번호 );

ALTER TABLE 주문회원
    ADD CONSTRAINT 주문회원_회원정보_fk FOREIGN KEY ( 회원번호 )
        REFERENCES 회원정보 ( 회원번호 );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              6
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
