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