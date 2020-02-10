-- 회원가입 : id, pw, name, gender, birth, email - 필수 입력
Insert Into member(id, pw, name, gender, birth, email)
values('test','1111','홍길동','남자','1990-10-01','test@naver.com');

-- 관리자 --> grade 항목이 추가되어야 한다.
Insert Into member(id, pw, name, gender, birth, email, grade)
values('admin','1111','관리자','여자','1990-10-01','test@naver.com', 9);

-- 완전적용
-- commit : 승인 -> DB에 완전 적용
commit;
