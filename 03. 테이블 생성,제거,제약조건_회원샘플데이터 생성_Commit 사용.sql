-- ȸ������ : id, pw, name, gender, birth, email - �ʼ� �Է�
Insert Into member(id, pw, name, gender, birth, email)
values('test','1111','ȫ�浿','����','1990-10-01','test@naver.com');

-- ������ --> grade �׸��� �߰��Ǿ�� �Ѵ�.
Insert Into member(id, pw, name, gender, birth, email, grade)
values('admin','1111','������','����','1990-10-01','test@naver.com', 9);

-- ��������
-- commit : ���� -> DB�� ���� ����
commit;
