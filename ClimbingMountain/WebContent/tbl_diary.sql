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