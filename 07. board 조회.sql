
-- �ۼ��� lee ������ ��������
select * from board
where writer = 'kim';
--0.005��


-- board�� �ִ� �����͸� �ٽ� board�� �Է�
-- no�� nextval��
insert into board(no, title, content, writer) 
(select board_seq.nextval, title, content, writer from board);
-- �ݺ��ϸ� �����ϴ� ���� ��� 2���...

-- number�� 4�ڸ� ����...�����غ���
alter table board modify no number;


commit;

select count(*) from board;


--�ε��� ����  ���� writer
--unique index  �ε��� ����� Ű����  �ߺ������� ����
-- db Ʃ�׿� �߿���. �ֿ켱
--�ߺ����ִ� �÷���  �Ϲ� �ε���
drop index idx_board_writer;

create  index  idx_board_writer
On board(writer);
