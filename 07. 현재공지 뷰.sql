--�� ����
-- ���� ���� ����
-- startdate<- sysdate <-enddate

select no, title, startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 ;

-- �����̺� ����
--������ ���� ���� ����
-- create view ���� �����
--grant create view to java01;


drop view notice_pres;

--view ���̺� ����

create or replace view notice_pres
as
select  title, content,startdate, enddate from NOTICE
where startDate <= sysdate and sysdate <= enddate+1 ;

-- view ���̺� ��ȸ
select * from notice_pres;