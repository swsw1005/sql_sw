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
/



-- 게시판에서 가장 최신글 찾아서 no, title, writer, writedate출력
/
set serverout on;
declare
vno number(4);
vtitle varchar2(50);
vwriter varchar2(20);
vwritedate date;
begin
    select no, title, writer, writedate into vno, vtitle, vwriter, vwritedate
    from board
    where no = (select max(no) from board);
    
    DBMS_output.put_line(vno || ' / '|| vtitle||' / ' || vwriter ||' / '
    || vwritedate);
    end;
    /
    
    
    
-- 게시판에서 가장 최신글 찾아서 no, title, writer, writedate출력
-- 날짜 형식 변경
/
set serverout on;
declare
vno number(4);
vtitle varchar2(50);
vwriter varchar2(20);
vwritedate varchar2(50);--날짜 to_char이용. 스트링 변경
begin
    select no, title, writer, to_char(writedate,'yyyy-mm-dd HH24:mi:ss') into vno, vtitle, vwriter, vwritedate
    from board
    where no = (select max(no) from board);
    
    DBMS_output.put_line(vno || ' / '|| vtitle||' / ' || vwriter ||' / '
    || vwritedate);
    end;
    /    
    
    
    



-- 게시판에서 가장 최신글 찾아서 no, title, writer, writedate출력
-- &no .... no값을 직접 입력받는다.
/
set serverout on;
declare
vno board.no%type;
vtitle board.title%type;
vwriter board.writer%type;

begin
    select no, title, writer into vno, vtitle, vwriter
    from board
    where no = &no;
    -- no값 입력받는 form 띄운다.
    
    DBMS_output.put_line(vno || ' / '|| vtitle||' / ' || vwriter );
    end;
    /
    
    ------------------