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

