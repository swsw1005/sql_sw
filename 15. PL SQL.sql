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
  empno = & no;
--숫자 직접 입력
  --화면에 표시하기
  DBMS_output.put_line(' ');
DBMS_output.put_line(' ');
DBMS_output.put_line(' ');
DBMS_output.put_line('----------------------------------');
DBMS_output.put_line(
    v_rec.emp_id || '번...너의 이름은 ★☆★' || v_rec.e_name || '...☆★☆'
  );
DBMS_output.put_line('----------------------------------');
end;
/
----------------------------------------------
----------------------------------------------
----------------------------------------------

-- 데이터 중 사원번호가 7902 사원번호, 이름, 부서번호, 부서명 출력
-- if   elsif   else 이용
declare 
vempno emp.empno%TYPE;
vename  emp.ename%TYPE;
vdeptno  emp.deptno%TYPE;
vdeptname  varchar2(12);
begin --데이터 가져오기
select
  empno,  ename,  deptno 
  into vempno,  vename,  vdeptno
from emp
where
  empno = 7902;
 ---if ~ end if 문
  --elsif <<< elseif 아니다!!!!
  if(vdeptno = 10) then vdeptname := '기획부';
elsif(vdeptno = 20) then vdeptname := '경리부';
elsif(vdeptno = 30) then vdeptname := '영업부';
elsif(vdeptno = 40) then vdeptname := '전산부';
  else vdeptname := '무소속';
end if;
--
-- 처리한 데이터 출력
dbms_output.put_line(
  vempno || ' / ' ||  vename || ' / ' ||  vdeptno  || ' / ' ||  vdeptname );
end;
/

----------------------------------------------
----------------------------------------------
----------------------------------------------

-- 데이터 중  사원번호, 이름, 부서번호, 부서명 출력
-- case when then 이용
declare 
vempno emp.empno%TYPE;
vename  emp.ename%TYPE;
vdeptno  emp.deptno%TYPE;
vdeptname  varchar2(12);
begin --데이터 가져오기
select
  empno,  ename,  deptno 
  into vempno,  vename,  vdeptno
from emp
where
  empno = &empno;

  vdeptname := case
    when vdeptno = 10 then  '기획부'
    when vdeptno = 20 then  '경리부'
    when vdeptno = 30 then '영업부'
    when vdeptno = 40 then '전산부'
end ;
--
-- 처리한 데이터 출력
dbms_output.put_line(
  vempno || ' / ' ||  vename || ' / ' ||  vdeptno  || ' / ' ||  vdeptname );
end;
/


----------------------------------------------
----------------------------------------------
----------------------------------------------

-- 데이터 중  사원번호, 이름, 부서번호, 부서명 출력
--join 이용
declare 
vempno emp.empno%TYPE;
vename  emp.ename%TYPE;
vdeptno  emp.deptno%TYPE;
vdeptname  dept.dname%type;
begin --데이터 가져오기
select
  e.empno,  e.ename,  e.deptno ,d.dname
  into vempno,  vename,  vdeptno, vdeptname
from emp e, dept d
where
  empno = &empno and d.dcode = e.deptno;
  -- 왼쪽에  데이터 많이 줄이는 조건
  -- 오른쪽부터 처리하면 시간 오래걸린다
--
-- 처리한 데이터 출력
dbms_output.put_line(
  vempno || ' / ' ||  vename || ' / ' ||  vdeptno  || ' / ' ||  vdeptname );
end;
/

---