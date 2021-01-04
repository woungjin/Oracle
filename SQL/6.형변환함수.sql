--����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

--��¥�� ���ڷ� ��TO_CHAR(��¥, ����)
select to_char(sysdate, 'YYYY-MM-DD') from dual; --��¥fmt ������ �빮�ڷ� ǥ��
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;
select to_char(sysdate, 'YY-MM-DD HH24:MI') from dual;
select to_char(sysdate, 'YYYY"��"MM"��"DD"��"') from dual; --��¥fmt������ �ƴϸ� ����� �Ұ����� ��� " "��� ǥ��
select first_name, to_char(hire_date, 'YYYY-MM-DD') from employees;

--���ڸ� ���ڷ� TO_CHAR(����, ����)
select to_char(20000, '99999999') from dual; -- 9�� �ڸ����� ǥ��
select to_char(20000, '999') from dual; -- �ڸ��� ������ ��� #���� ǥ����
select to_char(20000.21 , '99999' ) from dual; 
select to_char(20000.21 , '99999.99') from dual;
select to_char(salary, '$99,999' ) from employees; -- $ . ,�� ���ڿ��� ��밡���� fmt�����Դϴ�

-- ���ڸ� ���ڷ� TO_NUMBER(����, ����)
select '2000' + 2000 from dual; --�ڵ�����ȯ 
select to_number('2000') + 2000 from dual; --���������ȯ
select '$2000' + 2000 from dual; -- �������� $ , ���� Ư�� ���ڸ� ���ϰ� ���� ���� �ڵ�����ȯ�� �Ұ��մϴ� 
select to_number('$2000', '$9999') + 2000 from dual; --����fmt�� �����ϴ� ������ �������, ���������ȯ�� �����մϴ�.

-- ���ڸ� ���ڷ� ��TO_DATE(����, ����) 
select to_date('2020-03-31') from dual; --�̷� ���� �ٷ� ����� �����մϴ�.
select to_date('2020/12/12', 'YY/MM/DD') from dual; -- ��¥ fmt�� �̿��ؼ� ���浵 ����
select to_date('2020-03-21 12:23:03', 'YYYY-MM-DD HH:MI:SS') from dual; --��¥fmt�� �����ϴ� ������ �������, ����ȯ�� ����

-- ��NVL(������, null�ϰ�� ó���Ұ�) -null����
select nvl(null, 0) from dual;
select  first_name, 
        salary , 
        salary + salary * nvl(commission_pct, 0) --null������ ���� ��� null���� ������ �Ǵµ�,null�ΰ�� 0���κ����ؼ� ���
from employees;

-- ��NVL2(������, null�� �ƴѰ�� ó��, null�� ���ó��) -null����
select nvl2(null, '�ξƴ�', '��' ) from dual;
select first_name, 
       nvl2(commission_pct, 'true', 'false') 
from employees;

select first_name,
       nvl2(commission_pct, salary + salary * commission_pct, salary) as �����޿�
from employees;

-- DECODE(������, �񱳰�, ���, �񱳰�, ���) ��
select decode('E', 'A', 'A�Դϴ�',
                   'B', 'B�Դϴ�',
                   'C', 'C�Դϴ�',
                        'A, B, C�� �ƴմϴ�') 
from dual;

select job_id,
       salary,
       decode(job_id, 'IT_PROG', salary * 100,
                      'AD_VP', salary * 200,
                      'FI_MGR', salary * 300,
                                salary)
from employees;

-- case when then end
select job_id,
       salary,
       (case job_id when 'IT_PFOG' then salary * 100
                    when 'AD_VP' then salary * 200
                    when 'FI_MGR' then salary * 300
                    else salary
       end) 
from employees;

-----------��������------------
select  employee_id as num,
        concat(first_name, last_name) as name,
        hire_date,
        trunc((sysdate - hire_date) / 365) as �ټӳ��
from employees
where trunc((sysdate - hire_date) / 365) >= 10
order by �ټӳ��;

-- 100, 120, 121, 122
select first_name,
       manager_id,
       decode(manager_id, 100, '���',
                          120, '����',
                          121, '�븮',
                          122, '����',
                               '�ӿ�') as ����
from employees
where department_id = 50;








