CREATE TABLE tbl_mountain
(
	MOUNTAIN_SEQ     NUMBER(12, 0)    ,
    PMNTN_SN         NUMBER(30,14)    NOT NULL, 
    MNTN_CODE        NUMBER(12, 0)    NOT NULL, 
    MNTN_NM          VARCHAR2(50)     NOT NULL, 
    PMNTN_NM         VARCHAR2(50)     NULL, 
    PMNTN_MAIN       VARCHAR2(200)     NULL, 
    PMNTN_LT         NUMBER(12, 3)    NOT NULL, 
    PMNTN_DFFL       VARCHAR2(20)     , 
    PMNTN_UPPL       NUMBER(12, 3)    NOT NULL,
    PMNTN_GODN       NUMBER(12, 3)    NOT NULL, 
    PMNTN_MTRQ       VARCHAR2(50)     NULL, 
    PMNTN_CNRL       VARCHAR2(1)      NULL, 
    PMNTN_CLS        VARCHAR2(1)      NULL, 
    PMNTN_RISK       VARCHAR2(200)     NULL, 
    PMNTN_RECO       VARCHAR2(1)      NULL, 
    mountain_pic1    VARCHAR2(200)    NULL, 
    mountain_pic2    VARCHAR2(200)    NULL, 
    mountain_pic3    VARCHAR2(200)    NULL, 
    DATA_STDR        DATE             DEFAULT SYSDATE,
    MNTN_ID          VARCHAR2(50)     NULL, 
    PRIMARY KEY (MOUNTAIN_SEQ) 
)

select * from tbl_mountain where MOUNTAIN_SEQ = 120

CREATE SEQUENCE tbl_mountain_SEQ
START WITH 1
INCREMENT BY 1 
NOCACHE;
  
CREATE OR REPLACE TRIGGER tbl_mountain_AI_TRG
BEFORE INSERT ON tbl_mountain 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_mountain_SEQ.NEXTVAL
    INTO :NEW.MOUNTAIN_SEQ
    FROM DUAL;
END;

select * from user_sequences
select * from user_trriggers
select status from user_triggers
drop sequence tbl_mountain_SEQ
drop trigger tbl_mountain_AI_TRG
drop table tbl_mountain