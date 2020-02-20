---------------------------------------------
insert into message(no, content, sender, accepter)
values (message_seq.nextval, '행운의편지' , 'lee123', 'admin');
---------------------------------------------

update message set acceptdate = sysdate
where accepter = 'admin' and no = 
    (
    select max(no) from message 
    where accepter='admin' and acceptdate is null
    );
-->> admin에게 온 메세지 중에 가장 최근 메세지를 읽는다
-- (=acceptdate = syssdate)

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
---확인----
select * from member;

---------------------------------------------

--2. 메세지 읽으면 1 감소

create or replace trigger newMsg_read
after update on message 
for each row

BEGIN
    update member set newmsgcnt = newmsgcnt - 1
    where id = :new.accepter;
END;
/

