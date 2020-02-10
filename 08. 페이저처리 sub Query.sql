---< 페이지 처리 위한 sub Query (7장) >--

--1. 전체 원본데이터 가져오기
-- no, title, content,  writer, writedate, hit
select no, title, content, writer,
  to_char(writedate, 'yyyy-mm-dd') writedate, hit
  from board
  order by no desc;
  
--2. 가져온 데이터에 순서번호 붙인다.
select rownum rnum, no, title, writer, writedate, hit
from( 
    select no, title, content, writer, 
    to_char(writedate,'yyyy-mm-dd') writedate, hit
    from board
    order by no desc
);
-- rownum(순서번호) rnum(순서번호의 column) 포함해서 no~hit 불러온다
-- 어디서?
-- select 문을 이용한 임시테이블에서..
-- 그냥 불러오면 정렬 안되있다.
-- rnum을 붙이는 의미가 없지
-- order by desc 로 정렬해서 불러온다.


--3 페이지 범위에 맞는 데이터 가져오기
select rnum, no, title writer, writedate, hit
from (
    select rownum rnum, no, title, writer, writedate, hit
    from( 
         select no, title, content, writer, 
         to_char(writedate,'yyyy-mm-dd') writedate, 
         hit
         from board
         order by no desc
    )
) where rnum between 11 and 20;
  
  
  