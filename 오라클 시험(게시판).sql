--�� ����

--1. �Խ��� ����Ʈ����
select no, title, writer, writeDate, hit 
from board order by no desc;

--2. �Խ��� �۾���
insert into board(no, title, content, writer)
values(board_seq.nextval, 'java', 'java content', 'kim');

--3. �Խ��� �ۺ���	��ȸ�� 1����
--	��� ���� ����
select no, title, content, writer, writeDate, hit 
   from board;

update board set hit = hit+1 where no = �۹�ȣ;

--4. �Խ��� �� ����
update board set 
   title = 'oracle',
   content = 'java content', 
   writer='kim'
   where no = �۹�ȣ;

--5.�Խ��� �� ����
delete from board where no = �۹�ȣ;




--����Ŭ 1~14  sql ����

--select	1��
--SQL ������ �Լ�	2��
--SQL ������ �Լ�	3��
--JOIN = ����Ű	4��
--DML		6�� 
 --(insert update delete)
--Transation  	6��
--����query	10��
--������query	12�� x



