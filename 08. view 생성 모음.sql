-- ���� ��ȿ�� ������ ����
create or replace view notice_pres
as
select  title, content,startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 ;

-- ���� ��ȿ�� ������ ���� + �ֽŰ�������
create or replace view notice_pres
as
select  title, content,startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 
order by startdate desc;


--lee �Խñ� �ֽű� ����
create or replace view board_lee
as
select  title, content,writedate,hit from board
where writer = 'lee' 
order by writedate desc;


--park �Խñ� �ֽű� ����
create or replace view board_park
as
select  title, content,writedate,hit from board
where writer = 'park' 
order by writedate desc;


--kim �Խñ� �ֽű� ����
create or replace view board_kim
as
select  title, content,writedate,hit from board
where writer = 'kim' 
order by writedate desc;


