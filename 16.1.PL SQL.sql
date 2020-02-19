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
        dbms_output.put_line(vempno || ' / ' || vename ||' / '|| vdeptno);
        -- 루프 닫기
    end loop;
    --커서 닫기
    close c1;
end;
/




-- for 문 이용한 데이터 처리
declare
    cursor  board_cur is
        select no, title, writer , writedate, hit
        from board
        where no>20 and no <=50;    
begin
    for board_rec in board_cur
     loop
        dbms_output.put_line(board_rec.no || ' / '|| board_rec.title);
    end loop;
end;
/

-- 프로시져 실행 단점 >>
--  >>> 파일을 불러와서 실행하는 방식
-- >>>>> 파일 없으면 실행 못한다.
-- >>>>>>> 오라클에 이름 붙여서 저장해놓고,  이름만 부르면 실행되도록 하자
-->>  저장 프로시져!!!!
-->> view 만들때 생각해보자
-- >> 실제 데이터는 없다.  여기저기서 땡겨쓰는 가상형식?

create or replace  PROCEDURE up_sal
(
vempno emp.empno%type,
vupsal number)
is
begin
    update emp set sal = sal+vupsal
    where empno = vempno;
    commit;

end;
/


--프로시져 불러와서 실행하는 한줄의 코드
exec up_sal(7521,100000);

        


