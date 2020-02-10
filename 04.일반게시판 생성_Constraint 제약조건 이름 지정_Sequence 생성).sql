-- 6. 게시판 테이블 제거
Drop Table board Cascade Constraints;
-- 시퀀스 제거 ( 아래에 Create가 생기면 위에는 Drop이 생긴다 )
Drop SEQUENCE board_seq;

-- 게시판 테이블 생성
Create table board(
    no Number Constraint board_no_pk Primary Key, --Constraint : 제약 조건 이름 지정
    title Varchar2(300) Constraint board_title_nn Not Null,
    content Varchar2(2000) Constraint board_content_nn Not Null,
    writer Varchar2(30) Constraint board_writer_nn Not Null,
    writeDate Date Default Sysdate,
    hit Number Default 0,
    replyCnt Number Default 0
);

--게시판 글번호에 사용할 시퀀스 생성
Create SEQUENCE board_seq;