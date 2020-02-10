--테이블 제거, 시퀀스 제거
Drop Table notice cascade CONSTRAINTS;
Drop SEQUENCE notice_seq;

--테이블 생성
Create Table notice(
    no number constraint notice_no_pk primary key,
    title varchar(300) constraint notice_title_nn not null,
    content varchar(2000) constraint notice_content_nn not null,
    startDate Date default sysdate,
    endDate Date default '9999-12-30',
    writeDate Date default sysdate,
    updateDate Date default sysdate
);

--시퀀스 생성
create Sequence notice_seq;
--샘플데이터 - insert
--현재부터 계속 공지
insert into notice(no, title, content)
values(notice_seq.nextval, '사이트 오픈', '좋은 글 부탁드립니다.');

--앞으로 공지 - 예약 공지 - 현재 날짜 2020-02-04
insert into notice(no, title, content, startDate)
values(notice_seq.nextval, '3월달은 쉬는날이 없습니다.', '좋은 글 부탁드립니다.', '2020-02-11');

--현재 공지 - 일주일 기간으로 한 공지
insert into notice(no, title, content, endDate)
values(notice_seq.nextval, '출석이벤트', '좋은 글 부탁드립니다.', '2020-02-11');

--지난 공지 - 
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, '신년인사', '좋은 글 부탁드립니다.','2020-01-01', '2020-01-30');

--commit - 완전 적용
commit