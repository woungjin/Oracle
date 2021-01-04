--��������
select * from employees;
--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
select employee_id, first_name, hire_date, salary from employees;
--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
select first_name || ' ' || last_name as name from employees;
--3. 50�� �μ� ����� ��� ������ ����ϼ���.
select * from employees where department_id = 50;
--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
select first_name, department_id, job_id from employees where department_id = 50;
--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
select first_name, salary, salary + 300 from employees;
--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
select first_name, salary from employees where salary >= 10000;
--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
select first_name, job_id, commission_pct from employees where commission_pct is not null;
--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
select first_name, hire_date, salary from employees where hire_date between '03/01/01' and '03/12/31'; --6��
--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
select first_name, hire_date, salary from employees where hire_date like '03%';
--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���.
select first_name, salary from employees order by salary desc;
--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
select first_name, salary from employees where department_id = 60 order by salary desc;
--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
select first_name, job_id from employees where job_id in ('IT_PROG', 'SA_MAN');
--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
select first_name || ' ' || last_name || '�޿���' || salary || '�޷� �Դϴ�'  from employees where last_name = 'King' and first_name = 'Steven';
--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
select first_name || ' ' || last_name, job_id from employees where job_id like '%MAN%'; 
--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
select first_name || ' ' || last_name, job_id from employees where job_id like '%MAN%' order by job_id asc;
