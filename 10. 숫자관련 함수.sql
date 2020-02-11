--숫자 관련 함수
-- 소숫점 관련 함수

select 1234.567, 
    round(1234,567) a1,     -- 1234
    round(1234.567,2) a2,   -- 1234.57
    round(1234.567,-2) a3,  -- 1200
    round(-1234,567) a4     -- -1234
    from dual;
    
    
select 1234.567
    trunc(1234,567),    --
    trunc(-1234,567),   --
    trunc(1234,567,2),  --
    trunc(-1234.567,-2) --
from dual;
    
select 1234.567,       --
    floor(1234.567),    --
    floor(-1234.567)    --
from dual;
    
    
select 7/3, '7 mode 3', mod(7,3) from dual;

select power (3,3) from dual;
    
    -----------------------