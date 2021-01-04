/*
view�� �������� �ڷḸ �������ؼ� ����� �� �ִ� �������̺��� �����Դϴ�.
��� �������̺��̱� ������ �ʿ��� �÷��� ������ �θ� ������ ��ȸ�� ���������ϴ�.
��� ������ �����Ͱ� ���������� ����� ���´� �ƴմϴ�. (�������̺��� ������� ���˴ϴ�)
�׷��� �信 DML�۾��� �ϰ� �Ǹ� ���� ���̺� ������ �˴ϴ� ( �ٸ�, ��������� ���� �����ϴ�)
*/

select * from user_sys_privs; --�������� ����Ȯ��

--�ܼ��� - �ϳ��� ���̺��� ��������� ��
create view view_emp
as (select employee_id,
           first_name,
           last_name,
           job_id,
           salary from employees);

select * from view_emp;

--���պ� - �������̺��� �����Ͽ� �ʿ��� �����͸� ������ ����
create view view_emp_dept_job
as (select e.employee_id,
           first_name || ' ' || last_name as name,
           d.department_name,
           j.job_title
    from employees e
    left outer join departments d
    on e.department_id = d.department_id
    left outer join jobs j
    on e.job_id = j.job_id
    );

select * from view_emp_dept_job;

--���� ���� create or replace view �����̸�
create or replace view view_emp_dept_job
as (select e.employee_id,
           first_name || ' ' || last_name as name,
           d.department_name,
           j.job_title,
           e.salary,
           l.street_address
    from employees e
    left outer join departments d
    on e.department_id = d.department_id
    left outer join jobs j
    on e.job_id = j.job_id
    left outer join locations l
    on d.location_id = l.location_id);
    
select * from view_emp_dept_job;
-- ���պ�� �ʿ��� ������ ������ �ߴٸ� �������� ��ȸ�� ����
select job_title, avg(salary), sum(salary), count(salary)
from view_emp_dept_job
group by job_title
order by avg(salary);

-- �� ����
drop view view_emp;
drop view view_emp_dept_job;

/*
view�� insert, update, delete�� �Ͼ�� ��쿡 �������̺��� �ݿ��� �˴ϴ�.
�׸��� ���� ��������� �ֽ��ϴ�. �׳� �������̺� DML����� ���.
*/
select * from view_emp_dept_job;
select * from view_emp;
desc employees;
--name�� ���� �̶� insert�� �ȵ˴ϴ�
insert into view_emp_dept_job values(300, 'test', 'test', 'test');
--join���̺��� ��쿡�� update, insert�� �ȵ˴ϴ�.
insert into view_emp_dept_job(employee_id, department_name, job_title) values(300, 'test', 'test');
--�������̺��� not null���Ƕ����� insert�� �ȵ˴ϴ�.
insert into view_emp(employee_id, first_name, salary) values(300, 'test', 10000);

-- ���� �������
-- with check option
create view view_emp_test
as (select employee_id,
           first_name,
           last_name,
           email,
           hire_date,
           job_id,
           department_id
    from employees
    where department_id = 60)
with check option;
-- department_id�� ���� �Ұ�
update view_emp_test set department_id = 100; 

-- with read only
create or replace view view_emp_test
as (select employee_id,
           first_name,
           last_name,
           email,
           hire_date,
           job_id,
           department_id
    from employees
    where department_id = 60)
with read only; --�б� ���� ��
--��� CRUD�۾� ����
update view_emp_test set department_id = 100;






