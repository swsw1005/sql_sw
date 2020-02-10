-- 현재 유효한 공지만 보기
create or replace view notice_pres
as
select  title, content,startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 ;

-- 현재 유효한 공지만 보기 + 최신공지부터
create or replace view notice_pres
as
select  title, content,startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 
order by startdate desc;


--lee 게시글 최신글 순서
create or replace view board_lee
as
select  title, content,writedate,hit from board
where writer = 'lee' 
order by writedate desc;


--park 게시글 최신글 순서
create or replace view board_park
as
select  title, content,writedate,hit from board
where writer = 'park' 
order by writedate desc;


--kim 게시글 최신글 순서
create or replace view board_kim
as
select  title, content,writedate,hit from board
where writer = 'kim' 
order by writedate desc;


