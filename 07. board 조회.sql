
-- 작성자 lee 데이터 가져오기
select * from board
where writer = 'kim';
--0.005초


-- board에 있는 데이터를 다시 board에 입력
-- no는 nextval로
insert into board(no, title, content, writer) 
(select board_seq.nextval, title, content, writer from board);
-- 반복하면 복사하는 값이 계속 2배로...

-- number에 4자리 제한...삭제해보자
alter table board modify no number;


commit;

select count(*) from board;


--인덱스 생성  기준 writer
--unique index  인덱스 만드는 키값에  중복데이터 없음
-- db 튜닝에 중요함. 최우선
--중복값있는 컬럼은  일반 인덱스
drop index idx_board_writer;

create  index  idx_board_writer
On board(writer);
