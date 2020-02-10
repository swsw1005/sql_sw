--���̺� ����, ������ ����
Drop Table notice cascade CONSTRAINTS;
Drop SEQUENCE notice_seq;

--���̺� ����
Create Table notice(
    no number constraint notice_no_pk primary key,
    title varchar(300) constraint notice_title_nn not null,
    content varchar(2000) constraint notice_content_nn not null,
    startDate Date default sysdate,
    endDate Date default '9999-12-30',
    writeDate Date default sysdate,
    updateDate Date default sysdate
);

--������ ����
create Sequence notice_seq;
--���õ����� - insert
--������� ��� ����
insert into notice(no, title, content)
values(notice_seq.nextval, '����Ʈ ����', '���� �� ��Ź�帳�ϴ�.');

--������ ���� - ���� ���� - ���� ��¥ 2020-02-04
insert into notice(no, title, content, startDate)
values(notice_seq.nextval, '3������ ���³��� �����ϴ�.', '���� �� ��Ź�帳�ϴ�.', '2020-02-11');

--���� ���� - ������ �Ⱓ���� �� ����
insert into notice(no, title, content, endDate)
values(notice_seq.nextval, '�⼮�̺�Ʈ', '���� �� ��Ź�帳�ϴ�.', '2020-02-11');

--���� ���� - 
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, '�ų��λ�', '���� �� ��Ź�帳�ϴ�.','2020-01-01', '2020-01-30');

--commit - ���� ����
commit