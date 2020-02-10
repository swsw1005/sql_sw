--현재공지 - 일주일 기간 공지
insert into notice(no, title, content, startDate)
values (NOTICE_SEQ.nextval, '사이트오픈', '좋은 글 부탁함','2020-02-11');

--지난 공지 일주일기간
insert into notice(no,title, content, startDate,enddate)
values (NOTICE_SEQ.nextval, '사이트오픈','좋은글 부탁드립니다.','2020-02-01','2020-02-03');

--예약공지 200215에 업로드
insert into notice(no, title, content, startDate)
values(NOTICE_SEQ.nextval, '3월은 쉬는날이 없습니다.', '제곧내','2020-02-15');





