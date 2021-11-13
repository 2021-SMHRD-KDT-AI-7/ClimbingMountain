CREATE TABLE tbl_routine
(
    routine_seq         NUMBER(12, 0)    NOT NULL, 
    routine_name        VARCHAR2(200)    NOT NULL, 
    routine_start       VARCHAR2(50)     NOT NULL, 
    routine_end         VARCHAR2(50)     NOT NULL, 
    mountain_seq        NUMBER(12, 0)    NOT NULL, 
    routine_level       NUMBER(12, 1)    NOT NULL, 
    routine_uptime      VARCHAR2(20)     NOT NULL, 
    routine_downtime    VARCHAR2(20)     NOT NULL, 
    routine_length      NUMBER(12, 0)    NOT NULL, 
    reg_date            DATE             DEFAULT SYSDATE NOT NULL, 
    member_id           VARCHAR2(20)     NOT NULL, 
--     PRIMARY KEY (routine_seq)
)
/