--�ϹݰԽ��ǿ� ������ �ֱ�
--�۹�ȣ�� ��� ����(+)�Ǵ� ��ü�� ��� -> ������(���� 8��,11��)
--�������� ���� ��ȣ �޾Ƴ��� --> board_seq.nextval
Insert Into board(no, title, content, writer)
Values(1, 'oracle', 'oracle jjang', 'lee');

Insert Into board(no, title, content, writer)
Values(board_seq.nextval, 'oracle', 'oracle jjang', 'lee');

Commit;