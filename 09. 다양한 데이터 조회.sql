-- 테이블의 모든 데이터 조회
-- * 는 실무에서 쓰지 않는다.
-- 데이터 엄청 많아서 시간 엄청 걸린다.
select * from board;
--------------------------------------------------------

-- 2002-02 컬럼 더해서 불러온다.
select '2020-02' , no , title from board;
--------------------------------------------------------

-- 문자열 이어붙이기
-- 출력형식  [2]oracle
select '[' || no || ']' || title from board;
--------------------------------------------------------

-- 제목, 컨텐츠 불러와서,  컬럼명 title, content >> 제목, 내용
select title as 제목 ,content as 내용 from board;
-- as 안써도 된다
select title 제목, content 내용 from board where writer = 'lee';
--------------------------------------------------------

-- 중복없이 데이터 불러오기
select distinct writer from board;

-- dual 없는 테이블을 가상으로 있다고 생각, 형식 맞추는 더미테이블
select sysdate from dual;

select sysdate from dual where 10 > 9;

select sysdate from dual where '10' > '9';

select sysdate from dual where 10 != 9;

select sysdate from dual where 10 = 9;
--------------------------------------------------------

--게시판에서 글번호가 11~20 데이터를 가져오세요
select no, title, writer from board
where 11 <= no and no <= 20;
-- 00 번~ 00번  불러오기
select no, title from board
where no between 11 and 20;
-- 특정번호 불러오기...or 조건문
select no, title from board
where no = 11 or no = 13 or no = 15;
-- 특정번호 불러오기... in(1,2,3,4,5)
select no, title from board
where no in (11,13,15,16,17);
--where 조건은 select, update, delete 에서 사용가능
--ex) kim 의 장바구니 데이터만 지우기

rollback;
--실제 프로그램은 autocommit.
--오토커밋 껏을때만 가능


-- 제목이 ~racl~ 비슷한 불러오기
select no, title, writer from board
where title like '%racl%';
-- 앞뒤로 %% 붙여줘야  oracle 불러온다.

select no, title, writer from board
where 1 = 0  --항상 false
-- 아래쪽에 or 연산 query 작성 용이
-- 첫번째 조건이 false 여야만 뒤 조건을 조회한다.
or title like '%racl%'
or content like '%racl%'
or writer like '%racl%';


--------------------------------------------------------
--회원 데이터 - 전화번호 뒷자리로 조회
select id, name, tel from member
where tel like'%1111';
--------------------------------------------------------

-- 전화번호가 입력되지 않은 (null) 고객 조회
select id, name, tel, birth from member
where tel is null;

-- 전화번호 입력된 (not null)고객 조회
select id, name, tel, birth from member
where tel is not null;
--------------------------------------------------------

--게시판에서 제목정렬(별도 명시 없이는 ascd 오름차순 (생략가능)
-->> 제목이 똑같으면 작성일 역순(desc) 정렬
select no, title, writedate from board
order by title asc ,writedate desc;
-- title 정렬(1차 정렬) >> writedate 정렬(2차 정렬)

--------------------------------------------------------

-- 공지사항 번호, 제목  번호 역순
select no, title from notice
order by no desc;
-- 번호역순, 5~15번 사이만
select no, title from board
where no between 5 and 15
order by no desc;
-- 번호 역순,  25번 이상만
select no, title from board
where no >= 25
order by no desc;
--------------------------------------------------------

select no, title from board
where no between 5 and 15
order by no desc
union all
select no, title from board
where no >= 25
order by no desc;
--------------------------------------------------------

--  여러개 게시판 가져와서 rnum 순서 메기고 페이지처리(한페이지 5 글)
select no, title, writedate
from (
   -- 4. 1~5번만 가져오기(페이지처리)
    select rownum rnum, no, title, writedate
    from (
        --3. 데이터를 정렬해서 가져온다
        select no, title, writedate
        from(
           --2. 공지사항+게시판번호, 제목 - 번호역순
            select no, title, writedate from notice
            union
            -- 게시판번호, 제목 - 번호역순
            select no, title, writedate from board
            where no>=5
        )
       order by writedate desc
    )
)
where rnum between 1 and 5;
--------------------------------------------------------



--------------------------------------------------------



--------------------------------------------------------



--------------------------------------------------------




--------------------------------------------------------

