--���� �Լ� 
--round - �ݿø�, trunc - ����
select round(34.145, 2), round(34.145), round(34.145, -1) from dual;
select trunc(34.145, 2), trunc(34.145), trunc(34.145, -1) from dual;

-- ��¥ �Լ�
select sysdate from dual; --�����
select systimestamp from dual; --����� �ú��� �ð���
-- ��¥ ����
select sysdate + 3 from dual;
select sysdate - 3 from dual;
select sysdate - hire_date from employees; --�ϼ�
select (sysdate - hire_date) / 7 from employees; -- ��
select (sysdate - hire_date) / 365 from employees; -- ��

-- ��¥ �ݿø�, ����
select trunc(sysdate - hire_date) from employees;
-- Ư�������������� ��¥ ����
select trunc(sysdate, 'year') from dual; --�� �������� ����
select trunc(sysdate, 'month') from dual; -- �� �������� ����
select trunc(sysdate, 'day') from dual; -- �� �������� ���� (�ش����� �Ͽ���) 






