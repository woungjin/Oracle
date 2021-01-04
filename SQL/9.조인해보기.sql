/*
���ο����ϱ�
CREATE TABLE INFO 
(
  ID NUMBER NOT NULL 
, TITLE VARCHAR2(50) 
, CONTENT VARCHAR2(100) 
, REGDATE DATE DEFAULT sysdate 
, USER_ID VARCHAR2(50) 
, CONSTRAINT INFO_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

CREATE TABLE AUTH 
(
  USER_ID VARCHAR2(50) NOT NULL 
, NAME VARCHAR2(50) 
, JOB VARCHAR2(50) 
, CONSTRAINT AUTH_PK PRIMARY KEY 
  (
    USER_ID 
  )
  ENABLE 
);
*/

select * from info;
select * from auth;

--inner join
select * 
from info inner join auth on info.user_id = auth.user_id;
-- select������ �ʿ��� �÷� ����
-- ���� ���̺� ������ �̸����� �����ϴ� �÷��� ������ ���� ���ǰ� ��ȣ�ϴ� �� ������ ����մϴ�.
-- �̷� ��� ���̺��̸�.�÷� ���� ��Ī�ؼ� ������ ��ȸ�� �����մϴ�.
select id, 
       title, 
       content, 
       regdate, 
       name, 
       job,
       auth.user_id
from info inner join auth on info.user_id = auth.user_id;

-- ���̺� ��Ī�� �̿��ؼ� join�� �� �� �ֽ��ϴ�.
-- ���ο� ����� ���ؼ� where������ ���˴ϴ�.
select id,
       title,
       content,
       regdate,
       name,
       job,
       i.user_id
from info i 
inner join auth a 
on i.user_id = a.user_id
where name = 'ȫ�浿';

--�ƿ��� ���� left outer, right outer, full outer
select * from info i left outer join auth a on i.user_id = a.user_id;
select * from info i right outer join auth a on i.user_id = a.user_id;
select * from info i full outer join auth a on i.user_id = a.user_id; --�������� �������� ��� �پ ���
select * from info i cross join auth a; --�߸��� ������ ������ ��� (cartesian product)

--������ 3�� ���̺� ���� �մϴ�. Ű ���� ã�Ƽ� ������ �����ؼ� ���� �˴ϴ�.
select * from employees;
select * from departments;
select * from locations;

select *
from employees e
left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id;

-- ���̺� auth�� info���� ����� a, i �� �̿��ؼ� left join - job�÷��� DBA�� ����� ID, TITLE, CONTENT, JOB�� ���
-- right join���� �޶����� ����� Ȯ��.
select id,
       title,
       content,
       job
from auth a
left outer join info i
on i.user_id = a.user_id
where job = 'DBA';

select id,
       title,
       content,
       job
from auth a
right outer join info i
on a.user_id = i.user_id
where job = 'DBA';


select * from employees;

--self join (�ϳ��� ���̺� ����� Ű������ ����)
select *
from employees e1
left outer join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id;







