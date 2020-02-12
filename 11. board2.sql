drop table board2 cascade constraints;
----- board2 생성   
Create table board2(
    no Number Constraint board2_no_pk Primary Key, --Constraint : 제약 조건 이름 지정
    title Varchar2(300) Constraint board2_title_nn Not Null,
    content Varchar2(2000) Constraint board2_content_nn Not Null,
    writer Varchar2(30) Constraint board2_writer_nn Not Null,
    writeDate Date Default Sysdate,
    hit Number Default 0,
    replyCnt Number Default 0
);
create sequence board2_seq;


--1. list
select no, title, writer, writedate, hit
from board2
order by no desc;

--2. write
insert into board2(no, title, content, writer)
values( board2_seq.nextval, '제목', '내용','lee');
-- 시퀀스는 계속해서 늘어난다...지워진 글 까지 계속 이력.

--3. max(no)
insert into board2(no, title, content, writer)
values( (select nvl(max(no),0)
from board2) + 1, '제에목' ,'내애용','kim');


--3. view +   hit + 1

update board2 set hit = hit+1 where no = 1;
select no, title, content, writer, writedate, hit
from board2
where no = 1;


--4. update
update board2 set
title = '제목이다',
content = '내용이다',
writer = 'park'
where no =2 ;
commit;

--5. delete
delete board2 where no = 2;
-- 5.1 지워진 글번호  채워넣기 하는 경우
-- 실제로 잘 하지는 않는다.
update board2 set no = no-1 where no>2
-- 단점 : 글번호 자꾸 바뀌어서 의사소통 힘듬
-- 글번호 기준으로 댓글 조회하는데, 꼬인다







----------------------------