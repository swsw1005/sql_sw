

-- 그냥 불러오기
select *
from board;
--정렬하여 불러오기
select *
from board
order by no desc;
-- 인덱스로 정렬하기
select *
from board
where no>0;


-- join 연습
select empno, ename, deptno, dname
from emp e, dept d
where e.deptno = d.dcode;

-- join 연습,  수당을 받는 사람의 리스트
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp e
where comm is not null;


-- 수당받는 사람 인원수
select count (comm)
from emp;
-- count 할때는 null 자동으로 빼고 센다



--self join 
select e1.ename 사원이름, e2.ename 상사이름, e1.job, e1.comm
from emp e1, emp e2 
where e1.mgr = e2.empno
order by job;








---------------------


