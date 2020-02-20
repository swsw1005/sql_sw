set SERVEROUT on;

exec up_sal(7369,100);

select * from emp;
commit;

select * from board;

