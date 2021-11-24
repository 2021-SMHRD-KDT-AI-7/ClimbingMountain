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

drop table tbl_diary

select * from tbl_diary


CREATE SEQUENCE tbl_diary_SEQ
START WITH 1
INCREMENT BY 1 
NOCACHE;

DROP SEQUENCE tbl_diary_SEQ;


INSERT INTO tbl_diary (diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2) VALUES ('diary_subject 1', 'diary_content 1', sysdate, 'member_id 1', 'diary_file1 1', 'diary_file2 1');
INSERT INTO tbl_diary (diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2) VALUES ('diary_subject 2', 'diary_content 2', sysdate, 'member_id 2', 'diary_file1 2', 'diary_file2 2');
INSERT INTO tbl_diary (diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2) VALUES ('diary_subject 3', 'diary_content 3', sysdate, 'member_id 3', 'diary_file1 3', 'diary_file2 3');
INSERT INTO tbl_diary (diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2) VALUES ('diary_subject 4', 'diary_content 4', sysdate, 'member_id 4', 'diary_file1 4', 'diary_file2 4');
INSERT INTO tbl_diary (diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2) VALUES ('diary_subject 5', 'diary_content 5', sysdate, 'member_id 5', 'diary_file1 5', 'diary_file2 5');

