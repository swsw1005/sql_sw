Drop Table member cascade constraints;

CREATE table member(
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(30) not null,
    gender varchar2(6) not null check(gender in('����','����')),
    birth date not null,
    tel varchar2(13),
    email varchar2(50) not null,
    regdate date default sysdate, --ȸ�������� // sysdate : ���糯¥
    condate date default sysdate, --�ֱ������� // default : �⺻��
    status varchar2(6) default '����' check (status in('����','����','Ż��','�޸�')),
    photo varchar2(50),
    newMsgcnt number default 0,
    grade number(2) default 1 -- 1:�Ϲ�ȸ��, 9:������ // references : foreign key
);




--mySQL ver

CREATE table member(
    id varchar(20) primary key,
    pw varchar(20) not null,
    name varchar(30) not null,
    gender varchar(6) not null check(gender in('����','����')),
    birth date not null,
    tel varchar(13),
    email varchar(50) not null,
    regdate datetime default CURRENT_TIMESTAMP, 
    condate datetime default CURRENT_TIMESTAMP,
    status varchar(6) default '����' check (status in('����','����','Ż��','�޸�')),
    photo varchar(50),
    newMsgcnt int default 0,
    grade int(2) default 1 references grade.gradeno
);