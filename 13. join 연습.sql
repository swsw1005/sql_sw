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



select *
from member;
-- 예제 message 테이블 
create table message
(
    no number primary key,
    content varchar2(2000) not null,
    sender varchar2(20) not null REFERENCES member(id),
    senddate date default sysdate,
    accepter varchar2(20) not null REFERENCES member(id),
    acceptdate date default null,
    alluser number(1) default 0
);

create SEQUENCE message_seq;


insert into message
    (no, content, sender, accepter)
values
    ( (select nvl(max(no),0)
        from message )+1   , '첫번째 채팅입니다. 감사합니다.', 'lee123', 'kim123');

select *
from message;



-- 어려운 join  
-- 보낸id, 보낸 이름, 받는 id, 받는 이름  4개 컬럼
select ms.sender, sm.name, ms.accepter, am.name
from message ms, member sm, member am
where ms.sender = sm.id and ms.accepter = am.id;


-- 메세지 번호, 보낸 시간, 보낸id , 보낸이름 , 받은id , 받은사람    6컬럼
-- senddate 는  시분초까지 나오도록 (sendtime 컬럼명)
select msg.no, to_char(msg.senddate,'yyyy-mm-dd hh24:mi:ss') sendtime, msg.sender, sm.name sendername, msg.accepter, am.name accepter_name
from message msg, member sm, member am
where msg.sender = sm.id and msg.accepter = am.id;



