set serveroutput on;
-- 화면에 처리된 내용 출력 ON

declare
 vempno emp.empno%type;
    vename emp.ename%type;
    vdeptno emp.deptno%type;
    
    -- 커서 선언
    
    CURSOR c1 is
        select empno, ename, deptno
        from emp
        where deptno = 10;
    
begin
    --쿼리 실행한다
    open c1; --쿼리 실행(커서 열기)
    --
    --무한반복
    loop
    --
    -- 데이터 처리 다 끝나면  반복문 빠져나온다.
    fetch c1 into vempno, vename, vdeptno;
    --
    -- 데이터 처리 다 끝나면  loop 종료
    exit when c1%notfound;
    --
    --
    --
    dbms_output.put_line(vempno || ' / ' || vename||' / '|| vdeptno);
    
    -- 루프 닫기
    end loop;
    --커서 닫기
    close c1;
end;
/



