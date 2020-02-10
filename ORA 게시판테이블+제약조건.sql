
create table member(  -- ��� ���̺� �ۼ�
    id varchar2(20),
    pw varchar2(20),
    name varchar2(30),
    -- �ѱ� �Ϻ��� ���� 2����Ʈ ��ħ����,  ����Ŭ��3����Ʈ. 30 = 10����
    birth date,
    gender varchar2(6),
    tel varchar2(13), --010-1234-5678
    email varchar2(50),
    photo varchar2(50)  --�������� ���� ��������...
);



--Ȯ��� ��� ���̺� ����
create table member(
    id		varchar2(20) primary key,
    pw		varchar2(20) not null,
    name		varchar2(30) not null,
    gender	varchar2(6) not null check(gender in('����','����')),
    birth       	date not null,
    tel        	varchar2(13),
    email      	varchar2(50) not null,
    regDate     	date default sysdate,  --����Ŭ �ý��۳�¥
    conDate     	date default sysdate,
    status      	varchar2(6) default '����' check(status in('����','����','Ż��','�޸�')),
    photo       	varchar2(50) default '/upload/member2/nolmage.png',
    newMsgCnt   	number default 0,
    grade       	number(2) default 1
);


-- �Խ��� �� �ۼ� ����
insert into board(no, title, content, writer)
values(1,'oracle', 'oracle jjang','lee');

commit;



--------------------------------------------


-- ������ ����
drop sequence board_seq;
-- �Խ��� �۹�ȣ�� ����� ������
create sequence board_seq
increment by 1
start with 1;


--------------------------------------------



--�ϹݰԽ��ǿ� ������ �ֱ�
--�۹�ȣ ��� �����Ǵ� ��ü ��� (������ 8��)
-- �������� ������ȣ �޾Ƴ��� board_seq.nextval
insert into board(no, title, content, writer)
values(1,'����','����','�ۼ���');
-- ��� �����Ǵ� no  �߰��� ������ ä���� �ʴ´�.
insert into board(no, title, content, writer)
values(board_seq.nextval,'����','����','�ۼ���');

commit;


--------------------------------------------

drop table notice;
-- �������� ���̺� ����
create table notice(
    no          number  constraint notice_no_pk    primary key,
    title       varchar2(300)    constraint notice_title_nn not null, 
    content     varchar2(2000)    constraint notice_content_nn not null,
    startdate   date   default(sysdate),
    endDate     date   default('9999-12-30'),
    writeDate   date   default(sysdate),
    updateDate  date   default(sysdate)
);


--------------------------------------------


drop SEQUENCE notice_seq;
--������ �����
create sequence notice_seq
increment by 1
start with 1;

--�ļ� �� �Է�
insert into notice(no, title, content)
values(notice_seq.nextval,'��������','����');


