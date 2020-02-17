-- 1. 게시판 리스트
select no, title, writer, writedate, hit from board order by no desc;

select no, title, writer, to_char(writedate, 'yyyy-mm-dd HH24:MI:ss') writedate, hit from board order by no desc;

-- 2. 게시판 글 입력

insert into board(no, title, content, writer)
values ( board_seq.nextval, '제목' , '내애용' , 'kim');

-- 3. 게시판 글 보기
select no, title, content, writer, writedate, hit from board
where no=41;
update board set hit=hit+1 where no=41;

-- 4. 게시판 글 수정
update board set title='제목고친다', content='펑' where no = 13;

-- 4.1. 최신글 수정
select * from board where no= (select max(no) from board);

-- 5. 게시판 글 삭제
delete from board where no=13;



--페이지에 맞는 데이터 가져오기
-- 순서대로 rownum 메기고,  1~10번까지 가져오기
select no, title, writer, writedate, hit
from(

    select rownum rnum, no, title, writer, writedate, hit
    from (
        select no, title, writer, writedate, hit from board
        order by no desc
    )
)
where rnum between 1 and 10;




---------------------------