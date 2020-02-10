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




--------------------------------------------------------
