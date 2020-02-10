Drop Table member cascade constraints;

CREATE table member(
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(30) not null,
    gender varchar2(6) not null check(gender in('남자','여자')),
    birth date not null,
    tel varchar2(13),
    email varchar2(50) not null,
    regdate date default sysdate, --회원가입일 // sysdate : 현재날짜
    condate date default sysdate, --최근접속일 // default : 기본값
    status varchar2(6) default '정상' check (status in('정상','강퇴','탈퇴','휴면')),
    photo varchar2(50),
    newMsgcnt number default 0,
    grade number(2) default 1 -- 1:일반회원, 9:관리자 // references : foreign key
);




--mySQL ver

CREATE table member(
    id varchar(20) primary key,
    pw varchar(20) not null,
    name varchar(30) not null,
    gender varchar(6) not null check(gender in('남자','여자')),
    birth date not null,
    tel varchar(13),
    email varchar(50) not null,
    regdate datetime default CURRENT_TIMESTAMP, 
    condate datetime default CURRENT_TIMESTAMP,
    status varchar(6) default '정상' check (status in('정상','강퇴','탈퇴','휴면')),
    photo varchar(50),
    newMsgcnt int default 0,
    grade int(2) default 1 references grade.gradeno
);