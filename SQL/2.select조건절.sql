select * from employees;

-- ������ where�� between, in, like
select first_name, last_name from employees where job_id = 'IT_PROG';
select * from employees where last_name = 'King'; --����
select * from employees where department_id = 90;
select * from employees where salary >= 15000; --15000���� ū ���
select * from employees where salary <> 15000; --15000�� �ƴ� ���
select * from employees where hire_date = '04/01/30'; --��¥Ÿ�Ե� ���������� ��ȸ

-- between������
select * from employees where salary between 10000 and 12000; -- 10000�̻�~12000����
select * from employees where salary >= 10000 and salary <= 12000; --10000�̻�~12000����
select * from employees where hire_date between '03/01/01' and '03/12/31'; --��¥������ �񱳰� �����մϴ�.

-- in ������ (����� Ư������ �� �Ҷ� ���)
select * from employees where manager_id in(100, 101, 102);
select * from employees where job_id in('AD_VP', 'FI_MGR', 'SA_MAN');

-- like������ (%�� ���, _�� �������� ��ġ�� ã�Ƴ� ��)
select first_name || ' ' || last_name, hire_date from employees where hire_date like '03%'; --03���� �����ϴ�
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%15'; --15�� ������
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%05%'; --05�� ���Ե�
select first_name || ' ' || last_name, hire_date from employees where hire_date like '___05%';--05��
select email from employees where email like '_A%';

-- is null, is not null (null�� ��ȸ)
select * from employees where manager_id is null;
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

-- and, or (and�� or���� �켱������ ����)
select * from employees where department_id = 100 and salary >= 5000;
-- �� ����� �ٸ�
select * from employees where job_id = 'IT_PROG' or job_id = 'FI_MGR' and salary >= 6000;
select * from employees where (job_id = 'IT_PROG' or  job_id = 'FI_MGR') and salary >= 6000;


--������ ���� (select������ ���� �������� ���ϴ�)
select * from employees order by hire_date asc; --��������
select * from employees order by hire_date desc; --��������
select * from employees where job_id = 'IT_PROG' order by first_name asc;
select * from employees where salary >= 5000 order by employee_id desc;
-- alias�� order by ���� ������ �� �ֽ��ϴ�.
select first_name, salary * 12 as pay from employees order by pay asc;



