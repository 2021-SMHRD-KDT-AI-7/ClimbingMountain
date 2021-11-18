

CREATE TABLE TBL_MOUNTAINCODE
(
    mountaincode_seq	NUMBER(12, 0)     NOT NULL, 
    mountaincode_name	VARCHAR2(50)     NOT NULL, 
    mountaincode_location	VARCHAR2(50)    NOT NULL, 
    mountaincode_code	VARCHAR2(20)    NOT NULL,
    PRIMARY KEY (mountaincode_code)
)


CREATE SEQUENCE tbl_mountaincode_SEQ
START WITH 1
INCREMENT BY 1 
NOCACHE;

drop sequence tbl_mountaincode_SEQ
/* 11��17�� Ʈ����x fk ���� x */

select * from TBL_MOUNTAINCODE
select * from TBL_MOUNTAINCODE where mountaincode_name LIKE '%��%'
drop table TBL_MOUNTAINCODE;