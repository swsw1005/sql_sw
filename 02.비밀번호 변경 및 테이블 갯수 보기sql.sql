select * from tab;

--비밀번호 변경 : java00 -> 123
alter user java00 IDENTIFIED by 123;

alter user java00 IDENTIFIED by java00;