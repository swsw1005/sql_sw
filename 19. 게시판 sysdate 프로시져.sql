-- 실행해서 적용한 프로시저 만들기
CREATE OR REPLACE PROCEDURE notice_set_writeDate_sysdate
IS
BEGIN
    UPDATE notice set writeDate = sysdate;
END;
/


BEGIN
    -- 프로그램 작성
    DBMS_SCHEDULER.create_program(
        program_name => 'JAVA00.NOTICE_SET_SYSDATE_PROGRAM',
        program_action => 'JAVA00.NOTICE_SET_WRITEDATE_SYSDATE',
        program_type => 'STORED_PROCEDURE',
        number_of_arguments => 0,
        comments => '저장프로시저를 실행하는 프로그램',
        enabled => FALSE);
    -- 작성한 프로그램을 활성화
    DBMS_SCHEDULER.ENABLE(name=>'JAVA00.NOTICE_SET_SYSDATE_PROGRAM');   

    -- 스케쥴러 작성 - 일정만 작성
    DBMS_SCHEDULER.CREATE_SCHEDULE (
        repeat_interval  => 'FREQ=YEARLY;BYMINUTE=1',
        start_date=> TO_DATE('2020-02-21 17:42'),
        end_date=>NULL,
        comments => '공지사항 날짜세팅 스케쥴러',
        schedule_name  => 'NOTICE_SET_SYSDATE_SCHEDULE');
   
    -- 잡 작성 - 일정(schedule) + 처리(program)
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"JAVA00"."NOTICE_SET_SYSDATE_JOB"',
            program_name => '"JAVA00"."NOTICE_SET_SYSDATE_PROGRAM"',
            schedule_name => '"JAVA00"."NOTICE_SET_SYSDATE_SCHEDULE"',
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '작업을 만들어서 스케줄과 프로그램을 붙인다',
            job_style => 'REGULAR');
 
    -- 잡의 실행 로깅 모드를 셋팅한다.
    DBMS_SCHEDULER.SET_ATTRIBUTE(
             name => '"JAVA00"."NOTICE_SET_SYSDATE_JOB"',
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);

    -- 잡을 활성화 한다.     
    DBMS_SCHEDULER.enable(
             name => '"JAVA00"."NOTICE_SET_SYSDATE_JOB"');


END;
/