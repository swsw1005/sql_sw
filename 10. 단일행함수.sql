--단일행 함수

-- 첫글자 대문자로 가져오기
select initcap(title) from board;

-- all 대문자로 가져오기
select upper(title) from board;
--all 소문자로 가져오기
select lower(title) from board;
-- all 대문자로 가져오기
select upper( 'ABCdefGHI') from dual;
-- all 소문자로 가져오기
select lower( 'ABCdefGHI') from dual;
-- title>"제목",  title 글자 길이 > "제목길이"  
select title 제목, length(title) 제목길이 from board;
--알파벳 1글자    한글 1글자
select length ('abc'), length('홍길동') from dual;

-- concate 함수
select concat(no,title) from board;
--concate는 2개 밖에 못묶는다.
select concat(no, concat(title, writedate)) from board;

select '[' || no || ']' || title "no title" from board;

select no+1000 from board;

select length( max(no)) from board;

select lpad(no, 4, 0) nono from board;


select substr('대한민국',1,2) from dual;    --대한
select substr('대한민국',-1,2) from dual;   --국
select substr('대한민국',2,2) from dual;    --한민
select substr('대한민국',3,2) from dual;    --민국

select substrb('대한민국',1,6) from dual;   --대한
select substrb('대한민국',2,6) from dual;   -- 한
select substrb('대한민국',3,6) from dual;   -- 한
select substrb('대한민국',4,6) from dual;   --한민
select substrb('대한민국',5,6) from dual;   -- 민
select substrb('대한민국',6,6) from dual;   -- 민
select substrb('대한민국',7,6) from dual;   --민국


select '가나다라마바사', instr('가나다라마바사' , '나다') 나다num from dual;


select no, title, content, startdate, enddate from notice
where instr(title, '이트') > 0;


