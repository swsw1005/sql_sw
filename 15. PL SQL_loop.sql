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