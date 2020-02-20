---------------------------------------------
-- 0. 메세지 보내기
insert into message(no, content, sender, accepter)
values (message_seq.nextval, '행운의편지' , 'lee123', 'admin');
--------------------------------------------
---------------------------------------------
---확인----
select * from member;
---확인----
select * from message;
---------------------------------------------
---------------------------------------------
--  0. 최근 메세지 읽기
update message set acceptdate = sysdate
where accepter = 'admin' and no = 
    (
    select max(no) from message 
    where accepter='admin' and acceptdate is null
    );
-->> admin에게 온 메세지 중에 가장 최근 메세지를 읽는다
-- (=acceptdate = syssdate)

-- 0. 메세지 다시 읽기
update message set acceptdate = sysdate
where accepter = 'admin' and no = 
    (
    select max(no) from message 
    where accepter='admin'
    );
-----------------------------------------------
-----------------------------------------------
--1.  메시지 보내면 1 증가
create or replace trigger newMsg_send
after insert on message
    for each row
BEGIN
    update member set newMsgcnt = newMsgcnt +1
    where id = :new.accepter;
END;
/

---------------------------------------------
-----------------------------------------------
--2. 메세지 읽으면 1 감소
create or replace trigger newMsg_read
after update on message 
for each row

BEGIN
    update member set newmsgcnt = newmsgcnt - 1
    where id = :new.accepter;
END;
-- 문제점!!! 읽은날짜 업데이트 될때, 계속해서 숫자 까인다.
-- 해결방법 : message  acceptdate >> null 일때만 숫자 깐다.
/
---------------------------------------------
-----------------------------------------------
--2-1. 메세지 읽으면 1감소 (accpetdate  is null 일때만

create or replace trigger newMsg_read
before update on message 
for each row

declare
    vacceptdate message.acceptdate%type;
begin
    if( vacceptdate is null)
        then
        update member set newmsgcnt = newmsgcnt - 1
        where id = :new.accepter;
    end if;
end;
/
-----------------------------------------
-----------------------------------------------
-- newmsgcnt 초기화
update member set newmsgcnt =0;