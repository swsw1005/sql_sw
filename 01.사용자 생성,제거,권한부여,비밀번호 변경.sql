--관리자 명령어 실행 가능
--1. 사용자 생성
create user java00 identified by java00;
--2. 사용자에게 권한을 부여해서 작업을 할수 있도록 해줘야 한다.
GRANT CONNECT, RESOURCE TO java00;
--3. 사용자 비밀번호 바꾸기
alter user sys identified by q1w2e3;

--4. 사용자 제거
Drop User java00 Cascade;