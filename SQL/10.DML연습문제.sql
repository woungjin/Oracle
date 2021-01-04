-------DML�� ��������-------
--����1
--280���� null 1800
--290ȸ��� null 1800
--300���� 301 1800
--310�λ� 302 1800
--320���� 303 1700
select * from depts;
insert into depts(department_id, department_name, location_id) values(280, '����', 1800);
insert into depts values(290, 'ȸ���', null, 1800);
insert into depts values(300, '����', 301, 1800);
insert into depts values(310, '�λ�', 302, 1800);
insert into depts values(320, '����', 303, 1800);

--����2
update depts set department_name = 'IT bank' where department_name = 'IT Support';
update depts set manager_id = 301 where department_id =290;
update depts set department_name = 'IT Help', manager_id =  303, location_id = 1800 where department_name = 'IT Helpdesk';
update depts set manager_id = 301 where manager_id in (301, 302, 303 );

--����3
select * from depts where department_name = '����';
select * from depts where department_name = 'NOC';
delete from depts where department_id = 320;
delete from depts where department_id = 220;

--����4
delete from depts where department_id > 200;
update depts set manager_id = 100 where manager_id is not null;
select * from depts;
---4. Departments���̺��� �Ź� ������ �Ͼ�� ���̺��̶�� �����ϰ� Depts�� ���Ͽ�
--��ġ�ϴ� ��� Depts�� �μ���, �Ŵ���ID, ����ID�� ������Ʈ �ϰ�
--�������Ե� �����ʹ� �״�� �߰����ִ� merge���� �ۼ��ϼ���
merge into depts a
    using (select * from departments) d
    on (a.department_id = d.department_id)
when matched then
    update set a.department_name = d.department_name,
               a.manager_id = d.manager_id,
               a.location_id = d.location_id
when not matched then
    insert values(d.department_id,
                  d.department_name,
                  d.manager_id,
                  d.location_id);
select * from depts;
--����5
--IT_DEV ����Ƽ������ 6000 20000
--NET_DEV ��Ʈ��ũ������ 5000 20000
--SEC_DEV ���Ȱ����� 6000 19000
--1. jobs_it �纻 ���̺��� �����ϼ��� (������ min_salary�� 6000���� ū �����͸� �����մϴ�)
--2. jobs_it ���̺� ���� �����͸� �߰��ϼ���
--3. jobs_it�� Ÿ�� ���̺� �Դϴ�
--4. jobs���̺��� �Ź� ������ �Ͼ�� ���̺��̶�� �����ϰ� jobs_it�� ���Ͽ�
--min_salary�÷��� 0���� ū ��� ������ �����ʹ� min_salary, max_salary�� ������Ʈ �ϰ� ���� ���Ե�
--�����ʹ� �״�� �߰����ִ� merge���� �ۼ��ϼ���

select * from jobs_it;
create table jobs_it as (select * from jobs where min_salary > 6000);
insert into jobs_it values('IT_DEV', '����Ƽ������', 6000, 20000 );
insert into jobs_it values('NET_DEV', '��Ʈ��ũ������', 5000, 20000 );
insert into jobs_it values('SEC_DEV', '���Ȱ�����', 6000, 19000 );

merge into jobs_it a
    using(select * from jobs where min_salary > 0) b
    on(a.job_id = b.job_id)
when matched then
    update set a.min_salary = b.min_salary,
               a.max_salary = b.max_salary
when not matched then
    insert values(b.job_id,
                  b.job_title,
                  b.min_salary,
                  b.max_salary);

select * from jobs_it;

commit;
