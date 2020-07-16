-- ������ Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   ��ġ:        2020-05-08 11:11:51 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



CREATE TABLE �ֹ����� (
    �ֹ���ȣ    NUMBER(20) NOT NULL,
    �ֹ���¥    DATE,
    ����_sno  NUMBER(20) NOT NULL,
    ����      NUMBER(20),
    �ܰ�      NUMBER
);

ALTER TABLE �ֹ����� ADD CONSTRAINT �ֹ�����_pk PRIMARY KEY ( �ֹ���ȣ );

CREATE TABLE �ֹ����� (
    ����_sno  NUMBER(20) NOT NULL,
    ������     VARCHAR2(20),
    �ܰ�      NUMBER(20)
);

ALTER TABLE �ֹ����� ADD CONSTRAINT �ֹ�����_pk PRIMARY KEY ( ����_sno );

CREATE TABLE �ֹ�ȸ�� (
    ȸ����ȣ  VARCHAR2(20) NOT NULL,
    �ֹ���ȣ  NUMBER(20) NOT NULL
);

CREATE TABLE ȸ������ (
    ȸ����ȣ  VARCHAR2(20) NOT NULL,
    ȸ���̸�  VARCHAR2(20),
    ȸ���ּ�  VARCHAR2(20),
    ��ȭ��ȣ  VARCHAR2(20)
);

ALTER TABLE ȸ������ ADD CONSTRAINT ȸ������_pk PRIMARY KEY ( ȸ����ȣ );

ALTER TABLE �ֹ�����
    ADD CONSTRAINT �ֹ�����_�ֹ�����_fk FOREIGN KEY ( ����_sno )
        REFERENCES �ֹ����� ( ����_sno );

ALTER TABLE �ֹ�ȸ��
    ADD CONSTRAINT �ֹ�ȸ��_�ֹ�����_fk FOREIGN KEY ( �ֹ���ȣ )
        REFERENCES �ֹ����� ( �ֹ���ȣ );

ALTER TABLE �ֹ�ȸ��
    ADD CONSTRAINT �ֹ�ȸ��_ȸ������_fk FOREIGN KEY ( ȸ����ȣ )
        REFERENCES ȸ������ ( ȸ����ȣ );



-- Oracle SQL Developer Data Modeler ��� ����: 
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
