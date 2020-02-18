--loop를 이용한 반복문 처리 p599
declare
    no number := 0;-- 변수 선언 + 초기값
    
begin
    loop
    dbms_output.put_line(no || '%');
    no := no+1;
    exit when no>100;
    end loop;
    dbms_output.put_line('download Complete');
    dbms_output.put_line('system off');
end;
/

---------------------
----------------------
----------------------
--loop를 이용한 반복문 처리 p599  
--whlie loop
declare
    no number := 0;-- 변수 선언 + 초기값
    
begin
    while no <=100 loop
    dbms_output.put_line(no || '%');
    no := no+1;
    end loop;
    dbms_output.put_line('download Complete');
    dbms_output.put_line('system off');

end;
/



---------------------
----------------------
----------------------
--loop를 이용한 반복문 처리 p599  
--for 
-- 반복횟수 고정 >>  for 문
-- 반복횟수 변동 >> while 문
begin
    for no in 150 .. 200 loop
    dbms_output.put_line(no || '%');
    end loop;
    dbms_output.put_line('download Complete');
    dbms_output.put_line('system off');

end;
/


-