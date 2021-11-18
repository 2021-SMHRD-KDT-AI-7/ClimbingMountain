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

CREATE SEQUENCE tbl_community_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;
/

DROP SEQUENCE tbl_community_SEQ;
/

select * from tbl_community

ALTER TABLE tbl_community
    ADD CONSTRAINT FK_tbl_community_member_id_tbl FOREIGN KEY (member_id)
        REFERENCES tbl_member (member_id)
/

insert into tbl_community(community_seq, community_subject, community_content, reg_date, community_cnt, member_id, community_file1, community_file2, community_file3)
values(tbl_community_SEQ.nextval, 'community_subject 1', 'community_content 1', sysdate, 0, 'member_id 1', 'community_file1 1', 'community_file2 1', 'community_file3 1');

insert into tbl_community(community_seq, community_subject, community_content, reg_date, community_cnt, member_id, community_file1, community_file2, community_file3)
values(tbl_community_SEQ.nextval, 'community_subject 1', 'community_content 1', sysdate, 0, 'member_id 1', 'community_file1 1', 'community_file2 1', 'community_file3 1');