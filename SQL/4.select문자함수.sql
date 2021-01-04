-- lower - (�ҹ���), upper - (�빮�ڷ�), initcap - (ù���ڴ빮��)
select 'abcDEF', lower('abcDEF'), upper('abcDEF'), initcap('abcDEF') from dual;
select * from employees;
select last_name, lower(last_name), upper(last_name), initcap(last_name) from employees;
select last_name from employees where lower(last_name) = 'bull'; --where���ǿ��� �Լ��� ������ ������

--length() - ����, instr - ���ڰ˻�
select first_name, 
       length(first_name) as ����, 
       instr(first_name, 'a') as ������ġ 
from employees;
select length('abc'), instr('abcdefg', 'a') from dual;

--substr() - ���ڿ��ڸ���, concat() - ���ڿ����̱�
select substr('abcdef', 1, 3), concat('abc', 'def') from dual;
select first_name, substr(first_name, 1, 3), concat(first_name, last_name) from employees; 

-- LPAD, RPAD - �¿��� �������ڿ��� ä���
select lpad('abc', 10, '*') from dual; --10ĭ�� ���ʺ���� *
select rpad('abc', 10, '*') from dual; --10ĭ�� �����ʺ���� *
select lpad(first_name, 10, '-'), rpad(first_name, 10, '-') from employees;

-- LTRIM, RTRIM, TRIM - ��������, ��������
select ltrim('javascript_java', 'java') from dual; --���ʿ��� java��������
select rtrim('javascript_java', 'java') from dual; --�����ʿ��� java��������
select trim('   java   ') from dual; --��������

-- REPLACE - ���ڿ� ġȯ
select replace('my dream is president', 'president', 'programmer' )  from dual;
select replace('my dream is president', ' ', '' ) from dual; 
select ltrim(replace(replace('my dream is president', 'president', 'programmer'), ' ', ''), 'my')
from dual;

-------------------��������--------------------
select rpad( substr(first_name, 1, 3) , length(first_name), '*') as name,
       lpad( salary, 10, '*') as salary,
       job_id
from employees
where lower(job_id) = 'it_prog';

select concat(first_name, last_name) as �̸�,
       replace(hire_date, '/', '') as �Ի�����
from employees
order by �̸� asc;

select concat( '(02)', substr(phone_number, 4, length(phone_number) ) ) as phone_number
from employees;






