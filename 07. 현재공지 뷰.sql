--뷰 생성
-- 현재 진행 공지
-- startdate<- sysdate <-enddate

select no, title, startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 ;

-- 뷰테이블 생성
--관리자 권한 없음 오류
-- create view 권한 줘야함
--grant create view to java01;


drop view notice_pres;

--view 테이블 생성

create or replace view notice_pres
as
select  title, content,startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 ;

-- view 테이블 조회
select * from notice_pres;