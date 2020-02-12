-- 오늘날짜
select sysdate from dual;

-- 어제, 내일 날짜
select sysdate-1, sysdate +1 from dual;


-- 성탄절까지 몇달?
select months_between ('2020-12-25', sysdate) from dual;
-- 큰날짜, 작은날짜 순서
-- >>  10.39878546893667861409796893667861409797....소숫점 자르자
select trunc(months_between('2020-12-25', sysdate))from dual;
-- >> 10


select sysdate, next_day(sysdate,'월'), next_day(sysdate,'수'),  last_day(sysdate) from dual;
-- >>   20/02/12	  20/02/17           	20/02/19	            20/02/29
--                    돌아오는 월요일      돌아오는 수요일         이번달 말일

select to_date('2020-3-1') -1 from dual;
-- >> 20-02-29

-- 시간 버리고 날짜만 가져오기
-- sysdate는 시간정보도 있다.
select to_char(trunc(sysdate), 'yyyy-mm-dd HH24:mi:ss') from dual;
-->>2020-02-12 00:00:00








-----------------