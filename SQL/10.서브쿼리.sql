/*
��������
--������ () �ȿ� �����, ���������� �������� 1�� ���Ͽ��� �մϴ�.
--������������ ���� �ؼ��ϸ� �˴ϴ�.

--������ �������� - ������������ ����� �� ���� ������ ��.
*/
-- ������ �߿� ���ú��� �޿��� ���� ��� 
select salary from employees where first_name = 'Nancy'; --������ �޿�
select *
from employees
where salary > (select salary from employees where first_name = 'Nancy');

--employee_id�� 103�� ����� job_id�� ������ ����� ã�ƶ�.
select job_id from employees where employee_id = 103;
select *
from employees
where job_id = (select job_id from employees where employee_id = 103);

-- ���������� ���� ���� ��������� �Ϲ� �񱳿������δ� ������ �� �����ϴ�.
select job_id from employees where job_id = 'IT_PROG';
select *
from employees
where job_id = (select job_id from employees where job_id = 'IT_PROG');

-- ���������� ���� ���� ���������, ������ �񱳿����ڸ� ����մϴ�.
-- �μ����̵� 60, 80�� �����
select department_id from employees where first_name = 'David';
select *
from employees
where department_id in (select department_id from employees where first_name = 'David' );
-- �޿��� 4800, 6800, 9500 �� �����
select salary from employees where first_name = 'David';
select *
from employees
where salary in (select salary from employees where first_name = 'David');
-- �޿��� 4800���� ū �����
select *
from employees
where salary > any (select salary from employees where first_name = 'David');
-- �޿��� 9500���� ���� �����
select *
from employees
where salary < any (select salary from employees where first_name = 'David');
-- �޿��� 9500���� ū �����
select *
from employees
where salary > all (select salary from employees where first_name = 'David');
-- �޿��� 4800���� ���� �����
select *
from employees
where salary < all (select salary from employees where first_name = 'David');

-- ��Į�� �������� ( select�� �ȿ� ���������� ���� ��, left join�� ���� ���)
select * from departments;
select * from employees;
select first_name, 
       (select department_name from departments d where e.department_id = d.department_id )
from employees e
order by first_name asc;

select first_name,
       department_name
from employees e
left outer join departments d
on e.department_id = d.department_id;

--�ζ��� �� (from���� ���������� ���� ��)
--���������� ������ �߻�.
select rownum, first_name, salary
from employees
where rownum <= 10
order by salary;
--rownum�� 1������ ��ȸ�� �����մϴ�.
select 
    rownum,
    first_name,
    salary
from (select *
      from employees
      order by salary desc
) where rownum >= 10 and rownum <= 20; 
--�� ������ �ٽ��ѹ� �ζ��κ� �������� ����
select * 
from (select 
        rownum as rn,
        first_name,
        email,
        hire_date,
        salary
       from (select *
          from employees
          order by salary desc
       )
) where rn > 10 and  rn <= 50;

--�ζ��� �� (03��01�� �����͸� ����)
--1.���� ���� select������, �ʿ��� ���̺� ������ ���� (alias, rownum ���)
--2.�ٱ� select������ �÷��� ���.
select *
from (
    select to_char(to_date(test, 'YY/MM/DD'), 'MMDD' ) as mm,
           name
    from (
        select 'ȫ�浿' as name, '20200211' as test from dual union all
        select '�̼���', '20200301' from dual union all
        select '������', '20200501' from dual union all
        select '������', '20200226' from dual union all
        select '�̼���', '20200301' from dual
    )
) where mm = '0301';

