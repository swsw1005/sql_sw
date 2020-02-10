-- 6. �Խ��� ���̺� ����
Drop Table board_rep Cascade Constraints;

Drop Sequence board_rep_seq;

-- �Խ��� ���̺� ����
Create table board_rep(
    rno number Constraint board_rno_pk primary key,
    no number references board(no),
    content varchar2(500) Constraint board_rno_content_nn not null,
    writer varchar2(30) Constraint board_rno_writer_nn not null,
    writeDate date default sysdate
    );

--�Խ��� �۹�ȣ�� ����� ������ ����
Create SEQUENCE board_rep_seq;

Insert Into board(no, title, content, writer)
Values(board_seq.nextval, 'oracle', 'oracle jjang', 'lee');

Insert Into board_rep(rno, no, content, writer)
Values(board_rep_seq.nextval, 3, 'oracle jjang?', 'lee?');

commit;

