-- 6. �Խ��� ���̺� ����
Drop Table board Cascade Constraints;
-- ������ ���� ( �Ʒ��� Create�� ����� ������ Drop�� ����� )
Drop SEQUENCE board_seq;

-- �Խ��� ���̺� ����
Create table board(
    no Number Constraint board_no_pk Primary Key, --Constraint : ���� ���� �̸� ����
    title Varchar2(300) Constraint board_title_nn Not Null,
    content Varchar2(2000) Constraint board_content_nn Not Null,
    writer Varchar2(30) Constraint board_writer_nn Not Null,
    writeDate Date Default Sysdate,
    hit Number Default 0,
    replyCnt Number Default 0
);

--�Խ��� �۹�ȣ�� ����� ������ ����
Create SEQUENCE board_seq;