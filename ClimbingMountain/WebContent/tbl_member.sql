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
    admin_yn           VARCHAR2(1)      DEFAULT 'N' NOT NULL 
)
/
drop table tbl_member;

select * from tbl_member;

INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 01', 'member_pwd 01', 'member_name 01', 'member_addr 01', 01, 'member_health 01', 'N', 01, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 02', 'member_pwd 02', 'member_name 02', 'member_addr 02', 02, 'member_health 02', 'N', 02, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 03', 'member_pwd 03', 'member_name 03', 'member_addr 03', 03, 'member_health 03', 'N', 03, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 04', 'member_pwd 04', 'member_name 04', 'member_addr 04', 04, 'member_health 04', 'N', 04, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 05', 'member_pwd 05', 'member_name 05', 'member_addr 05', 05, 'member_health 05', 'N', 05, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 06', 'member_pwd 06', 'member_name 06', 'member_addr 06', 06, 'member_health 06', 'N', 06, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 07', 'member_pwd 07', 'member_name 07', 'member_addr 07', 07, 'member_health 07', 'N', 07, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 08', 'member_pwd 08', 'member_name 08', 'member_addr 08', 08, 'member_health 08', 'N', 08, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 09', 'member_pwd 09', 'member_name 09', 'member_addr 09', 09, 'member_health 09', 'N', 09, sysdate, 'N');
INSERT INTO tbl_member (member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn) VALUES ('member_id 10', 'member_pwd 10', 'member_name 10', 'member_addr 10', 10, 'member_health 10', 'N', 10, sysdate, 'N');