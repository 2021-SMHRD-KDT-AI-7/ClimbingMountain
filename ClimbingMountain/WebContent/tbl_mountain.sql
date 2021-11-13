CREATE TABLE tbl_mountain
(
    mountain_seq          NUMBER(12, 0)    NOT NULL, 
    mountain_name         VARCHAR2(20)     NOT NULL, 
    mountain_latitude     NUMBER(17,14)    NOT NULL, 
    mountain_longitude    NUMBER(17,14)    NOT NULL, 
    mountain_height       NUMBER(12, 1)    NOT NULL, 
    mountain_addr         VARCHAR2(200)    NOT NULL, 
    reg_date              DATE             DEFAULT SYSDATE NOT NULL, 
    member_id             VARCHAR2(20)     NOT NULL, 
    mountain_pic1         VARCHAR2(200)    NULL, 
    mountain_pic2         VARCHAR2(200)    NULL, 
    mountain_pic3         VARCHAR2(200)    NULL, 
     PRIMARY KEY (mountain_seq)
)
/