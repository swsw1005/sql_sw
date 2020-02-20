--admin의 새로운 메세지 갯수 구하기
--  admin  accepter이고, 받은날짜 null  >> count

select count(*) newmsg from message
where accepter = 'admin' and acceptdate is null;


---------------------------------------------
insert into message(no, content, sender, accepter)
values (message_seq.nextval, '이 편지는 영국에서 시작되어' , 'lee123', 'admin');
---------------------------------------------

-- join
-- id, name, tel, gradeno, gradename, msgcnt 불러온다.
select m.id, m.name, m.tel, m.gradeno, g.gradename, 
(select count(*) newmsg from message
where accepter = 'admin' and acceptdate is null) msgcnt
from member m, grade g
where (id='admin') and (m.gradeno = g.gradeno);


-- 애당초 멤버테이블 만들때,  newMsgCnt 컬럼.
-- Trigger 이용하여 자동으로 증감처리
-- 데이터 많아지면  유용한  DB 튜닝 기법

--새로운 카운트를 각 회원별 전체 계산해서 넣기
update member m 
set newMsgCnt
= (select count(*) from message ms where m.id =ms.accepter);

commit;