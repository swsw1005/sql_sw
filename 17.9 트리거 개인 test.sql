---트리거 trigger
--이벤트 발생 >> 자동 실행 처리문
-- 주문테이블
-- 회원만 주문가능(회원id 필수)
-- 판매직원 empno 입력가능
create table t_order2(
  no number,
  -- 주문번호
  ord_code varchar2(30),
  -- 주문명
  ord_date date,
  -- 주문날짜
  orderid varchar2(20) not null references member(id),
  -- 주문한 사람 id  . 공백 X  회원id 연동
  sellerno number references emp(empno) -- 판매한 직원empno   공백 가능
);
-- t_order 시퀀스
create sequence t_order2_seq;
-- 주문시간 설정하여, 그 안에서만 주문 받는다.
--  ==>>  자동으로 처리
--  ==>>  이벤트 : t_order에  insert
-- 처리되는 유형 : before
------- : 주문데이터를 등록하기 전에  시간체크하는 프로그램
create
or replace trigger t_order2 before
insert on t_order2 begin if(
    to_char (sysdate, 'HH24:mi') not between '09:00'
    and '18:00'
  ) then RAISE_application_error(-20100, '허용시간이 아닙니다.');
-- 9시~6시 사이에만 주문 가능. 그외 주문 불가
end if;
end;
/
insert into t_order2
values
  (
    t_order2_seq.nextval,
    '노트북',
    sysdate,
    'lee123',
    7788
  );
insert into t_order2
values
  (
    t_order2_seq.nextval,
    '컴퓨터',
    sysdate,
    'kim123',
    7788
  );
insert into t_order2
values
  (
    t_order2_seq.nextval,
    '이어폰',
    sysdate,
    'lee123',
    7788
  );
insert into t_order2
values
  (
    t_order2_seq.nextval,
    '핸드폰',
    sysdate,
    'kim123',
    7788
  );
--
  ------------------------------------
  --
  -- 특정 직원이 판매한 실적 조회
  create
  or replace PROCEDURE sil_juck (vsellerno t_order2.sellerno %type) is begin
select
  no,
  ord_code,
  ord_date
from t_order2
where
  sellerno = vsellerno;
commit;
end;
/ exec sil_juck(7788);
--------------------------------------------
------------------------------------