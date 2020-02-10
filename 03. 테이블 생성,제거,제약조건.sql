-- ���̺� ���� - ���� ���ǰ� ������� �����. : Foreign key
drop table member cascade CONSTRAINTS;

-- ������ ���� ��ü : ���̺�
-- �÷� ������ Ư��: ���ڿ� - varchar2(����), ���� - number, ��¥ - date
-- Oracle 10g���� Oracle 11g �������� �ٲ�鼭 �ѱ� 3����Ʈ
-- **** ��������
-- �����͵��� �ĺ��� �� �ִ� �÷� -> primary key -> id
-- �� �Է��� �ؾ� �ϴ� �׸� (not null) -> pw, name, gender, email
-- ������ "����", "����"�� �Է� ����
-- �̸����� �ߺ��Ǹ� �ȵȴ�.
CREATE TABLE member(
    id varchar2(20) PRIMARY KEY,
    pw varchar2(20) NOT NULL,
    name varchar2(30) NOT NULL,
    birth date,
    gender varchar2(6) NOT NULL CHECK(gender in('����','����')),
    tel varchar2(13),
    email varchar2(50) NOT NULL UNIQUE , -- 010-7676-6236
    photo varchar2(50)
);

