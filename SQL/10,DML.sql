--insert
desc departments;
--1. insertù��° ���(��� �÷� �����͸� �ѹ��� ����)
insert into departments values(280, 'developer', null, 1700);
select * from departments;
rollback; -- ���������� �ڷ� �ǵ���

--2. insert�ι�° ���(���� �÷��� �����ϰ� ����)
insert into departments(department_id, department_name, location_id ) values(280, '������', 1700);
select * from departments;

insert into departments values(300, 'DBA', 200, 1800);
insert into departments(department_id, department_name ) values (290, '����������');
select * from departments;

rollback;
--3. �������� �������� insert
--�纻���̺�
create table managers as( select employee_id, first_name, job_id, salary, hire_date from employees where 1 = 2);
select * from managers;

insert into managers(employee_id, first_name, job_id, salary, hire_date) 
(select employee_id, first_name, job_id , salary, hire_date from employees where department_id = 60);

--update����
--�纻���̺�
create table emps as (select * from employees);
select * from emps;
update emps set salary = 100000;
rollback;
update emps set salary = 100000 where employee_id = 100; --100���� ����(pk�� �̿�)
update emps set salary = salary * 0.1 + salary where employee_id = 100;
update emps set manager_id = 100 where employee_id = 100;
update emps set phone_number = '031.123.1234' , manager_id = 102 where employee_id = 100;

--update��������
update emps set salary = (select 1000 from dual) where employee_id = 100;
update emps set 
    (salary, phone_number) = (select salary, phone_number from emps where employee_id = 101) 
where employee_id = 100;

rollback;

--delete����(�����ÿ� �ݵ�� ������, �ٸ����̺��� �����͸� �����ϰ� ������ ���� �Ұ����մϴ�)
alter table emps add CONSTRAINT emps_emp_id_pk PRIMARY key (employee_id); --employee_id PK����
alter table emps add CONSTRAINT emps_manager_fk foreign key (manager_id) REFERENCES emps (employee_id); --manager_id FK����

delete from emps where employee_id = 100;
select * from emps;

--�纻���̺�
create table depts as (select * from departments);
select * from depts;

delete from depts where department_id = 10;

--delete(��������)
select  department_id from emps where employee_id = 100;
delete from depts where department_id = (select department_id from emps where employee_id = 100); -- 90��
delete from depts where department_id = (select department_id from emps where employee_id = 101); 

select * from depts;
rollback;


--MERGE(���̺� ���� �߰��� ����� ��쿡, ���� ������ ���̺��� ����� ����, ���ؼ� �߰�, ���������� ��������ִ� ���)
create table emps_it as (select * from employees where 1 = 2);

insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id)
values (105, '���̺��', '��', 'davidkim', '06/06/06', 'IT_PROG');

select * from emps_it;

merge into emps_it a -- Ÿ�����̺�
    using (select * from employees where job_id = 'IT_PROG') b --���α���
    on (a.employee_id = b.employee_id) --a���̺�� b���̺��� ��������
when matched then --���ǿ� ��ġ�� ���(�����Ͱ� �ִ� ��� Ÿ�����̺� ����)
    update set a.phone_number = b.phone_number,
               a.salary = b.salary,
               a.commission_pct = b.commission_pct,
               a.manager_id = b.manager_id,
               a.department_id = b.department_id
when not matched then --���ǿ� ��ġ���� ���� ���(Ÿ�� ���̺� ����)
    insert values(b.employee_id,
                  b.first_name,
                  b.last_name,
                  b.email,
                  b.phone_number,
                  b.hire_date,
                  b.job_id,
                  b.salary,
                  b.commission_pct,
                  b.manager_id,
                  b.department_id);
select * from emps_it;   

----�ǽ�----
insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id) 
values(102, '����', 'Ŵ', 'lex', '01/04/06','AD_VP');
insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id) 
values(102, '�ϳ�', 'Ŀ', 'nian', '20/04/06','AD_VP');

--employees ���̺��� �Ź� �����Ǵ� ���̺��̶�� �����ϰ�,
--���������ʹ� email, phone, salary, manager_id, department_id�� ������Ʈ �ǵ��� ó��
--���� ���Ե� �����ʹ� �׳� �״�� ���� �߰�
select * from emps_it;


merge into emps_it a
    using (select * from employees) b
    on (a.employee_id = b.employee_id)
when matched then
    update set a.email = b.email,
               a.phone_number = b.phone_number,
               a.salary = b.salary,
               a.manager_id = b.manager_id,
               a.department_id = b.department_id
    --delete where b.employee_id = 105            
when not matched then
        insert values(b.employee_id,
                  b.first_name,
                  b.last_name,
                  b.email,
                  b.phone_number,
                  b.hire_date,
                  b.job_id,
                  b.salary,
                  b.commission_pct,
                  b.manager_id,
                  b.department_id);















