create or replace trigger notice_hook
after insert on notice
for each row
declare
    vno number := 1;
    vno_max number := (select count(*) from member);
begin 
for i in 1 .. (select count(*) from member)
     while vno <= vno_max loop
insert into message (no, content, sender, accepter)
values (MESSAGE_SEQ.nextval, '공지사항 확인하세요', 'admin', 'lee' );
        vno := vno + 1;
    end loop;
end;   
/ 

drop trigger notice_hook;
   
   
   
   
    select rownum rnum, id
    from( select id from member );
    
    
    select id from (select rownum rnum, id
    from( select id from member )) where rnum= 2;
    
    
     select id from (select rownum rnum, id from( select id from member )) where rnum= 2;
        
select id from (select rownum , id from( select id from member)) where rownum= 2;