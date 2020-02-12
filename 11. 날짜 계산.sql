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
--      현재날짜      돌아오는 월요일      돌아오는 수요일         이번달 말일

select to_date('2020-3-1') -1 from dual;
-- >> 20-02-29

-- 시간 버리고 날짜만 가져오기
-- sysdate는 시간정보도 있다.
select to_char(trunc(sysdate), 'yyyy-mm-dd HH24:mi:ss') from dual;
-->>2020-02-12 00:00:00


-- decode  등급 1:일반회원  9:관리자
select id, name, grade from member;
-- grade  1이면  일반회원,  9이면 관리자  >> 컬럼명 gradename
select id, name, 
decode(grade, 1,'일반회원',decode(grade, 9,'관리자')) gradename 
from member;
-- grade값 null이면  1 출력 >> 일반회원으로 간주
select id, name, 
decode(nvl(grade,1), 1,'일반회원',decode(nvl(grade,1), 9,'관리자')) 
from member;
-->> 5 : 중간회원 >>  쿼리 다 뜯어고쳐야한다.
-- 실무에선 grade 테이블과 join 하는 방법을 쓴다.


--join
select id, name, member.grade, gradename
from member, grade
where
member.grade = grade.gradeno;


select id, name, member.grade, gradename
from member m, grade g
where
m.grade = g.gradeno;
-- > 테이블 명 grade, 컬럼명 grade 혼재되서 오류상태




-----------------