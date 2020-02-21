-- 스케줄러
-- 휴면계정 처리, 장바구니 비우기 등등
begin

    dbms_scheduler.create_job(
    
    job_name =>'"JAVA00"."NOTICE_SET_SYSDATE"',
    job_type =>'PLSQL_BLOCK',
    job_action=>'UPDATE NOTICE SET WRITEDATE = SYSDATE',
    number_of_arguments => 0,
    start_date => sysdate,
    end_date => null,
    repeat_interval => 'FREQ=MINUTELY;INTERVAL=1',
    auto_drop => false,
    enabled => false,
    comments => '1분마다 한번씩 현재날짜 시간으로 공지사항의 작성일 수정'
    );
    
    dbms_scheduler.set_attribute(
    name => '"JAVA00"."NOTICE_SET_SYSDATE"',
    attribute => 'STORE_OUTPUT',
    value => TRUE
    );
    
    dbms_scheduler.set_attribute(
    name => '"JAVA00"."NOTICE_SET_SYSDATE"',
    attribute => 'LOGGING_LEVEL',
    value => dbms_scheduler.LOGGING_off
    );
    
    -- job 활성화
    
    dbms_scheduler.enable(
        name => '"JAVA00"."NOTICE_SET_SYSDATE"'
    );
    
end;
/


select no, title, to_char(writedate, 'yyyy-mm-dd hh24:mi:ss')  from notice
;


