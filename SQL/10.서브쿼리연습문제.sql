----��������----16������
--���� 1.
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
---EMPLOYEES ���̺��� job_id�� IT_PFOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
select avg(salary) as salary from employees;
select *
from employees
where salary > (select avg(salary) as salary from employees);
--2
select count(*)
from employees
where salary > (select avg(salary) as salary from employees);
--3
select avg(salary) as salary from employees where job_id = 'IT_PROG';
select *
from employees
where salary > (select avg(salary) as salary from employees where job_id = 'IT_PROG');

--���� 2.
--DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
select department_id from departments where manager_id = 100;
select *
from employees
where department_id = (select department_id from departments where manager_id = 100);
--���� 3.
---EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
---EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
select manager_id from employees where first_name = 'Pat';
select *
from employees
where manager_id > (select manager_id from employees where first_name = 'Pat');

select manager_id from employees where first_name = 'James';
select *
from employees
where manager_id in (select manager_id from employees where first_name = 'James');
--���� 4.
---EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
select *
from(select rownum as rn,
           first_name
     from (select *
          from employees order by first_name desc
     )
) where rn > 40 and rn <= 50;

--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ,
--�Ի����� ����ϼ���
select *
from(select rownum as rn,
       employee_id,
       first_name
    from(select * 
        from employees 
        order by hire_date
    )
) where rn >30 and rn <= 40;
--���� 6.
--employees���̺� departments���̺��� left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
--����) �������̵� ���� �������� ����
select 
    employee_id,
    first_name || ' ' || last_name as name,
    e.department_id,
    d.department_name
from employees e
left join departments d
on e.department_id = d.department_id
order by employee_id;
--���� 7.
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
select 
    employee_id,
    first_name || ' ' || last_name as name,
    e.department_id,
    (select department_name from departments d where e.department_id = d.department_id )
from employees e
order by employee_id;


--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
select d.department_id,
       d.department_name,
       d.manager_id,
       d.location_id,
       l.street_address,
       l.postal_code,
       l.city
from departments d
left outer join locations l
on d.location_id = l.location_id;
--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
select d.department_id,
       d.department_name,
       d.manager_id,
       d.location_id,
       (select street_address from locations l where d.location_id = l.location_id)  as zz,
       (select postal_code from locations l where d.location_id = l.location_id) as yy,
       (select city from locations l where d.location_id = l.location_id) as xx
from departments d;
--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����
select l.location_id,
       l.street_address,
       l.city,
       l.country_id,
       c.country_name
from locations l
left outer join countries c
on l.country_id = c.country_id
order by country_name;
--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
select l.location_id,
       l.street_address,
       l.city,
       l.country_id,
       (select country_name from countries c where l.country_id = c.country_id) as country_name
from locations l
order by country_name;

--���� 12.
--employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
select *
from (select rownum as rn,
       employee_id,
       name,
       hire_date,
       department_id,
       department_name
       from (select employee_id, 
                     concat(first_name, last_name) as name,
                     hire_date,
                     d.department_id,
                     d.department_name
              from employees e
              left outer join departments d
              on e.department_id = d.department_id
              order by hire_date
        )
) where rn > 0 and rn <= 10;

--���� 13.
----EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID,
--DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���
select 
    a.last_name,
    a.job_id,
    d.*
from(select *
     from employees
     where job_id = 'SA_MAN'
) a
left join departments d
on a.department_id = d.department_id;
--���� 14
----DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
----�ο��� ���� �������� �����ϼ���.
----����� ���� �μ��� ������� ���� �ʽ��ϴ�.

select d.*,
       e.total
from (select department_id, 
             count(*) as total
      from employees 
      group by department_id) e
join departments d
on e.department_id = d.department_id;


--���� 15
----�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���
----�μ��� ����� ������ 0���� ����ϼ���
select department_id,
       department_name,
       street_address,
       postal_code,
       salary
from (select d.department_id,
           d.department_name,
           d.location_id,
           nvl(salary, 0) as salary
      from departments d
      left outer join (select department_id, 
                              trunc(avg(salary)) as salary
                       from employees 
                       group by department_id ) e
      on d.department_id = e.department_id
      ) a
left outer join locations l
on a.location_id = l.location_id;


--���� 16
---���� 15����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
--����ϼ���
select *
from (select rownum as rn,
             department_id,
             department_name,
             location_id,
             street_address,
             postal_code,
             salary
       from (select d.*,
                    l.street_address,
                    l.postal_code,
                    nvl(e.salary, 0) as salary
              from departments d
              left outer join (select department_id, 
                                      trunc(avg(salary)) as salary
                               from employees 
                               group by department_id ) e
              on d.department_id = e.department_id
              left outer join locations l
              on d.location_id = l.location_id
              order by d.department_id desc
        )
)where rn <=20;


