-- ���տ����� ���ÿ��� �÷������� �����ϰ� ����ϴ�.
-- ���տ����� union(������ �ߺ�x), union all(������ �ߺ�o)
select employee_id, first_name from employees where hire_date like '04%' --04�� �Ի���
union
select employee_id, first_name from employees where department_id = 20; -- �μ���ȣ 20

select employee_id, first_name from employees where hire_date like '04%'
union all
select employee_id, first_name from employees where department_id = 20;

-- intersect (������), minus (������)
select employee_id, first_name from employees where hire_date like '04%'
minus --intersect
select employee_id, first_name from employees where department_id = 20;

-- union all�� ����� ���̵����� 
select 'ȫ�浿' as name, '20200211' as year from dual union all
select '�̼���', '20200321' from dual union all
select '������', '20190231' from dual union all
select '�̼���', '20180301' from dual;





