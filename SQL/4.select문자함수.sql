-- lower - (소문자), upper - (대문자로), initcap - (첫글자대문자)
select 'abcDEF', lower('abcDEF'), upper('abcDEF'), initcap('abcDEF') from dual;
select * from employees;
select last_name, lower(last_name), upper(last_name), initcap(last_name) from employees;
select last_name from employees where lower(last_name) = 'bull'; --where조건에도 함수의 적용이 가능함

--length() - 길이, instr - 문자검색
select first_name, 
       length(first_name) as 길이, 
       instr(first_name, 'a') as 포함위치 
from employees;
select length('abc'), instr('abcdefg', 'a') from dual;

--substr() - 문자열자르기, concat() - 문자열붙이기
select substr('abcdef', 1, 3), concat('abc', 'def') from dual;
select first_name, substr(first_name, 1, 3), concat(first_name, last_name) from employees; 

-- LPAD, RPAD - 좌우측 지정문자열로 채우기
select lpad('abc', 10, '*') from dual; --10칸중 왼쪽빈공간 *
select rpad('abc', 10, '*') from dual; --10칸중 오른쪽빈공간 *
select lpad(first_name, 10, '-'), rpad(first_name, 10, '-') from employees;

-- LTRIM, RTRIM, TRIM - 공백제거, 문자제거
select ltrim('javascript_java', 'java') from dual; --왼쪽에서 java문자제거
select rtrim('javascript_java', 'java') from dual; --오른쪽에서 java문자제거
select trim('   java   ') from dual; --양측제거

-- REPLACE - 문자열 치환
select replace('my dream is president', 'president', 'programmer' )  from dual;
select replace('my dream is president', ' ', '' ) from dual; 
select ltrim(replace(replace('my dream is president', 'president', 'programmer'), ' ', ''), 'my')
from dual;

-------------------연습문제--------------------
select rpad( substr(first_name, 1, 3) , length(first_name), '*') as name,
       lpad( salary, 10, '*') as salary,
       job_id
from employees
where lower(job_id) = 'it_prog';

select concat(first_name, last_name) as 이름,
       replace(hire_date, '/', '') as 입사일자
from employees
order by 이름 asc;

select concat( '(02)', substr(phone_number, 4, length(phone_number) ) ) as phone_number
from employees;






