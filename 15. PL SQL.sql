--처리내용 화면에 보이기
/
set
  serveroutput on;
--묶음타입 만들어 쓰기p584
  declare -- 묶음 타입 만들기
  type emp_rec_type is record (
    emp_id emp.empno %type,
    e_name emp.ename %type
  );
--데이터 변수
  v_rec emp_rec_type;
begin
select
  empno,
  ename into v_rec
from emp
where
  empno = 7902;
--화면에 표시하기
  DBMS_output.put_line('  ');
DBMS_output.put_line(v_rec.emp_id || ' / ' || v_rec.e_name);
DBMS_output.put_line('  ');
end;
/