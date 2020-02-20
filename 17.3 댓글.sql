-- 댓글
select * from board where   no = 2;

select  * from board_rep where  no = 2;

update board b
set replycnt = (
    select  count(*)
    from board_rep br
    where
      br.no = b.no
  );
  
  
select   * from board;

select * from board_rep;
--------------------------------
  -- 댓글 달기 샘플
insert into board_rep (rno, no, content, writer, writedate)
values
  (BOARD_REP_SEQ.nextval, 2, 'ㅋㅋㅋㅋㅋㅋ', 'lee', sysdate);
commit;
-------------------------------
--  댓글달리면,  게시판테이블에서 replycnt 1증가
create or replace trigger board_rep_insert
    after insert on board_rep 
    for each row
begin
    update board set replycnt = replycnt + 1
    where  no = :new.no;
end;
/


--데이터가 변화된 후에 찾아오려면 new
--이미 있었던 데이터에서 찾으려면 old
-- delete는 이미 있는 데이터 지우는것. 
-->> old
--댓글 삭제
create or replace trigger board_rep_delete
-- 댓글 삭제
after delete on board_rep
--댓글을 삭제하면
for each row -- :new :old 이용하려면 작성 필요

begin
    --댓글수가 1감소
    update board set replycnt = replycnt -1
    where no = :old.no;
end;
/

select * from board_rep;
select * from board;
---지워지는지 확인해보자
delete from board_rep
where rno > 3 and rno <10 ;
--- 잘 지워지고,  trigger로  replycnt 정상적으로 까인다







----------------------