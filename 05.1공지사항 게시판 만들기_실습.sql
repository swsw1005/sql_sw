Drop table notice cascade constraints;

Drop Sequence notice_seq;

Create table notice(
    no Number constraint notice_no_pk Primary Key,
    title Varchar(300) constraint notice_title_nn Not Null,
    content Varchar(2000) constraint notice_content_nn Not Null,
    startDate date Default sysdate,
    endDate date Default '9999-12-30',
    writeDate date Default sysdate,
    updateDate date Default sysdate
);

Create SEQUENCE notice_seq