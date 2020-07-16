-- ������ Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   ��ġ:        2020-05-12 10:19:19 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



CREATE TABLE ��ȣ�� (
    ��ȣ��id  VARCHAR2(20) NOT NULL,
    ������   VARCHAR2(20),
    ����     VARCHAR2(20),
    ����     VARCHAR2(10),
    ��ȭ��ȣ   VARCHAR2(20),
    �̸���    VARCHAR2(20),
    ����     VARCHAR2(20)
);

ALTER TABLE ��ȣ�� ADD CONSTRAINT ��ȣ��_pk PRIMARY KEY ( ��ȣ��id );

CREATE TABLE �ǻ� (
    �ǻ�id    VARCHAR2(20) NOT NULL,
    ����������  VARCHAR2(20),
    ����      VARCHAR2(20),
    ����      VARCHAR2(10),
    ��ȭ��ȣ    VARCHAR2(20),
    �̸���     VARCHAR2(20),
    ����      VARCHAR2(20)
);

ALTER TABLE �ǻ� ADD CONSTRAINT �ǻ�_pk PRIMARY KEY ( �ǻ�id );

CREATE TABLE ���� (
    ����id  VARCHAR2(20) NOT NULL,
    ȯ��id  VARCHAR2(20) NOT NULL,
    �ǻ�id  VARCHAR2(20) NOT NULL,
    ���᳻��  VARCHAR2(20),
    ���ᳯ¥  DATE
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ����id );

CREATE TABLE ��Ʈ (
    ��Ʈ��ȣ   NUMBER(20) NOT NULL,
    ����id   VARCHAR2(20) NOT NULL,
    �ǻ�id   VARCHAR2(20) NOT NULL,
    ȯ��id   VARCHAR2(20) NOT NULL,
    ��ȣ��id  VARCHAR2(20) NOT NULL,
    ��Ʈ����   VARCHAR2(40)
);

ALTER TABLE ��Ʈ ADD CONSTRAINT ��Ʈ_pk PRIMARY KEY ( ��Ʈ��ȣ );

CREATE TABLE ȯ�� (
    ȯ��id   VARCHAR2(20) NOT NULL,
    ��ȣ��id  VARCHAR2(20) NOT NULL,
    �ǻ�id   VARCHAR2(20) NOT NULL,
    ȯ�ڼ���   VARCHAR2(20),
    ȯ�ڼ���   VARCHAR2(10),
    �ֹι�ȣ   VARCHAR2(20),
    �ּ�     VARCHAR2(40),
    ��ȭ��ȣ   VARCHAR2(20),
    �̸���    VARCHAR2(20),
    ����     VARCHAR2(20)
);

ALTER TABLE ȯ�� ADD CONSTRAINT ȯ��_pk PRIMARY KEY ( ȯ��id );

ALTER TABLE ����
    ADD CONSTRAINT ����_�ǻ�_fk FOREIGN KEY ( �ǻ�id )
        REFERENCES �ǻ� ( �ǻ�id );

ALTER TABLE ����
    ADD CONSTRAINT ����_ȯ��_fk FOREIGN KEY ( ȯ��id )
        REFERENCES ȯ�� ( ȯ��id );

ALTER TABLE ��Ʈ
    ADD CONSTRAINT ��Ʈ_��ȣ��_fk FOREIGN KEY ( ��ȣ��id )
        REFERENCES ��ȣ�� ( ��ȣ��id );

ALTER TABLE ��Ʈ
    ADD CONSTRAINT ��Ʈ_����_fk FOREIGN KEY ( ����id )
        REFERENCES ���� ( ����id );

ALTER TABLE ȯ��
    ADD CONSTRAINT ȯ��_��ȣ��_fk FOREIGN KEY ( ��ȣ��id )
        REFERENCES ��ȣ�� ( ��ȣ��id );

ALTER TABLE ȯ��
    ADD CONSTRAINT ȯ��_�ǻ�_fk FOREIGN KEY ( �ǻ�id )
        REFERENCES �ǻ� ( �ǻ�id );



-- Oracle SQL Developer Data Modeler ��� ����: 
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
