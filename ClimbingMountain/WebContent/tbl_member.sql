CREATE TABLE tbl_member
(
    member_id          VARCHAR2(20)     NOT NULL, 
    member_pwd         VARCHAR2(20)     NOT NULL, 
    member_name        VARCHAR2(20)     NOT NULL, 
    member_addr        VARCHAR2(200)    NOT NULL, 
    member_age         NUMBER(12, 0)    NOT NULL, 
    member_health      VARCHAR2(200)    NOT NULL, 
    member_gender      VARCHAR2(1)      NOT NULL, 
    member_career      NUMBER(12, 0)    NOT NULL, 
    member_joindate    DATE             DEFAULT SYSDATE NOT NULL, 
    admin_yn           VARCHAR2(1)      NOT NULL, 
     PRIMARY KEY (member_id)
)
/