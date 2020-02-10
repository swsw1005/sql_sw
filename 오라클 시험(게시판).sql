--평가 예제

--1. 게시판 리스트보기
select no, title, writer, writeDate, hit 
from board order by no desc;

--2. 게시판 글쓰기
insert into board(no, title, content, writer)
values(board_seq.nextval, 'java', 'java content', 'kim');

--3. 게시판 글보기	조회수 1증가
--	댓글 보기 포함
select no, title, content, writer, writeDate, hit 
   from board;

update board set hit = hit+1 where no = 글번호;

--4. 게시판 글 수정
update board set 
   title = 'oracle',
   content = 'java content', 
   writer='kim'
   where no = 글번호;

--5.게시판 글 삭제
delete from board where no = 글번호;




--오라클 1~14  sql 응용

--select	1장
--SQL 단일행 함수	2장
--SQL 복수행 함수	3장
--JOIN = 참조키	4장
--DML		6장 
 --(insert update delete)
--Transation  	6장
--서브query	10장
--계층형query	12장 x



