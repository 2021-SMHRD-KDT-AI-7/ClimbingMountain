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

CREATE TABLE tbl_diary
(
    diary_seq        NUMBER(12, 0)     NOT NULL, 
    diary_subject    VARCHAR2(200)     NOT NULL, 
    diary_content    VARCHAR2(4000)    NOT NULL, 
    reg_date         DATE              DEFAULT SYSDATE NOT NULL, 
    member_id        VARCHAR2(20)      NOT NULL, 
    diary_file1      VARCHAR2(200)     NULL, 
    diary_file2      VARCHAR2(200)     NULL, 
     PRIMARY KEY (diary_seq)
)
/


CREATE TABLE tbl_community
(
    community_seq        NUMBER(12, 0)     NOT NULL, 
    community_subject    VARCHAR2(200)     NOT NULL, 
    community_content    VARCHAR2(4000)    NOT NULL, 
    reg_date             DATE              DEFAULT SYSDATE NOT NULL, 
    community_cnt        NUMBER(12, 0)     DEFAULT 0 NOT NULL, 
    member_id            VARCHAR2(20)      NOT NULL, 
    community_file1      VARCHAR2(200)     NULL, 
    community_file2      VARCHAR2(200)     NULL, 
    community_file3      VARCHAR2(200)     NULL, 
     PRIMARY KEY (community_seq)
)
/



CREATE TABLE tbl_comment
(
    comment_seq        NUMBER(12, 0)     NOT NULL, 
    community_seq      NUMBER(12, 0)     NOT NULL, 
    comment_content    VARCHAR2(4000)    NOT NULL, 
    reg_date           DATE              DEFAULT SYSDATE NOT NULL, 
    member_id          VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (comment_seq)
)
/




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