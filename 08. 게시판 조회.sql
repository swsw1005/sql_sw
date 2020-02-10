-- 1. 게시판 리스트
select * from board;
--> 최근 작성 맨위로
--> 보이는 항목 : 번호, 제목, 작성자, 작성일, 조회수
select no, title, writer, writeDate, hit from board
order by no desc; --큰번호(=최근작성)순서대로...
-- 첫글부터 보려면 작은번호부터  asc
select no, title, writer, writeDate, hit from board
order by no asc; --작은 순서대로ㅇㅇ


--1.1 날짜형식 이용한 처리
select no, title,
  to_char(writer)글쓴이,--writer 그대로 가져오는데, column이름만 글쓴이 변경
  to_char(writeDate, 'yyyy-mm-dd') 쓴Date, hit
  -- 날짜객체서식 yy/mm/dd >> 문자열 yyy-mm-dd
  -- column 명  to_char 어쩌구...<쓴date>로 별칭 변경
  -- 보기는 편하지만, 날짜 계산 힘들다.
from board
where writer = 'kim'
order by no desc;


--1.2 화면에 페이지 표시하기 위해서
-- 전체데이터 갯수 가져오기
select count (*) from board;
-- kim이 쓴 글 갯수 가져오기
select count(*) from board where writer='kim';


--2. 게시판 글쓰기
-- 입력받는 내용 : 제목, 내용, 작성자, pk (글번호)
insert into board(no, title, content, writer)
values(board_seq.nextval,  'sql활용', '처리문','lee');
--> 데이터 변경이 일어나면 '
-- 처리   (transaction)  
commit;  -- 적용 
-- 취소  (rollback)


--> 3. 게시판 글보기	조회수 1증가
-- 현재 조회또한 hit 증가시켜야 함.  hit 먼저 증가 시키고 조회
update board set hit = hit+1 where no = 28;
-- 업데이트 후 글 조회
select no, title, content, writer, writeDate, hit
  from board
  where no = 28;
commit;


--4. 게시판 글 수정
--일단 게시글 불러오고
select no, title, content, writer, writeDate, hit
  from board
  where no = 28;
-- 내용 수정
update board set 
   title = 'fix fix oracle',
   content = 'java content', 
   writer='kim',
   where no = 28;
-- 실제 서비스에서는 autocommit 기본
-- 글 수정후에, 글 보기 페이지로 돌아간다.
-- hit가 올라가네? 예기치 못한 문제...
-- 내가 쓴 글 내가 볼때도 역시...조회수 증가 끄기(선택사항)?
-- 변수 하나 선언하고,  저장했다 불러온다?
--  글 수정 query에 hit = hit-1 포함? 이걸로 해결 아닌가?
-- 안됨. 수정 전 불러올때 +1, 수정하고 다시 볼때 +1  총 +2
-- 그렇다고 hit = hit-2 ??
-- 수정중에 누가 보면 -1 상태...
-- if문으로 서버단에서 분기
commit;


-->5. 게시판 글 삭제
delete from board where no = 글번호;




