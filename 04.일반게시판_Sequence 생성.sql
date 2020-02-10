--일반게시판에 데이터 넣기
--글번호를 계속 증가(+)되는 객체를 사용 -> 시퀀스(교제 8장,11장)
--시퀀스의 다음 번호 받아내기 --> board_seq.nextval
Insert Into board(no, title, content, writer)
Values(1, 'oracle', 'oracle jjang', 'lee');

Insert Into board(no, title, content, writer)
Values(board_seq.nextval, 'oracle', 'oracle jjang', 'lee');

Commit;