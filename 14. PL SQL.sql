set
  serverout on;
--처리문 만들어서 실행 declare 선언문 begin 처리문 end/
  declare -- 처리도중 사용될 변수 선언
  vno number (4);
vname varchar2 (10);
begin -- 처리문
  -- 처리문 도중 나오는 데이터를 변수에 저장
select
  empno,
  ename into vno,
  vname
from emp
where
  empno = 7902;
DBMS_OUTPUT.PUT_line (vno || ' / ' || vname);
end;
/ -- 게시판에서 가장 최신글 찾아서 no, title, writer, writedate출력
/
set
  serverout on;
declare vno number(4);
vtitle varchar2(50);
vwriter varchar2(20);
vwritedate date;
begin
select
  no,
  title,
  writer,
  writedate into vno,
  vtitle,
  vwriter,
  vwritedate
from board
where
  no = (
    select
      max(no)
    from board
  );
DBMS_output.put_line(
    vno || ' / ' || vtitle || ' / ' || vwriter || ' / ' || vwritedate
  );
end;
/ -- 게시판에서 가장 최신글 찾아서 no, title, writer, writedate출력
-- 날짜 형식 변경
/
set
  serverout on;
declare vno number(4);
vtitle varchar2(50);
vwriter varchar2(20);
vwritedate varchar2(50);
--날짜 to_char이용. 스트링 변경
  begin
select
  no,
  title,
  writer,
  to_char(writedate, 'yyyy-mm-dd HH24:mi:ss') into vno,
  vtitle,
  vwriter,
  vwritedate
from board
where
  no = (
    select
      max(no)
    from board
  );
DBMS_output.put_line(
    vno || ' / ' || vtitle || ' / ' || vwriter || ' / ' || vwritedate
  );
end;
/ -- 게시판에서 가장 최신글 찾아서 no, title, writer, writedate출력
-- &no .... no값을 직접 입력받는다.
/
set
  serverout on;
declare vno board.no %type;
vtitle board.title %type;
vwriter board.writer %type;
--%type >> 원본 데이터 형식 그대로 따른다
  begin
select
  no,
  title,
  writer into vno,
  vtitle,
  vwriter
from board
where
  no = & no;
-- no값 입력받는 form 띄운다.
  dbms_output.put_line('------------요청하신 게시글임니다 고갱님--------------');
DBMS_output.put_line(vno || ' / ' || vtitle || ' / ' || vwriter);
dbms_output.put_line(
    '------------------------------------------------------'
  );
end;
/ --<< insert PL/SQL>>--
-- 게시판 글쓰기
/
set
  verify off;
declare --변수선언 : 키보드 직접 입력   :=     << 입력 연산자
  vtitle board.title %type : = '&title';
--vtitle 변수선언 board.title 타입 그대로  키보드 입력받는다   &title 형식으로
  vcontent board.content %type : = '&content';
vwriter board.writer %type : = '&writer';
begin
insert into board(no, title, content, writer) -- 게시판 입력한다
values(
    (
      select
        nvl(max(no), 0)
      from board
    ) + 1,
    vtitle,
    vcontent,
    vwriter
  );
-- 입력한 v 시리즈 값을 입력받는다.
  commit;
-- 커밋까지 포함<< 이게바로 오토커밋!
end;
/ ------------------