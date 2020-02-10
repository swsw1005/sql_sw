
create table member(  -- 멤버 테이블 작성
    id varchar2(20),
    pw varchar2(20),
    name varchar2(30),
    -- 한글 일본어 한자 2바이트 겹침문제,  오라클은3바이트. 30 = 10글자
    birth date,
    gender varchar2(6),
    tel varchar2(13), --010-1234-5678
    email varchar2(50),
    photo varchar2(50)  --마지막에 반점 쓰지말자...
);



--확장된 멤버 테이블 생성
create table member(
    id		varchar2(20) primary key,
    pw		varchar2(20) not null,
    name		varchar2(30) not null,
    gender	varchar2(6) not null check(gender in('남자','여자')),
    birth       	date not null,
    tel        	varchar2(13),
    email      	varchar2(50) not null,
    regDate     	date default sysdate,  --오라클 시스템날짜
    conDate     	date default sysdate,
    status      	varchar2(6) default '정상' check(status in('정상','강퇴','탈퇴','휴면')),
    photo       	varchar2(50) default '/upload/member2/nolmage.png',
    newMsgCnt   	number default 0,
    grade       	number(2) default 1
);


-- 게시판 글 작성 예시
insert into board(no, title, content, writer)
values(1,'oracle', 'oracle jjang','lee');

commit;



--------------------------------------------


-- 시퀀스 제거
drop sequence board_seq;
-- 게시판 글번호에 사용할 시퀀스
create sequence board_seq
increment by 1
start with 1;


--------------------------------------------



--일반게시판에 데이터 넣기
--글번호 계속 증가되는 객체 사용 (시퀀스 8장)
-- 시퀀스의 다음번호 받아내기 board_seq.nextval
insert into board(no, title, content, writer)
values(1,'제목','내용','작성자');
-- 계속 증가되는 no  중간에 빠져도 채우지 않는다.
insert into board(no, title, content, writer)
values(board_seq.nextval,'제목','내용','작성자');

commit;


--------------------------------------------

drop table notice;
-- 공지사항 테이블 생성
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
--시퀀스 만들기
create sequence notice_seq
increment by 1
start with 1;

--후속 글 입력
insert into notice(no, title, content)
values(notice_seq.nextval,'공지사항','내용');


