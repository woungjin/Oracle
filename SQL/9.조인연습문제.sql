----���� ��������----
--���� 1.
---EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
---EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)
select count(*)
from employees e
inner join departments d
on e.department_id = d.department_id;

--���� 2.
---EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
select 
    concat(first_name, last_name) as name,
    e.department_id
from employees e
inner join departments d
on e.department_id = d.department_id
where employee_id = 200;
--���� 3.
---EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��
select * from jobs;
select 
    concat(first_name, last_name) as name,
    e.job_id,
    j.job_title
from employees e
inner join jobs j
on e.job_id = j.job_id
order by name;

--���� 4.
----JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
select *
from jobs j1
left outer join job_history j2
on j1.job_id = j2.job_id;

--���� 5.
----Steven King�� �μ����� ����ϼ���.
select 
    first_name || ' ' || last_name as name,
    d.department_name
from employees e
join departments d
on e.department_id = d.department_id;
--���� 6.
----EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ��乮��
select count(*)
from employees e
cross join departments d;

--���� 7.
----EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�,
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
select 
    e.employee_id as �����ȣ,
    first_name || ' ' || last_name as �̸�,
    e.salary as �޿�,
    d.department_name as �μ���,
    d.location_id as �ٹ�����ȣ
from employees e
left outer join departments d
on e.department_id = d.department_id
where job_id = 'SA_MAN';

--���� 8.
---- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.
select *
from employees e
left outer join jobs j
on e.job_id = j.job_id
where job_title in ('Stock Manager', 'Stock Clerk');

--���� 9.
---- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
select 
    d.department_id,
    d.department_name
from departments d
left outer join employees e
on d.department_id = e.department_id
where employee_id is null;
--���� 10.
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
select 
    e1.employee_id,
    e1.first_name || ' ' || e1.last_name as name,
    e1.manager_id,
    e2.first_name || ' ' || e2.last_name as manager_name
from employees e1
left outer join employees e2
on e1.manager_id = e2.employee_id;
--���� 11.
----6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
----�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
select 
    e1.first_name, --����
    e1.manager_id, --�Ŵ������̵�
    e2.first_name || ' ' || e2.last_name as �������̸�,
    e2.salary as �����ڱ޿�
from employees e1
left outer join employees e2
on e1.manager_id = e2.employee_id
where e1.manager_id is not null
order by e2.salary desc;


