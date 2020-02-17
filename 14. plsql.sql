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
DBMS_OUTPUT.PUT_line (vno || '      ' || vname);
end;
/

set serverout on;
declare
vno number(4);
vtitle varchar2(50);
vwriter varchar2(20);
begin
    select no, title, writer into vno, vtitle, vwriter
    from board
    where no = (select max(no) from board);
    
    DBMS_output.put_line(vno || '   '|| vtitle||'  ' || vwriter);
    end;
    /
    
    
    ------------------