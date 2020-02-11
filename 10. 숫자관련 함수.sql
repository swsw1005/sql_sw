--숫자 관련 함수
-- 소숫점 관련 함수

select 1234.567, 
    round(1234,567) a1,     -- 1234
    -- 소수점 버린다
    round(1234.567,2) a2,   -- 1234.57
    -- 소수점 아래 2자리 반올림
    round(1234.567,-2) a3,  -- 1200
    -- 소수점 위 2자리 반올림
    round(-1234,567) a4     -- -1234
    -- 소수점 버린다
from dual;
    
-- TRUNC    n자리 까지 살리고 절삭
select 1234.567,
    trunc(1234,567),    -- 1234
    trunc(-1234,567),   -- -1234
    trunc(1234.567,2),  -- 1234.56
    trunc(-1234.567,-2) -- -1200
from dual;


--CEIL , FLOOR   정수로 올림, 내림
select
    ceil(123.456),  -- 124
    floor(123.456)  -- 123
from dual;
    
    
-- MOD  나머지 값
select 7/3, '7 mode 3', mod(7,3) from dual;


-- ABS
select abs(123.456), abs(-123.456) from dual;
-- 123.456  123.456


--  SQRT
select sqrt(123.456) from dual;


-- POWER
select power (3,4) from dual;
-- 3의 4제곱


-- SIGN
select  sign(-10), sign(0), sign(10) from dual;
--  음수 -1   0 = 0   양수 1




    
    -----------------------