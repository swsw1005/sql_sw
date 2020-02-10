-- 테이블 제거 - 제약 조건과 상관없이 지운다. : Foreign key
drop table member cascade CONSTRAINTS;

-- 데이터 저장 객체 : 테이블
-- 컬럼 데이터 특성: 문자열 - varchar2(길이), 숫자 - number, 날짜 - date
-- Oracle 10g에서 Oracle 11g 버전으로 바뀌면서 한글 3바이트
-- **** 제약조건
-- 데이터들을 식별할 수 있는 컬럼 -> primary key -> id
-- 꼭 입력을 해야 하는 항목 (not null) -> pw, name, gender, email
-- 성별은 "남자", "여자"만 입력 가능
-- 이메일은 중복되면 안된다.
CREATE TABLE member(
    id varchar2(20) PRIMARY KEY,
    pw varchar2(20) NOT NULL,
    name varchar2(30) NOT NULL,
    birth date,
    gender varchar2(6) NOT NULL CHECK(gender in('남자','여자')),
    tel varchar2(13),
    email varchar2(50) NOT NULL UNIQUE , -- 010-7676-6236
    photo varchar2(50)
);

