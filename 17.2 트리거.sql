---트리거 trigger
--이벤트 발생 >> 자동 실행 처리문
create table t_order(
  no number,
  -- 주문번호
  ord_code varchar2(30),
  -- 주문명
  ord_date date -- 주문날짜
);
-- t_order 시퀀스
create sequence t_order_seq;
-- 주문시간 설정하여, 그 안에서만 주문 받는다.
--  ==>>  자동으로 처리
--  ==>>  이벤트 : t_order에  insert
-- 처리되는 유형 : before
------- : 주문데이터를 등록하기 전에  시간체크하는 프로그램
create or replace trigger t_order 
before insert on t_order 
begin 
        if(
        to_char (sysdate, 'HH24:mi') not between '14:40'
        and '14:42'
      ) then RAISE_application_error(-20100, '허용시간이 아닙니다.');
    -- 14:40 ~ 14:42 사이에만 주문 가능. 그외 주문 불가
        end if;
end;
/
insert into t_order
values
  (t_order_seq.nextval, '노트북', sysdate);
--------------------------------------------